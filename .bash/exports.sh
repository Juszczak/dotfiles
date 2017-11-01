#!/usr/bin/env bash

# Make vim the default editor.
export EDITOR='vim';

# export COLORTERM=truecolor

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Set up custom python interactive shell prompt
export PYTHONSTARTUP="$HOME/.python/startup.py"

# Rust sources path
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
