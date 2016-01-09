cdr() {
  local dir=
  case $# in
    0) dir="$(find . -type d | grep -v '/\.git/' | ${CDR_FILTER:-peco})" ;;
    *) dir="$(find . -type d | grep -v '/\.git/' | grep -F "$1" | head -1)" ;;
  esac
  [[ -d "$dir" ]] && cd "$dir"
}

_cdr() {
  local query="${COMP_WORDS[COMP_CWORD]}"
  local dir="$(find . -type d | grep -v '/\.git/' | grep -F "$query" | head -1)"
  COMPREPLY=( "$dir" )
  compopt -o nospace
}

complete -F _cdr cdr
