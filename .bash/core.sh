#!/usr/local/bin/bash

# case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# append to the Bash history file, rather than overwriting it
shopt -s histappend;

# autocorrect typos in path names when using `cd`
shopt -s cdspell;

# enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

set -o vi
