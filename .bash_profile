#!/usr/bin/env bash

function __init {
  function __source {
    if [ -f "$1" ]; then
      # shellcheck source=/dev/null
      source "$1"
    fi
  }

  function __init_aliases {
    function __reattach_to_user_namespace {
      local -a apps=(
        vim
        mvim
        pbcopy
        pbcopy
      )
      for app in ${apps[*]}; do
        eval "alias $app=\"reattach-to-user-namespace $app\""
      done;
    }
    if ! [ -z "$TMUX" ]; then
      __reattach_to_user_namespace
    fi

    alias lock="pmset displaysleepnow"
  }

  function __init_shopt {
    local -a options=(
      nocaseglob
      histappend
      cdspell
      autocd
      globstar
    )
    for option in ${options[*]}; do
      shopt -s "$option" 2> /dev/null;
    done;
  }

  function __eval_dircolors {
    local dircolors="$HOME/.dircolors"
    if [ -f "$dircolors" ]; then
      eval "$("gdircolors" "-b" "$dircolors")"
    fi
    unset "dircolors"
    alias ls="gls --color=always -F"
  }

  function __init_exports {
    export HOMEBREW_GITHUB_API_TOKEN=
    export EDITOR='vim';
    export NODE_REPL_HISTORY="$HOME/.node_history"
    export NODE_REPL_HISTORY_SIZE='32768';
    export NODE_REPL_MODE='sloppy';
    export HISTSIZE='32768';
    export HISTFILESIZE="${HISTSIZE}";
    export HISTCONTROL='ignoreboth';
    export LANG='en_US.UTF-8';
    export LC_ALL='en_US.UTF-8';
    export MANPAGER='less -X';
    export PYTHONSTARTUP="$HOME/.python/startup.py"
    export GPG_TTY="$(tty)"
    export PATH="$HOME/.bin:$PATH"
  }

  function __init_iterm_integration {
    __source "${HOME}/.iterm2_shell_integration.bash"
  }

  function __init_completions {
    __source "/usr/local/share/bash-completion/bash_completion"
  }

  if [ 0 -lt "$#" ]; then
    "$@"
  else
    __init_aliases
    __eval_dircolors
    __init_shopt
    __init_exports
    __init_completions
  fi
}

function __init_prompt {
  function __wrapper {
    [[ -n "$1" ]] || return 1
    printf "%s" "${2}${1}${3}"
  }

  function __ps1 {
    local prefix empty_prefix joiner is_prompt_empty=1
    prefix="${branch_bg}${branch_fg}${branch_bg}${space}"
    joiner="${branch_fg}${branch_bg}${space}"
    empty_prefix="${branch_fg}${branch_bg}${space}"
    [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

    __wrapper "$(__branch)" "$prefix" "$space" && {
      prefix="$joiner";
      is_prompt_empty=0;
    }

    prefix="${cwd_bg}${cwd_fg}${cwd_bg}${space}"
    joiner="${cwd_fg}${cwd_bg}${space}"
    empty_prefix="${cwd_fg}${cwd_bg}${space}"
    [ $is_prompt_empty -eq 1 ] && prefix="$empty_prefix"

    # section "c" slices
    __wrapper "$(__cwd)" "$prefix" "$space" && {
      prefix="$joiner";
      is_prompt_empty=0;
    }

    printf "%s" "${reset_bg}$reset$space"
  }

  function __ps1_short {
    printf " "
  }

  function __ps2 {
    local prefix empty_prefix joiner is_prompt_empty=1
    prefix="${user_bg}${user_fg}${user_bg}${space}"
    joiner="${user_fg}${user_bg}${space}"

    empty_prefix="${user_fg}${user_bg}${space}"
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
    first_char=${cwd::1}

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

  function __last_status {
    local status=""
    if [ "$last_status" != 0 ]; then
      status=" $last_status"
    fi

    printf "%s" "${reset_bg}$reset$space"
  }

  function __prompt {
    local last_status=$?
    local esc=$'[' end_esc=m
    local noprint='\[' end_noprint='\]'
    local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
    local space=" "
    local reset="${wrap}0${end_wrap}"
    local reset_bg="${wrap}49${end_wrap}"
    local branch_fg="${wrap}38;5;252${end_wrap}"
    local branch_bg="${wrap}48;5;236${end_wrap}"
    local user_fg="${wrap}38;5;252${end_wrap}"
    local user_bg="${wrap}48;5;238${end_wrap}"
    local cwd_fg="${wrap}38;5;252${end_wrap}"
    local cwd_bg="${wrap}48;5;234${end_wrap}"

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

  function pt {
    if [[ "PS1_SHORT" -eq 1 ]]; then
      export PS1_SHORT=0
    else
      export PS1_SHORT=1
    fi
  }
}

function __init_marks {
  export MARKPATH="$HOME/.marks"

  function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
  }

  function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
  }

  function unmark {
    rm -i "$MARKPATH/$1"
  }

  function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
  }

  function __completemarks {
    local curw wordlist
    curw=${COMP_WORDS[COMP_CWORD]}
    wordlist=$(find "$MARKPATH" -type l | rev | cut -d"/" -f1 | rev)
    COMPREPLY=($(compgen -W "${wordlist[@]}" -- "$curw"))
    return 0
  }

  complete -F __completemarks jump unmark

  export -f jump
  export -f mark
  export -f unmark
  export -f marks
}

function title {
  echo -ne "\033]0;"$*"\007"
}

__init_prompt
__init_marks
__init "$@"
