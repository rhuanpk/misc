#!/bin/bash

temporary_directory=$(mktemp -d /tmp/temporary_XXXXXXX)
binary_name=grep_example
repo_path=${temporary_directory}/${binary_name}

git clone 'https://github.com/rhuanpk/misc.git' $temporary_directory
cd ${repo_path}
./${binary_name}
