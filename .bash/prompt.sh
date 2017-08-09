#!/usr/local/bin/bash

function __wrapper {
  # wrap the text in $1 with $2 and $3, only if $1 is not empty
  # $2 and $3 typically contain non-content-text, like color escape codes and separators

  [[ -n "$1" ]] || return 1
  printf "%s" "${2}${1}${3}"
}

function __ps1 {
  local prefix empty_prefix joiner is_prompt_empty=1
  prefix="${b_bg}${b_fg}${b_bg}${space}"
  joiner="${b_fg}${b_bg}${space}"

  # section "b" header
  empty_prefix="${b_fg}${b_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

  # section "b" slices
  __wrapper "$USER" "$prefix" "$space" && {
    prefix="$joiner";
    is_prompt_empty=0;
  }

  # section "a" header
  prefix="${a_bg}${a_fg}${a_bg}${space}"
  joiner="${a_fg}${a_bg}${space}"
  empty_prefix="${a_fg}${a_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

  # section "a" slices
  __wrapper "$(__branch)" "$prefix" "$space" && {
    prefix="$joiner";
    is_prompt_empty=0;
  }

  # section "c" header
  prefix="${c_bg}${c_fg}${c_bg}${space}"
  joiner="${c_fg}${c_bg}${space}"
  empty_prefix="${c_fg}${c_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

  # section "c" slices
  __wrapper "$(__cwd)" "$prefix" "$space" && {
    prefix="$joiner";
    is_prompt_empty=0;
  }

  printf "%s" "${reset_bg}$reset$space"
}

function __ps1_short {
  local prefix empty_prefix joiner is_prompt_empty=1
  prefix="${b_bg}${b_fg}${b_bg}${space}"
  joiner="${b_fg}${b_bg}${space}"

  empty_prefix="${b_fg}${b_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

  __wrapper "$" "$prefix" "$space" && {
    prefix="$joiner";
    is_prompt_empty=0;
  }

  printf "%s" "${reset_bg}$reset$space"
}

function __ps2 {
  local prefix empty_prefix joiner is_prompt_empty=1
  prefix="${b_bg}${b_fg}${b_bg}${space}"
  joiner="${b_fg}${b_bg}${space}"

  empty_prefix="${b_fg}${b_bg}${space}"
  [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

  __wrapper "⤷ >" "$prefix" "$space" && {
    prefix="$joiner";
    is_prompt_empty=0;
  }

  printf "%s" "${reset_bg}$reset$space"
}

function __branch {
  local branch
  local branch_symbol=" "

  # git
  if hash git 2>/dev/null; then
    if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
      branch=${branch##*/}
      printf "%s" "${branch_symbol}${branch:-unknown}"
      return
    fi
  fi
  return 1
}

function __cwd {
  local dir_limit="3"
  local truncation="⋯ "
  local first_char
  local part_count=0
  local formatted_cwd=""
  local dir_sep=" "
  local tilde="~"

  if [ ! -z "$PS1_DIR_LIMIT" ]; then
    dir_limit="$PS1_DIR_LIMIT"
  fi

  local cwd="${PWD/#$HOME/$tilde}"

  # get first char of the path, i.e. tilde or slash
  [[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}

  # remove leading tilde
  cwd="${cwd#\~}"

  while [[ "$cwd" == */* && "$cwd" != "/" ]]; do
    # pop off last part of cwd
    local part="${cwd##*/}"
    cwd="${cwd%/*}"

    formatted_cwd="$dir_sep$part$formatted_cwd"
    part_count=$((part_count+1))

    [[ $part_count -eq $dir_limit ]] && first_char="$truncation" && break
  done

  printf "%s" "$first_char$formatted_cwd"
}

function __prompt {
  local esc=$'[' end_esc=m
  local noprint='\[' end_noprint='\]'
  local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
  local space=" "
  local reset="${wrap}0${end_wrap}"
  local reset_bg="${wrap}49${end_wrap}"

  local a_fg="${wrap}38;5;252${end_wrap}"
  local a_bg="${wrap}48;5;236${end_wrap}"

  local b_fg="${wrap}38;5;252${end_wrap}"
  local b_bg="${wrap}48;5;238${end_wrap}"

  local c_fg="${wrap}38;5;252${end_wrap}"
  local c_bg="${wrap}48;5;234${end_wrap}"

  if [ "$PS1_SHORT" == 1 ]; then
    PS1="$(__ps1_short)"
  else
    PS1="$(__ps1)"
  fi

  PS2="$(__ps2)"
}

if [[ ! "$PROMPT_COMMAND" == *__prompt* ]]; then
  PROMPT_COMMAND='__prompt;'$'\n'"$PROMPT_COMMAND"
fi
