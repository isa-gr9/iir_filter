######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

#Source setup files
source ../scripts/.synopsys_dc.setup


# SUPPRESS WARNING MESSAGES
suppress_message MWLIBP-319
suppress_message MWLIBP-324
suppress_message TFCHK-012
suppress_message TFCHK-014
suppress_message TFCHK-049
suppress_message TFCHK-072
suppress_message TFCHK-084
suppress_message PSYN-651
suppress_message PSYN-650
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134
suppress_message VER-130
suppress_message UISN-40
suppress_message VO-4
suppress_message RTDC-126

######################################################################
##
## READ DESIGN
##
######################################################################

# Set the design to synthesize
set active_design "iir"


# DEFINE WORK DIRS
set dirname "./results/${active_design}"
if {![file exists $dirname]} {
	file mkdir $dirname
}

set libDir "./work"
file mkdir $libDir
define_design_lib $active_design -path $libDir


analyze -f vhdl -library WORK ../rtl/${active_design}.vhd

#Preserve rtl names for make the power consumption estimation easier
set power_preserve_rtl_hier_names true


# Elaborate design
elaborate iir -arch behavioral -lib WORK


######################################################################
##
## SET DESIGN CONSTRAINTS
##
######################################################################
source "./${blockName}.sdc"