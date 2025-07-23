#!/bin/bash

# when not in silent mode
# 	- error messages are printed
# 	- invalid option
# 		- unset OPTARG
# 		- flag=?
# 	- required argument not found
# 		- unset OPTARG
# 		- flag=?
#
# ":" in the beginning of the string options: makes silent mode
# 	- no error messages are printed
# 	- invalid option
# 		- OPTARG=<flag>
# 		- flag=?
# 	- required argument not found
# 		- OPTARG=<flag>
# 		- flag=:
#
# ":" after an option makes it require an argument

while getopts 'ab:' flag; do
	case $flag in
		a) echo "flag: ${flag@Q} | arg: ${OPTARG@Q}";;
		b) echo "flag: ${flag@Q} | arg: ${OPTARG@Q}";;
		:) echo "flag: ${flag@Q} | arg: ${OPTARG@Q} (missing arg)";;
		?) echo "flag: ${flag@Q} | arg: ${OPTARG@Q} (invalid flag)";;
	esac
done

shift $((${OPTIND}-1))
