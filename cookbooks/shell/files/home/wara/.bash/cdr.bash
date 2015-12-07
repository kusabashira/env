cdr() {
  if [ "$#" -ge 1 ]; then
    cd "$1"
    return
  fi
  local dir="$(find . -type d | grep -v "\.git" | peco)"
  if [ -d "$dir" ]; then
    cd "$dir"
  fi
}

_cdr() {
  local query="${COMP_WORDS[COMP_CWORD]}"
  local dir="$(find . -type d | grep -v "\.git" | grep "$query" | head -1)"
  COMPREPLY=( "$dir" )
  compopt -o nospace
}

complete -F _cdr cdr
