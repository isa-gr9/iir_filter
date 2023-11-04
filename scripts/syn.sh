#!/bin/sh

# Move to the run directory
cd ../syn
mkdir work

DATE=`date +%d-%m-%y` 
FILE=sys
EXT=.log
FINAL=${FILE}_${DATE}${EXT}

echo "Running the synthesis.."
# Invoke DesignCompiler and run the TCL script
dc_shell-xg-t -64 -f ../scripts/syn.tcl >  ${FINAL}
