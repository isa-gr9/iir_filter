#vsim work.tb_iir -t ns -voptargs=+architecture
vsim work.tb_iir 
add wave *
#add wave -position insertpoint sim:/tb_iir/UUT/*
add wave -position insertpoint sim:/tb_iir/UUT/x
add wave -position insertpoint sim:/tb_iir/UUT/y
add wave -position insertpoint sim:/tb_iir/UUT/fb
add wave -position insertpoint sim:/tb_iir/UUT/ff
add wave -position insertpoint sim:/tb_iir/UUT/VOUT
add wave -position insertpoint sim:/tb_iir/UUT/VIN
add wave -position insertpoint sim:/tb_iir/UUT/vin_i
add wave -position insertpoint sim:/tb_iir/UUT/w
add wave -position insertpoint sim:/tb_iir/UUT/sw



run 2000 ns
wave zoom full

#quit -sim
#exit -f