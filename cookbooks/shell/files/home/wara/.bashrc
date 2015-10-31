#system bashrc
[ -f /etc/bashrc ] && . /etc/bashrc

#alias
alias er='vim `find . -type f | grep -v "/\.git" | peco`'
alias cdr='cd `find . -type d | grep -v "/\.git" | peco`'
alias htog="perl -i -pe's#https://(.*?)/#git@\1:#' .git/config"
alias gtoh="perl -i -pe's#git@(.*?):#https://\1/#' .git/config"

#vars
export PS1='λ '
export GOPATH="$HOME/work/go"

#path
PATH="$GOPATH/bin:$PATH"
PATH="$(echo "$PATH" | sed 's/:/\n/g' | awk '!a[$0]++' | paste -sd:)"
export PATH
