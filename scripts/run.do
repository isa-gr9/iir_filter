#vsim work.tb_iir -t ns -voptargs=+architecture
vsim work.tb_iir 
add wave *
add wave -position insertpoint sim:/tb_iir/UUT/*
run 2000 ns
wave zoom full

#quit -sim
#exit -f