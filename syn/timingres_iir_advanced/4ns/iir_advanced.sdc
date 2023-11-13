###################################################################

# Created by write_sdc on Mon Nov 13 16:30:06 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 3.40189 [get_ports {DOUT[12]}]
set_load -pin_load 3.40189 [get_ports {DOUT[11]}]
set_load -pin_load 3.40189 [get_ports {DOUT[10]}]
set_load -pin_load 3.40189 [get_ports {DOUT[9]}]
set_load -pin_load 3.40189 [get_ports {DOUT[8]}]
set_load -pin_load 3.40189 [get_ports {DOUT[7]}]
set_load -pin_load 3.40189 [get_ports {DOUT[6]}]
set_load -pin_load 3.40189 [get_ports {DOUT[5]}]
set_load -pin_load 3.40189 [get_ports {DOUT[4]}]
set_load -pin_load 3.40189 [get_ports {DOUT[3]}]
set_load -pin_load 3.40189 [get_ports {DOUT[2]}]
set_load -pin_load 3.40189 [get_ports {DOUT[1]}]
set_load -pin_load 3.40189 [get_ports {DOUT[0]}]
set_load -pin_load 3.40189 [get_ports VOUT]
create_clock [get_ports CLK]  -name CLK_SYS  -period 4  -waveform {0 2}
set_clock_uncertainty 0.07  [get_clocks CLK_SYS]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports RST_n]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports VIN]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[12]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[11]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[10]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[9]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[8]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[7]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[6]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[5]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[4]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {DIN[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[12]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[11]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[10]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[9]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[8]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[7]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[6]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[5]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[4]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {a1[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[12]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[11]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[10]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[9]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[8]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[7]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[6]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[5]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[4]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b0[0]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[12]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[11]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[10]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[9]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[8]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[7]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[6]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[5]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[4]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[3]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[2]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[1]}]
set_input_delay -clock CLK_SYS  -max 0.5  [get_ports {b1[0]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[12]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[11]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[10]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[9]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[8]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[7]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[6]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[5]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[4]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[3]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[2]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[1]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports {DOUT[0]}]
set_output_delay -clock CLK_SYS  0.5  [get_ports VOUT]
