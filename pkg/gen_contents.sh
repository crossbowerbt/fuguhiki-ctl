#!/bin/sh

BINNAME=fuguhiki-ctl
BINNAME_FIREFOX=fuguhiki-firefox-ctl

function get_sha {
	sha256 -b "$1" | cut -d ' ' -f 4
}

function get_size {
	stat "$1" | cut -d ' ' -f 8
}

function gen_file {
	local prefix="$1"
	local path="$2"
	echo "$path"
	echo -n "@sha "
	echo $(get_sha "$prefix$path")
	echo -n "@size "
	echo $(get_size "$prefix$path")
}

cat  >+CONTENTS <<EOF
@name fuguhiki-ctl-1.0-custom
@version 10
@arch amd64
$(gen_file "" +DESC)
@cwd /usr/local
@bin $(gen_file "/usr/local/" bin/$BINNAME)
@bin $(gen_file "/usr/local/" bin/$BINNAME_FIREFOX)
EOF
