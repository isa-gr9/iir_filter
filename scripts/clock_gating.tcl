set clockGateMinBitWidth 1 ;# minimum bit-width of the cg bank-register
set clockGateMaxFanout 1024 ;# maximum number of registers driven by the
same cg-element

set_clock_gating_style -minimum_bitwidth $clockGateMinBitWidth -max_fanout $clockGateMaxFanout