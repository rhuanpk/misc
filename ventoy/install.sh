#!/usr/bin/env bash

main_path=/tmp/ventoy

message_separator() {
	echo -e "------------------------------"
}

[ -d $main_path ] && rm -rf $main_path
mkdir -p ${main_path}/ \
	&& cd ${main_path}/

curl -fsSL 'https://api.github.com/repos/ventoy/Ventoy/releases/latest' \
	| sed -nE 's/(.*browser_download_url.*")(.*linux\.tar\.gz)(.*)/\2/p' \
	| wget -i - \
	&& tar -zxvf ./*linux.tar.gz \
	&& cd ./ventoy*/

message_separator
echo "$(pwd):\n"
ls -lhF --color=always
message_separator
