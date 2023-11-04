#!/bin/sh

# Move to the run directory
cd ../syn
mkdir work

source /eda/scripts/init_design_vision

TIME=`date "+%T"`
DATE=`date +%d-%m-%y` 
FILE=sys
EXT=.log
FINAL=${FILE}_${DATE}_${TIME}${EXT}

echo "Running the synthesis.."
# Invoke DesignCompiler and run the TCL script
dc_shell-xg-t -64 -f ../scripts/syn.tcl >  ${FINAL}
