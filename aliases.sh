# AUTO-GENERATED from aliases.toml by scripts/gen_aliases.py.
# Edit aliases.toml and run `just gen-aliases` (or `just tend`).

have() { command -v "$1" >/dev/null 2>&1; }

have tmux && alias t='tmux new -As local'
have tmux && alias ta='tmux attach -t'
have tmux && alias tl='tmux list-sessions'
have tmux && alias tk='tmux kill-session -t'
have nvim && alias v='nvim'
have nvim && alias vi='nvim'
have bat && alias cat='bat'
have fd && alias find='fd'
have rg && alias grep='rg'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gp='git pull'
alias gP='git push'
alias gco='git checkout'
alias gcm='git commit -m'

unset -f have
