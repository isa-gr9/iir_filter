######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

#Source setup files
source ./.synopsys_dc.setup


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
#set active_design "iir_advanced"


# DEFINE WORK DIRS
set dirname "./results/${active_design}/clockgating"
if {![file exists $dirname]} {
	file mkdir $dirname
}

set libDir "./work/"
file mkdir $libDir
define_design_lib $active_design -path $libDir


analyze -format vhdl -library $active_design ../rtl/${active_design}.vhd > ${dirname}/${active_design}_analyze.txt

#Preserve rtl names for make the power consumption estimation easier
set power_preserve_rtl_hier_names true


# Elaborate design
#elaborate $active_design -arch behavioral -lib WORK > ${dirname}/${active_design}_elaborate.txt
elaborate -lib $active_design $active_design > ${dirname}/${active_design}_elaborate.txt

######################################################################
##
## SET DESIGN CONSTRAINTS
##
######################################################################
source "./${active_design}.sdc"


#####################################################################
# COMPILE
#####################################################################

# compile witch clock gate
source ../scripts/clock_gating.tcl
compile_ultra -gate_clock
set_dont_retime [all_fanout -from [get_pins -filter is_clock_gate_output_pin] -only_cells]


#####################################################################
# Reports
#####################################################################

# SET REPORTs FILE NAME
set timing_rpt "${dirname}/${active_design}_postsyn_timing_cg.rpt"
set power_rpt_noopt "${dirname}/${active_design}_postsyn_power_noopt_cg.rpt"
set clk_rpt "${dirname}/${active_design}_postsyn_timing_cg.rpt"
set area_rpt "${dirname}/${active_design}_postsyn_area_cg.rpt"
set cg "${dirname}/${active_design}_clkgat.rpt"
set cg_str "${dirname}/${active_design}_clkgat_str.rpt"
set cg_cond "${dirname}/${active_design}_clkgat_cond.rpt"

# Report the properties of the clock just created
report_clock > $clk_rpt
# TIMING REPORT
report_timing > $timing_rpt
# POWER REPORT
report_power > $power_rpt_noopt
# AREA REPORT
report_area > $area_rpt


report_clock_gating  > $cg
report_clock_gating -structure   > $cg_str
report_clock_gating -enable_conditions  > $cg_cond


#####################################################################
# 
#   SAVE DESIGN
#
#####################################################################

#Erase the hierarchy
ungroup -all -flatten

#Imposing verilog rules to obtain a verilog netlist
change_names -hierarchy -rules verilog


#Delay of the netlist
write_sdf "${dirname}/${active_design}_cg.sdf"
#Netlist
write -format verilog -hierarchy -output "${dirname}/${active_design}_postsyn_netlist_cg.v"
#design constraints
write_sdc "${dirname}/${active_design}_cg.sdc"


exec rm -rf $libDir
exec rm -rf ./alib-52
exec rm default.svf command.log 
exit
