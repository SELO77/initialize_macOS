#!/usr/bin/env bash


source ./utils.sh

print_start_line
echo "== TEST utils =="
echo "!! TEST: read_line_by_line mac_apps.txt "
read_line_by_line mac_apps.txt
print_end_line


print_start_line
echo "== TEST install == "
source ./install.sh
echo "!! TEST: install_mac_apps"
install_mac_apps
print_end_line
