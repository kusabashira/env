er() {
  local editor="${EDITOR:-vim}"
  if [ "$#" -ge 1 ]; then
    "$editor" "$1"
    return
  fi
  local files=( $(find . -type f | grep -v "\.git" | peco) )
  if [ "${#files[@]}" -ge 1 ]; then
    "$editor" "${files[@]}"
  fi
}

_er() {
  local query="${COMP_WORDS[COMP_CWORD]}"
  local file="$(find . -type f | grep -v "\.git" | grep "$query" | head -1)"
  COMPREPLY=( "$file" )
  compopt -o nospace
}

complete -F _er er
