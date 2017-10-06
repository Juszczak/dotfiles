#!/usr/bin/env bash

if ! [ -z "$TMUX" ]; then
  alias vim="reattach-to-user-namespace vim"
  alias mvim="reattach-to-user-namespace mvim"
fi
