create_clock -name osc -period 100 [get_ports {ui_PAD2CORE[0]}]

#create_generated_clock -name pll_clock -source [get_ports {ui_PAD2CORE[0]}] -multiply_by 15 [get_pins *pll_inst.ringosc.ibufp01/Y]

create_clock -name pll_clock -period 6.66 [get_pins *pll_inst.ringosc.ibufp01/Y]

set_clock_groups -asynchronous -group [get_clocks osc] -group [get_clocks pll_clock]


set_false_path -from [get_clocks osc] -to [get_clocks pll_clock]

set_false_path -from [get_clocks pll_clock] -to [get_clocks osc]
