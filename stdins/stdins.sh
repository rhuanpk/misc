#!/bin/bash
FILE=`mktemp /tmp/file-XXXXXXXXXX.txt`
HIFENS='-----'
separete() {
	printf '|%.0s\n' {0..2}
}
stdins() {
	# has data via pipe
	[ -p '/dev/stdin' ] && {
		#echo "VALUE: `cat -`"
		read
		cat <<- EOF
			$HIFENS VIA PIPE $HIFENS
			PIPE FILE: `readlink -f /dev/stdin`
			VALUE: $REPLY
		EOF
	} || {
		[ -t '0' ] && {
			# has arguments via command line
			[ "$#" -gt '0' ] && {
				ARG_FIRST="$1"
				ARG_SECOND="$2"
				ARG_THIRD="$3"
				cat <<- EOF
					$HIFENS STANDARD ARGUMENTS $HIFENS
					ARG_FIRST: $ARG_FIRST
					ARG_SECOND: $ARG_SECOND
					ARG_THIRD: $ARG_THIRD
					ALL: $@
				EOF
				echo 'FOR:'
				#for arg in "$@"; do
				for arg; do
					echo -e "\t- $arg"
				done
			}
		} || {
			# has data via stdin
			#read
			#cat <<- EOF
			#	$HIFENS VIA STDIN $HIFENS
			#	VALUE: $REPLY
			#EOF
			echo "$HIFENS VIA STDIN $HIFENS"
			while read; do
				echo "- $REPLY"
			done < '/dev/stdin'
		}
	}
}
echo $'a\nb\nc d' > "$FILE"
echo '> command: stdins'
stdins
separete
echo "> command: stdins a b 'c d'"
stdins a b 'c d'
separete
echo "> command: stdins <<< \"a b 'c d'\""
stdins <<< "a b 'c d'"
separete
echo "> command: echo \"a b 'c d'\" | stdins"
echo "a b 'c d'" | stdins
separete
echo "> command: stdins < file.txt"
stdins < "$FILE"
separete
echo "> command: cat file.txt | stdins"
cat file.txt | stdins
rm -f "$FILE"
