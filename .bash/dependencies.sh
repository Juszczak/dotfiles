#!/usr/bin/env bash

function __install_homebrew {
  local curl="/usr/bin/curl"
  local brew="/usr/local/bin/brew"
  local repo="https://raw.githubusercontent.com/Homebrew/install/master/install"
  if ! type "$brew" && type "$curl"; then
    "/usr/bin/ruby" "-e" "$("curl" "-fsSL" "$repo")"
  fi
}

function __install_pip {
  "sudo" "easy_install" "pip"
}

function __npm_install {
  local -a packages=(
    "@angular/cli"
    "create-react-app"
    "eslint"
    "htmlhint"
    "js-beautify"
    "serve"
    "stylelint"
    "tslint"
    "typescript"
    "typescript-formatter"
  )

  printf "installing packages:\n%s\n" "$(printf "> %s\n" "${packages[@]}")"

  eval "npm install -g ${packages[*]}"
}

function __pip_install {
  local -a packages=(
    "vim-vint"
    "jedi"
    "pylint"
  )

  for package in "${packages[@]}"
  do
    eval "pip install $package"
  done
}

function __brew_install {
  local -a bundles=(
    "ack"
    "bash"
    "bash-completion"
    "cmake"
    "git"
    "gnutls"
    "htop"
    "nginx"
    "node"
    "perl"
    "python"
    "reattach-to-user-namespace"
    "ruby"
    "rust"
    "shellcheck"
    "tidy-html5"
    "tmux"
    "tree"
    "tree"
    "w3m"
    "wget"
  )

  # make sure we’re using the latest Homebrew.
  brew update

  # Upgrade any already-installed formulae.
  brew upgrade

  for bundle in "${bundles[@]}"
  do
    eval "brew install $bundle"
  done

  brew cleanup
}

function __brew_cask_install {
  local -a apps=(
    "iterm2"
    "haskell-platform"
    "macvim"
  )

  for app in "${apps[@]}"
  do
    eval "brew cask install $app"
  done
}
