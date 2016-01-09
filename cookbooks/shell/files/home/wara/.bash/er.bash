er() {
  local files=()
  case $# in
    0) files=( $(find . -type f | grep -v '/\.git/' | ${ER_FILTER:-peco}) ) ;;
    *) files=( $(find . -type f | grep -v '/\.git/' | grep -F "$1" | head -1) ) ;;
  esac
  [[ ${#files[@]} != 0 ]] && ${EDITOR:-vim} "${files[@]}"
}

_er() {
  local query="${COMP_WORDS[COMP_CWORD]}"
  local file="$(find . -type f | grep -v '/\.git/' | grep -F "$query" | head -1)"
  COMPREPLY=( "$file" )
  compopt -o nospace
}

complete -F _er er
