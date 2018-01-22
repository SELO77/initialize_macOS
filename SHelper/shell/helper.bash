#!/usr/bin/env bash
parse_python_version () {
	for y in $(python -V)
	do
		version=$y
	done
	echo $version
}

parse_pyenv_venv () {
	if ! [ x$PYENV_VIRTUAL_ENV == x ]; then
		parsepath=$(echo $PYENV_VIRTUAL_ENV | tr "//" "\n")
		for x in $parsepath
		do 
			last=$x
		done
		echo "($last)"
	fi
}

# echo $(parse_python_version)
# parse_pyenv_venv
# eval "$(parse_pyenv_venv)"