#!/usr/bin/env bash

if ! [ -z "$TMUX" ]; then
  alias vim="reattach-to-user-namespace vim"
  alias mvim="reattach-to-user-namespace mvim"

  alias pbcopy="reattach-to-user-namespace pbcopy"
  alias pbcopy="reattach-to-user-namespace pbpaste"
fi

alias lock="pmset displaysleepnow"
