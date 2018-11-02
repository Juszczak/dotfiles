#!/usr/bin/env bash

for i in {0..255}; do
  if ((i < 10)); then
    printf " "
  fi
  if ((i < 100)); then
    printf " "
  fi

  printf "\x1b[38;5;${i}mcolour${i}\x1b[0m  "
  if ! ((i % 12)); then
    echo ""
  fi
done
echo ""
