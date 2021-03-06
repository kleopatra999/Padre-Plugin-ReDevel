#!/bin/bash

clear
SESSION_NAME="$1"
if [ -z "$SESSION_NAME" ]; then
	SESSION_NAME="redevel - empty";
fi

PADRE_BASE_DIR="/home/$USER/devel/padre-src"
PADRE_SRC_DIR="$PADRE_BASE_DIR/Padre"
PADRE_RD_DIR="$PADRE_BASE_DIR/Padre-Plugin-ReDevel"

if [ ! -d "$PADRE_SRC_DIR" ]; then
	echo "Padre devel directory '$PADRE_SRC_DIR' not found."
	exit;
fi

if [ ! -d "$PADRE_RD_DIR" ]; then
	echo "Padre ReDevel Plugin devel directory '$PADRE_RD_DIR' not found."
	exit;
fi

export PERL5LIB="$PERL5LIB:$PADRE_RD_DIR/lib:$PADRE_RD_DIR/lib/:$PADRE_RD_DIR/lib/auto/App/ReDevel/server/dist/_base/lib"
echo "session: '$SESSION_NAME'"
echo "PER5LIB: $PERL5LIB"

ACT_DIR=`pwd` \
&& cd "$PADRE_SRC_DIR" \
&& ./dev -a -- --session="$SESSION_NAME" \
&& cd "$ACT_DIR"
