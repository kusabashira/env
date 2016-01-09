__cdf_list_directories() {
  local src="${CDF_SRC:-$HOME/.cdf_src}"
  if [[ ! -f $src ]]; then
    echo "cdf: $src: No such file or directory" >&2
    return 2
  fi

  shopt -s globstar
  local IFS=$'\n'
  for path in $(cat "$src"); do
    [[ -d $path ]] && printf '%s\n' "$path"
  done
}

cdf() {
  local dir=
  case "$#" in
    0)
      local filter="${CDF_FILTER:-peco}"
      if [[ -z $(type "${filter%% *}" 2>/dev/null) ]]; then
        echo "cdf: ${filter%% *}: command not found" >&2
        return 2
      fi
      dir="$(__cdf_list_directories | $filter)"
      ;;
    *)
      dir="$(__cdf_list_directories | grep -F "$1" | head -1)"
      ;;
  esac
  if [[ ! -d "$dir" ]]; then
    return 1
  fi
  cd "$dir"
}

_cdf() {
  local src="${CDF_SRC:-$HOME/.cdf_src}"
  if [[ ! -f $src ]]; then
    return 1
  fi

  local query="${COMP_WORDS[COMP_CWORD]}"
  local dir="$(__cdf_list_directories | grep -F "$query" | head -1)"
  if [[ -n $dir ]]; then
    COMPREPLY=( "$dir" )
    compopt -o nospace
  fi
}

complete -F _cdf cdf
