alias gbg="gb | grep $1"
alias di="docker ps | fzf | awk '{print $1}' | xargs docker inspect"
