#system bashrc
[ -f /etc/bashrc ] && . /etc/bashrc

#vars
export PS1='$ '
export GOPATH="$HOME/work/go"

#alias
alias ls='ls --color'
alias la='ls -la'
alias er='vim `find . -type f | grep -v "/\.git" | peco`'
alias cdr='cd `find . -type d | grep -v "/\.git" | peco`'
alias htog="perl -i -pe's#https://(.*?)/#git@\1:#' .git/config"
alias gtoh="perl -i -pe's#git@(.*?):#https://\1/#' .git/config"
alias resource="source ~/.bashrc"

#path
PATH="$GOPATH/bin:$PATH"
PATH="$(echo "$PATH" | sed 's/:/\n/g' | awk '!a[$0]++' | paste -sd:)"
export PATH
