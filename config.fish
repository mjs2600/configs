keychain ~/.ssh/id_rsa
. ~/.keychain/*-fish
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'danhper/fish-ssh-agent'
fundle plugin 'oh-my-fish/plugin-direnv'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'oh-my-fish/plugin-rustup'
fundle plugin 'oh-my-fish/plugin-python'
fundle plugin 'derekstavis/fish-neovim'
fundle plugin 'belltoy/plugin-mix'
fundle plugin 'belltoy/plugin-iex'
fundle plugin 'oh-my-fish/plugin-cd'
fundle plugin 'oh-my-fish/plugin-fasd'
fundle plugin 'oh-my-fish/plugin-archlinux'

source ~/.asdf/asdf.fish
starship init fish | source

set -gx EDITOR nvim

if status --is-interactive; and test -z "$TMUX"
  if test -n "$SSH_CONNECTION"
    exec tmux new -A -s (hostname)
  else
    exec tmux new -A -s local
  end
end

# Created by `pipx` on 2021-03-24 14:21:05
set PATH $PATH /home/michael/.local/bin

direnv hook fish | source

# Aliases
alias m4b-tool='docker run -it --rm -u (id -u):(id -g) -v (pwd):/mnt m4b-tool'
