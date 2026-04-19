export NVM_DIR="$HOME/.nvm"
function nvm() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && nvm "$@" }
function node() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && node "$@" }
function npm() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && npm "$@" }
function npx() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && npx "$@" }
