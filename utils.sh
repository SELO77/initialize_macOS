#!/usr/bin/env bash

dotted_line="==========================="

function print_start_line {
    echo $'\r\f'$dotted_line
}

function print_end_line {
    echo $dotted_line$'\r\f'
}

function read_line_by_line {
    local value
    while IFS='' read -r line || [[ -n "$line" ]];
        do
            value="$value $line"
    done < "$1"
    echo "$value"
}
