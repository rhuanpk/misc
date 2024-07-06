#!/bin/bash

set -Eo pipefail

failure() {
	cat <<- EOF
		----- TRAP -----
		\$LINENO: $LINENO
		\$BASH_COMMAND: $BASH_COMMAND
		\${BASH_LINENO[@]}: ${BASH_LINENO[@]}
		\$FUNCNAME: ${FUNCNAME[@]}
		\$BASH_SOURCE: ${BASH_SOURCE[@]}
		----------------
	EOF
}

trap failure ERR

echo '>>>>> SCRIPT <<<<<'
inexistent-command
false | true
echo "$(false | true)"

foobar() {
	echo '>>>>> FUNCTION <<<<<'
	inexistent-command
	false | true
	echo "$(false | true)"
}
foobar
