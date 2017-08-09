#!/usr/bin/env bash

# LS_COLORS generated from ~/.dircolors
function __eval_dircolors {
  dircolors=~/.dircolors
  if [ -f "$dircolors" ]; then
    eval "$("gdircolors" "-b" "$dircolors")"
  fi
  unset "dircolors"
}

__eval_dircolors;

alias ls="gls --color=always -F"
