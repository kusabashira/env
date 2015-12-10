#system bashrc
[ -f /etc/bashrc ] && . /etc/bashrc

#misc
for misc in ~/.bash/*; do
  [ -f "$misc" ] && . "$misc"
done

#vars
export PS1='$ '
export EDITOR='vim'
export GOPATH="$HOME/work/go"

#bind
bind '"\C-x\C-l": " | less"'
bind '"\C-x\C-v": " | vim -"'

#alias
gc() {
  git commit -m "$*"
}
ga() {
  git commit -am "$*"
}
alias e='$EDITOR'
alias la='ls -la'
alias baw='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias htog="perl -i -pe's#https://(.*?)/#git@\1:#' .git/config"
alias gtoh="perl -i -pe's#git@(.*?):#https://\1/#' .git/config"
alias reedit='$EDITOR ~/.bashrc'
alias resource="source ~/.bashrc"

#path
PATH="$HOME/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$(echo "$PATH" | sed 's/:/\n/g' | awk '!a[$0]++' | paste -sd:)"
export PATH
