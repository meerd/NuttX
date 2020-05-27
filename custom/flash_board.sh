#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
cd ${SCRIPT_DIR}

PROGRAMMER=jlink

case ${PROGRAMMER} in
jlink)
	TARGET_DEVICE=MIMXRT1062XXX6A
	SPEED=4000
	INTERFACE=SWD
	CSCRIPT=jcommander.scr

	FLASHER=JLinkExe
	ARGUMENTS="-Device ${TARGET_DEVICE} -speed ${SPEED} -If ${INTERFACE} -CommanderScript ${CSCRIPT}"
	;;
*)
	echo "${PROGRAMMER} is not supported at the moment!" 
esac

${FLASHER} ${ARGUMENTS}
