#!/usr/bin/env bash


function install_brew {
    echo "== START INSTALL BREW=="
    yes b'\n' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "== END INSTALL BREW=="
}


function update_brew {
    echo "== UPDATE BREW=="
    which brew
    brew update
}


function brew_cask_install {
    echo "== START CASK INSTALL " $1
    brew cask install $1
}