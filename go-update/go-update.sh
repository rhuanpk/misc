#!/bin/bash

set -o pipefail

log() {
	local msg="${1:?need a message}"
	echo "$0: $msg"
}

fail() {
	local msg="${1:?need a message}"
	echo "$0: $msg" >&2
	exit '1'
}

sudo='sudo'
[ "$UID" -eq 0 ] && unset sudo

os_arch="$(dpkg --print-architecture)"
go_version="$(curl -fsL 'https://go.dev/VERSION?m=text' | head -1)" || fail 'failed to get go version'
file_name="$go_version.linux-$os_arch.tar.gz"

log 'going to tmp folder'
cd /tmp/ || fail 'error in go to tmp folder'

log 'removing go file (if exists)'
rm -fv "$file_name"

log 'downloading go file'
wget -q "https://go.dev/dl/$file_name" || fail 'filed to download go file'

log 'cleaning old go install (if exists)'
$sudo rm -rf '/usr/local/go'

log 'extracting go file'
$sudo tar -C '/usr/local' -xzf "$file_name" || fail 'error in decompress go file'

log 'setting up path (if needed)'
if ! grep -q '/usr/local/go/bin' <<< "$PATH" && ! grep -q "PATH+=':/usr/local/go/bin'" ~/.profile; then
	log "ll'necessary restart the session"
	echo -e "\n[ -d '/usr/local/go/bin' ] && PATH+=':/usr/local/go/bin'" >> ~/.profile
fi

log 'finish, all great'
