prompt_context() {
 if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
   prompt_segment green black "%(!.%{%F{yellow}%}.)$USER"
 fi
}