#!/bin/bash

print_usage() {
	cat <<- eof
		####################################################################################################
		#
		# Esse simples script printa alguns matchs de
		# RegEx feitos com o utilitários 'grep' (utilitário
		# padrão do Linux).
		#
		# O RegEx padrão usado foi (variações usadas colocadas nos títulos):
		#
		# 	grep --color=always -E '(/[^/]*)$' < \${file}
		#
		####################################################################################################
	eof
}

jump_of_line() {
	msg=${1}
	echo -e "\n---------- ${msg^^} ----------"
}

file=${1:-'./file.txt'}

echo -e "\n\
	\rCaso necessário... =)\n\
	\r	cd $(pwd)\
"
echo -e "\n$(print_usage)\n\
	\r$(jump_of_line 'mostrando o conteúdo inteiro')\n\n\
	\r$(cat ${file})\n\
	\r$(jump_of_line 'regex simples')\n\n\
	\r$(grep --color=always -E '(/[^/]*)$' < ${file})\n\
	\r$(jump_of_line 'regex com -o (only match)')\n\n\
	\r$(grep --color=always -oE '(/[^/]*)$' < ${file})\n\
	\r$(jump_of_line 'regex com -v (invert match)')\n\n\
	\r$(grep --color=always -vE '(/[^/]*)$' < ${file})\n\
"
