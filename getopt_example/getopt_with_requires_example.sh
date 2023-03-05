#!/bin/bash

format_red='\e[31m'
format_yellow='\e[33m'
format_bold='\e[1m'
format_underlined='\e[4m'
format_reset='\e[m'

script=$(echo -e ${format_bold}`basename "${0}"`${format_reset})
getopt=`echo -e ${format_bold}getopt${format_reset}`

usage() {
	cat <<- eof
		####################################################################################################
		#
		# >>> $script !
		#
		#
		# DESCRIPTION
		# 	Script for testing $getopt bash command.
		#
		# USAGE
		# 	$script [optionals] -s <argument>
		#
		# REQUIRES
		#	-z, -zero, --zero <argument>
		# 		Do not need argument.
		#
		# 	or
		#
		#	-s, -second, --second <argument>
		# 		Is <argument> any string or value.
		#
		# OPTIONALS
		# 	-f, -first, --first
		# 		Do not need argument.
		#
		# 	-t, -third, --third<argument>
		# 		Is <argument> optional string or value.
		#
		####################################################################################################
	eof
}
exiting() {
	echo -e "${format_yellow}exiting${format_reset}..." >&2
	exit 1
}

if ! options=`getopt -l 'help,zero,first,second:,third::' -o 'hzfs:t::' -n $script -a -- "${@}"`; then
	exiting
elif ! ([[ $options =~ (-h|--help) ]] || [[ $options =~ (-s|--second|-z|--zero) ]]); then
	echo -e "\
		\r${script}: ${format_red}missing required options${format_reset}!\n\
		\r${script}: ${format_bold}-h${format_reset}, ${format_bold}-help${format_reset} or ${format_bold}--help${format_reset} to see!\
	" >&2
	exiting
fi

eval "set -- ${options}"

while :; do
	option="${1}"
	argument="${2}"
	case $option in
		-z|-zero|--zero) echo "option: ${option}!"; shift;;
		-f|-first|--first) echo "option: ${option}!"; shift;;
		-s|-second|--second) echo "option: ${option} - argument: '${argument}'!"; shift 2;;
		-t|-third|--third)
			case "${argument}" in
				"") echo "option: ${option}, no argument!"; shift 2;;
				*)  echo "option: ${option} - argument: '${argument}'!"; shift 2;;
			esac
		;;
		-h|-help|--help) usage; exit 0;;
		--) shift; break;;
		*) echo "script panic!"; exit 1;;
	esac
done

echo "remaining arguments (${#})!"
for arg; do echo "arg: '$arg'!" ; done
