set clk_port_spi ui_PAD2CORE[1]
set clk_period_spi  200
set clk_io_pct 0.2

set clk_port_spi [get_ports $clk_port_spi]

create_clock -name spi_clk -period $clk_period_spi $clk_port_spi

set non_clock_inputs [all_inputs -no_clocks]

set_input_delay [expr $clk_period_spi * $clk_io_pct] -clock spi_clk $non_clock_inputs
set_output_delay [expr $clk_period_spi * $clk_io_pct] -clock spi_clk [all_outputs]
