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
    exec tmux new -A -s ssh
  else
    exec tmux new -A -s local
  end
end
