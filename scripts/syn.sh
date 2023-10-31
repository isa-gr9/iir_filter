#!/bin/sh

# Move to the run directory
cd ../syn
mkdir work

# Invoke DesignCompiler and run the TCL script
dc_shell-xg-t -64 -f ../scripts/syn.tcl
