set active_design "iir"
#set active_design "iir_advanced"

set dirname "./results/${active_design}/clockgating"
set timing_rpt "${dirname}/${active_design}_switching_cg_timing.rpt"
set power_rpt "${dirname}/${active_design}_switching_cg_power.rpt"
set in_verilog_filename "${dirname}/${active_design}_postsyn_netlist_cg.v"


read_verilog -netlist $in_verilog_filename

current_design ${active_design}

read_saif -input ../saif/iir_syn_cg.saif -instance tb_iir/UUT -unit ns -scale 1


#create_clock -name clk_swi -period 5.0 CLK
create_clock -name clk_swi -period 2.5 CLK


######################################################################
##
## WRITE REPORTS
##
######################################################################

# SET REPORT FILE NAME


# TIMING REPORT
report_timing > $timing_rpt

# POWER REPORT
report_power > $power_rpt

exit
