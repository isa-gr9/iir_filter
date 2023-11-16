#!/bin/sh

cd ../sim/
source /eda/scripts/init_questa_core_prime
source /eda/scripts/init_design_vision

set -e

#Testbench
vcom -work ./work ../tb/clk_gen.vhd
vcom -work ./work ../tb/data_maker_new.vhd
vcom -work ./work ../tb/data_sink.vhd

vlog -work ./work ../syn/results/iir_advanced/iir_advanced_postsyn_netlist.v
#vlog -work ./work ../syn/results/iir/iir_postsyn_netlist.v
vlog -work ./work ../tb/tb_iir.v

vsim -do ../scripts/switch.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript

cd ../syn

# Check if a command line parameter is provided
if [ "$#" -eq 0 ]; then
    # If no parameter is provided, use the default script
    dc_shell-xg-t -64 -f ../scripts/switch.tcl 
elif [ "$#" -eq 1 ] && [ "$1" = "cg" ]; then
    # If the parameter is "cg", use the alternate script
    mv ../saif/iir_advanced_syn.saif ../saif/iir_advanced_syn_cg.saif
    dc_shell-xg-t -64 -f ../scripts/switch_cg.tcl
else
    # If an invalid parameter is provided, display an error message
    echo "Invalid parameter. Usage: $0 [cg]"
    exit 1
fi
