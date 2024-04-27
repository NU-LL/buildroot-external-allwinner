#!/usr/bin/env bash


main() {
	local SCRIPT_PATH=$(dirname "$0")

    # cp ${SCRIPT_PATH}/splash.bmp ${BINARIES_DIR}

    support/scripts/genimage.sh -c ${SCRIPT_PATH}/genimage-sdcard.cfg

}

main $@
