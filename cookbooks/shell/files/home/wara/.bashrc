# system bashrc
[ -f /etc/bashrc ] && . /etc/bashrc

# misc
for misc in ~/.bash/*; do
  [ -f "$misc" ] && . "$misc"
done

# vars
export PS1='$ '
export EDITOR='vim'
export GOPATH="$HOME/work/go"

# bind
bind -x '"\C-j": "vim"'
bind '"\C-x\C-l": " | less\C-m"'
bind '"\C-x\C-v": " | vim -\C-m"'
bind '"\C-x\C-x": "\C-asudo \C-e\C-m"'

# alias
gc() {
  git commit -m "$*"
}
ga() {
  git commit -am "$*"
}
md() {
  [ $# -eq 0 ] && exit 2
  mkdir -p "$1" && cd "$1"
}
alias e='$EDITOR'
alias ls='ls --color=auto'
alias la='ls -la'
alias owd='xdg-open "$(pwd)"'
alias htog="perl -i -pe's#https://(.*?)/#git@\1:#' .git/config"
alias gtoh="perl -i -pe's#git@(.*?):#https://\1/#' .git/config"
alias reedit='$EDITOR ~/.bashrc'
alias resource="source ~/.bashrc"

# path
PATH="$HOME/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$(echo "$PATH" | sed 's/:/\n/g' | awk '!a[$0]++' | paste -sd:)"
export PATH
