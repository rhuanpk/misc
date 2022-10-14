#!/bin/bash

temporary_directory=$(mktemp -d /tmp/temporary_XXXXXXX)
repo_path=${temporary_directory}/grep_example
binary_name=grep_example.sh

git clone 'https://github.com/rhuan-pk/temporary.git' $temporary_directory
cd ${repo_path}
./${binary_name}
