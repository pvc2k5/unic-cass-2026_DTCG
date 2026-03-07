create_clock -name pll_clock -period 6.66 [get_ports clock]

set_false_path -from [get_ports div]
set_false_path -from [get_ports reset]

set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
