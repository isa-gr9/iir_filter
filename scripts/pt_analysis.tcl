######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

# SOURCE SETUP FILE
source "./.synopsys_pt.setup"

# DEFINE OPTIONS
set report_default_significant_digits 6
set power_enable_analysis true

# SUPPRESS WARNING MESSAGES
suppress_message RC-004
suppress_message PTE-003
suppress_message UID-401
suppress_message ENV-003
suppress_message UITE-489
suppress_message CMD-041
######################################################################
##
## READ DESIGN
##
######################################################################
# DEFINE CIRCUITS
set active_design "iir"

# DEFINE INPUT FILES
set dirname "./results/${active_design}/pt"
set in_verilog_filename "${dirname}/${active_design}_postsyn_netlist.v"
set in_sdc_filename "${dirname}/${active_design}.sdc"
set setup_time "${dirname}/${active_design}_postsyn_setup.rpt"
set slack_min "${dirname}/${active_design}_postsyn_slackmin.rpt"
set slack_max "${dirname}/${active_design}_postsyn_slackmax.rpt"


# READ
read_verilog $in_verilog_filename
read_sdc -version 1.3 $in_sdc_filename


update_timing -full

######################################################################
##
## TIMING ANALYSIS
##
######################################################################
# SETUP TIME
report_timing -delay_type max > $setup_time

# SLACK CONDITION
report_timing -delay_type min -slack_lesser_than 0.1 -max_paths 2 > $slack_min
report_timing -delay_type max -slack_lesser_than 0.0 -max_paths 2 > $slack_max



######################################################################
##
## WRITE REPORTS
##
######################################################################

# SET REPORT FILE NAME
set timing_rpt "${dirname}/${active_design}_postsyn_timing.rpt"
set power_rpt "${dirname}/${active_design}_postsyn_power.rpt"

# TIMING REPORT
report_timing > $timing_rpt

# POWER REPORT
report_power > $power_rpt

######################################################################
##
## EXIT
##
######################################################################

exit
