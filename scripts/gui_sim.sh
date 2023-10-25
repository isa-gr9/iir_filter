#!/bin/sh

# Exit immediately if any command fails
set -e


#COMPILE

vcom ../rtl/iir.vhd

#Testbench
vcom ../tb/clk_gen.vhd
vcom ../tb/data_maker_new.vhd
vcom ../tb/data_sink.vhd
vlog ../tb/tb_iir.v


vsim -do ./gui_run.do

# Remove work directory
rm -rf work

# Remove vsim and transcript files
rm -f vsim.wlf transcript