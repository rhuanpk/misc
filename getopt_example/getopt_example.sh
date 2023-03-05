#!/bin/bash
if ! options=$(getopt -l 'first,second:,third::' -o 'fs:t::' -n "`basename ${0}`" -a -- "${@}"); then
	echo 'exiting...'
	exit 1
fi
eval "set -- ${options}"
while :; do
	option="${1}"
	argument="${2}"
	case $option in
		-f|-first|--first) echo "option: ${option}!"; shift;;
		-s|-second|--second) echo "option: ${option} - argument: '${argument}'!"; shift 2;;
		-t|-third|--third)
			case "${argument}" in
				"") echo "option: ${option}, no argument!"; shift 2;;
				*)  echo "option: ${option} - argument: '${argument}'!"; shift 2;;
			esac
		;;
		--) shift; break;;
		*) echo "script panic!"; exit 1;;
	esac
done
echo "remaining arguments (${#})!"
for arg; do echo "arg: '$arg'!" ; done
