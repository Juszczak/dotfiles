#!/usr/bin/env bash

declare tab="tab"
declare lift="$HOME/_/io/juszczak/dotfiles/.utils/lift/lift.js"
declare -a services=("ws" "core" "ext" "svt" "vaadin" "log")

function __run_all {
  for service in "${services[@]}"
  do
    eval "$tab $($lift "$service")"
  done
}

function __kill_all {
  for service in "${services[@]}"
  do
    eval "$tab -q $service"
  done
}

function __run {
  if [ "$1" == 'all' ]
  then
    __run_all
  else
    eval "$tab $($lift "$1")"
  fi
}

function __kill {
  if [ "$1" == 'all' ]
  then
    __kill_all
  else
    eval "$tab -q $1"
  fi
}

if [ "$1" == 'run' ]
then
  __run "${@:2}"
fi

if [ "$1" == 'kill' ]
then
  __kill "${@:2}"
fi

unset runtime_path script_path lift services
