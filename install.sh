#!/usr/bin/env bash

echo "== LOAD install.sh =="
source settings.sh
source brew.sh
source utils.sh

# 1
function install_mac_apps {
     apps=$(read_line_by_line meta/mac_apps)
     for app in $apps
     do
        brew_cask_install $app
     done
}

# 1.1
function setup_alfred_preference {
    echo "== START SETUP ALFRED PREFERENCE =="
    path=$INITIAL_MAC_META_PATH/alfred/
    file_name=Alfred.alfredpreferences
    open $path$file_name
}


# 2.1
function setup_git_config {
    mkdir ~/.git
    cp  meta/git/.gitignore ~/.git
    cp  meta/git/.gitconfig ~/.git
}

# 2.2
function install_bash_it {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh

    cat meta/shell/alias

#    bash-it show aliases
#    bash-it show completions
#    bash-it show plugins
}


function initialize_mac {
    install_brew
    install_mac_apps
    setup_alfred_preference
    setup_git_config
}