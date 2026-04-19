if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

function _load_completion() {
    local cmd=$1
    local cache=~/.cache/zsh/${cmd}_completion
    if [[ ! -f $cache || $(command $cmd version --short 2>/dev/null) != $(cat ${cache}.version 2>/dev/null) ]]; then
        mkdir -p ~/.cache/zsh
        command $cmd completion zsh > $cache
        command $cmd version --short 2>/dev/null > ${cache}.version
    fi
    source $cache
}
_load_completion kubectl
_load_completion helm

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
