#!/usr/bin/env bash
#
# Merges this repo's Claude Code settings fragment into ~/.claude/settings.json
# without clobbering entries written there by third-party installers.
#
#   - top-level keys from the fragment win over the existing ones
#   - hooks are additive: a hook command already present is never duplicated,
#     and hooks this repo does not manage are left untouched
#
# Idempotent: running it twice produces the same file.

set -euo pipefail

FRAGMENT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/settings.fragment.json"
TARGET="${CLAUDE_SETTINGS:-$HOME/.claude/settings.json}"
BACKUP="$TARGET.dotfiles-bak"

die() { printf 'install-settings: %s\n' "$1" >&2; exit 1; }

command -v jq >/dev/null 2>&1 || die "jq no esta instalado"
[[ -f "$FRAGMENT" ]] || die "no encuentro el fragmento: $FRAGMENT"
jq empty "$FRAGMENT" >/dev/null 2>&1 || die "el fragmento no es JSON valido: $FRAGMENT"

mkdir -p "$(dirname "$TARGET")"

if [[ -e "$TARGET" ]]; then
    [[ -f "$TARGET" ]] || die "$TARGET existe pero no es un fichero regular"
    jq empty "$TARGET" >/dev/null 2>&1 \
        || die "$TARGET no es JSON valido; no lo toco. Arreglalo o muevelo y vuelve a ejecutar."
fi

# Deep-merge everything but .hooks (fragment wins), then append only the hook
# commands that are not already registered for that event.
read -r -d '' PROGRAM <<'JQ' || true
($frag[0]) as $f
| (. * ($f | del(.hooks))) as $merged
| reduce (($f.hooks // {}) | to_entries[]) as $ev (
    $merged;
    .hooks[$ev.key] = (
      ((.hooks[$ev.key]) // []) as $existing
      | ($existing | [.[].hooks[]?.command]) as $have
      | $existing + [
          $ev.value[]
          | .hooks = [ .hooks[]? | select(([.command] - $have) | length > 0) ]
          | select((.hooks | length) > 0)
        ]
    )
  )
JQ

tmp="$(mktemp "$TARGET.XXXXXX")"
trap 'rm -f "$tmp"' EXIT

if [[ -f "$TARGET" ]]; then
    cat "$TARGET"
else
    echo '{}'
fi | jq --slurpfile frag "$FRAGMENT" "$PROGRAM" > "$tmp"

jq empty "$tmp" >/dev/null 2>&1 || die "el merge produjo JSON invalido; no escribo nada"

if [[ -f "$TARGET" ]]; then
    if cmp -s "$TARGET" "$tmp"; then
        echo "Claude settings: ya estaban al dia ($TARGET)"
        exit 0
    fi
    cp -p "$TARGET" "$BACKUP"
    chmod --reference="$TARGET" "$tmp"
else
    chmod 644 "$tmp"
fi

mv "$tmp" "$TARGET"
trap - EXIT
echo "Claude settings: fragmento aplicado en $TARGET"
