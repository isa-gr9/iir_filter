####################################################################
#  Design constraints of the basic version of IIR
####################################################################


set clockName "CLK"
set clockSys  "CLK_SYS"

# Period measured in nanoseconds. So for a 100MHz frequency, 10 ns are selected
set clockPeriod "10"


;# Set-up Clock
create_clock -name $clockSys -period $clockPeriod $clockName

#Don't touch property highlighting that is a special signal in the design
set_dont_touch_network $clockSys

#Set clock uncertainty for jitter problems
set_clock_uncertainty 0.07 [get_clocks $clockSys]



set_input_delay 0.5 -max -clock $clockSys [remove_from_collection [all_inputs] CLK]


;# fix hold constraints
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]

;# Set-up IOs
set_driving_cell -library "CORE65LPLVT_nom_1.20V_25C.db:CORE65LPLVT" -lib_cell "HS65_LL_BFX7" [all_inputs]

set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

set max_transition_time 0.1
set_max_transition $max_transition_time [all_outputs]

;# Set area constraint
set_max_area 0
