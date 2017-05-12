#!/bin/bash

WEBRTC_ROOT="$PWD"
WEBRTC_SRC="$WEBRTC_ROOT/src"
BUILD_SCRIPT="$WEBRTC_SRC/tools-webrtc/ios/build_ios_libs.sh"

function setEnv {
	echo "set environment"
	set NO_AUTH_BOTO_CONFIG=.boto
	git config --global http.proxy 'socks5://127.0.0.1:8016'
	git config --global https.proxy 'socks5://127.0.0.1:8016'
}


function clearEnv {
	echo "clear environment"
	unset NO_AUTH_BOTO_CONFIG
	git config --global --unset http.proxy
	git config --global --unset https.proxy
}


function updateSrc {
	echo "update webrtc src"
	cd "$WEBRTC_ROOT"
	gclient sync
}


function buildFramework {
	echo "build framework"
	bash "$BUILD_SCRIPT"
}


start(){
	setEnv
	updateSrc
	buildFramework
	clearEnv
	cd "$WEBRTC_ROOT"
}





