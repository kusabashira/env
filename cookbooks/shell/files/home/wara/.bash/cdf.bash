__cdf_list_directories() {
  local src="${CDF_SRC:-$HOME/.cdf_src}"
  if [[ ! -f $src ]]; then
    echo "cdf: $src: No such file or directory" >&2
    return 2
  fi

  shopt -s globstar
  local IFS=$'\n'
  for path in $(cat "$src"); do
    [[ -d $path ]] && printf '%q\n' "$path"
  done
}

cdf() {
  if [[ $# -ge 1 ]]; then
    cd "$1"
    return
  fi

  local src="${CDF_SRC:-$HOME/.cdf_src}"
  if [[ ! -f $src ]]; then
    echo "cdf: $src: No such file or directory" >&2
    return 2
  fi

  local filter="${CDF_FILTER:-peco}"
  if [[ -z $(type "${filter%% *}" 2>/dev/null) ]]; then
    echo "cdf: ${filter%% *}: command not found" >&2
    return 2
  fi

  local dir="$(__cdf_list_directories | $filter)"
  if [[ ! -d $dir ]]; then
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
  local dir="$(__cdf_list_directories | grep "$query" | head -1)"
  if [[ -n $dir ]]; then
    COMPREPLY=( "$dir" )
    compopt -o nospace
  fi
}

complete -F _cdf cdf
