#!/bin/sh
 
#If you run on the server this script, uncomment the line below
#source /eda/scripts/init_questa_core_prime

set -e

#Testbench
vcom -work ./work ../tb/clk_gen.vhd
vcom -work ./work ../tb/data_maker_new.vhd
vcom -work ./work ../tb/data_sink.vhd

vlog -work ./work ../syn/results/iir/iir_postsyn_netlist.v
vlog -work ./work ../tb/tb_iir.v

#Link the compiled library of the cells
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir

#Link the delay file
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir/UUT=../syn/results/iir/iir.sdf work.tb_iir


#vcd file
vcd file ../vcd/iir_syn.vcd

#Monitor all the signals
vcd add /tb_iir/UUT/*

run 2 us

source /eda/scripts/init_design_vision

#Convert the file with the switching activity from vcd to saif thanks to the script of DC tool suit
vcd2saif -input ../vcd/iir_syn.vcd -output ../saif/iir_syn.saif