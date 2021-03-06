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
    echo "== START SETUP GIT CONFIG =="
    mkdir ~/.git
    cp  meta/git/.gitignore ~/.git
    cp  meta/git/.gitconfig ~/.git
    echo "== END SETUP GIT CONFIG =="
}

# 2.2
function install_bash_it {
    echo "== START INSTALL BASH_IT =="
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
    cat meta/shell/alias >> .bash_profile
    mv ~/.bash_it/themes/sexy/sexy.theme.bash ~/.bash_it/themes/sexy/_sexy.theme.bash
    cp meta/bash_it/sexy.theme.bash ~/.bash_it/themes/sexy
    echo 'export BASH_IT_THEME="sexy"' >> .bash_profile

#    bash-it show aliases
#    bash-it show completions
#    bash-it show plugins
    echo "== END INSTALL BASH_IT == "
}

# 2.3 install pyenv-virtualenv and setup it
function install_pyenv-virtualenv {
    brew install pyenv-virtualenv
    echo 'eval "$(pyenv init -)"' >> .bash_profile
    echo 'eval "$(pyenv virtualenv-init -)"' >> .bash_profile
}


function initialize_mac {
    install_brew
    install_mac_apps
    setup_alfred_preference
    setup_git_config
    install_pyenv-virtualenv
    install_bash_it
}
