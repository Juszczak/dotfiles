#!/usr/bin/env bash

declare runtime_path="$HOME/Library/ApplicationSupport/iTerm2/iterm2env/versions/3.7.2/bin/python3"
declare script_path="$HOME/_/io/juszczak/dotfiles/.utils/iterm/tab.py"

"$runtime_path" "$script_path" "${@}"
