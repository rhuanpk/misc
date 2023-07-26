#!/bin/bash
# vendo o funcionado do comando set -o pipefail.
echo ""
ls /zkt/ | cat
echo -e "\ncode return: ${?}\n\n-----\n"
pw | cat
echo -e "\ncode return: ${?}"
echo -e "\n***** seting: set -o pipefail *****\n"
set -o pipefail
ls /zkt/ | cat
echo -e "\ncode return: ${?}\n\n-----\n"
pw | cat
echo -e "\ncode return: ${?}\n"
