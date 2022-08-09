alias t='echo "tmux attach -t base || tmux new -s base"; tmux attach -t base || tmux new -s base'
alias l='ls -l'
alias ll='ls -alF'
alias c='echo "git commit -m"; git commit -m'
alias s='echo "git status"; git status'
alias a='echo "git add -p"; git add -p'
alias p='echo "git push"; git push'
alias update='sudo pacman -Sy --noconfirm archlinux-keyring;sudo pacman -Syu --noconfirm; rustup update; yay -Syu'
alias vim=nvim
