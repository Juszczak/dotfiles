#!/usr/local/bin/bash

function __source {
  if [ -f "$1" ]; then
    # shellcheck source=/dev/null
    source "$1"
  fi
}

function __load_scripts {
  local -a filenames=(
    "path"
    "aliases"
    "core"
    "exports"
    "dependencies"
    "dircolors"
    "env"
    "prompt"
  )
  for file in "${filenames[@]}"
  do
    __source "$HOME/.bash/$file.sh"
  done

  __source "/usr/local/etc/bash_completion"
}

__load_scripts
