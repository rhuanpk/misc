#!/bin/bash

# use case for testing: `./getopts_example.sh -azb`.
# - the ":" in the beginning of the string options is for error suppression;
# - the ":" after an option makes it require an argument;

while getopts ':ab:' option; do
	case $option in
		a) echo "option: $option - argument: ${OPTARG}";;
		b) echo "option: $option - argument: ${OPTARG}";;
		:) echo "option: $option - argument: ${OPTARG} → missing argument!";;
		?) echo "option: $option - argument: ${OPTARG} → invalid option!";;
	esac
done

shift $((${OPTIND}-1))
