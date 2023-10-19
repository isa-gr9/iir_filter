#vsim work.tb_iir -t ns -voptargs=+architecture
vsim work.tb_iir 
add wave *
run 2000 ns
wave zoom full
