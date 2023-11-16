
#Link the compiled library of the cells
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir

#Link the delay file
#vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir/UUT=../syn/results/iir/iir.sdf work.tb_iir
vsim -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir/UUT=../syn/results/iir_advanced/iir.sdf work.tb_iir


#vcd file
#vcd file ../vcd/iir_syn.vcd
vcd file ../vcd/iir_advanced_syn.vcd


#Monitor all the signals
vcd add /tb_iir/UUT/*

run 2 us


#Convert the file with the switching activity from vcd to saif thanks to the script of DC tool suit
#vcd2saif -input ../vcd/iir_syn.vcd -output ../saif/iir_syn.saif
vcd2saif -input ../vcd/iir_advanced_syn.vcd -output ../saif/iir_advanced_syn.saif


quit -sim
exit -f