# (C) Copyright 2021 - 2021 Phigent, Inc.

#MIPI0
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_0_clk_p}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_0_clk_n}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_0_data_p[*]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_0_data_n[*]}]

set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_1_clk_p}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_1_clk_n}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_1_data_p[*]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {mipi_phy_if_1_data_n[*]}]

#Sensor Trigger
set_property PACKAGE_PIN F12 [get_ports {sensor_trigger}]
set_property IOSTANDARD LVCMOS33 [get_ports {sensor_trigger}]
set_property SLEW SLOW [get_ports {sensor_trigger}]
set_property DRIVE 4 [get_ports {sensor_trigger}]
set_property PULLUP true [get_ports {sensor_trigger}]

#GPIO
#GPIO_DP_PWC_N 
set_property PACKAGE_PIN F11 [get_ports {gpio_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[0]}]
set_property SLEW SLOW [get_ports {gpio_out[0]}]
set_property DRIVE 4 [get_ports {gpio_out[0]}]
set_property PULLUP true [get_ports {gpio_out[0]}]
#CAM1&3_POC_ST
set_property PACKAGE_PIN J12 [get_ports {gpio_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[1]}]
set_property SLEW SLOW [get_ports {gpio_out[1]}]
set_property DRIVE 4 [get_ports {gpio_out[1]}]
set_property PULLUP true [get_ports {gpio_out[1]}]
#CAM2_POC_ST
set_property PACKAGE_PIN H12 [get_ports {gpio_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[2]}]
set_property SLEW SLOW [get_ports {gpio_out[2]}]
set_property DRIVE 4 [get_ports {gpio_out[2]}]
set_property PULLUP true [get_ports {gpio_out[2]}]
#M2.SATA_DEVSLP
set_property PACKAGE_PIN E10 [get_ports {gpio_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[3]}]
set_property SLEW SLOW [get_ports {gpio_out[3]}]
set_property DRIVE 4 [get_ports {gpio_out[3]}]
set_property PULLDOWN true [get_ports {gpio_out[3]}]
#CAM1_POC_EN
set_property PACKAGE_PIN D10 [get_ports {gpio_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[4]}]
set_property SLEW SLOW [get_ports {gpio_out[4]}]
set_property DRIVE 4 [get_ports {gpio_out[4]}]
set_property PULLUP true [get_ports {gpio_out[4]}]
#CAM2_POC_EN
set_property PACKAGE_PIN C11 [get_ports {gpio_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[5]}]
set_property SLEW SLOW [get_ports {gpio_out[5]}]
set_property DRIVE 4 [get_ports {gpio_out[5]}]
set_property PULLUP true [get_ports {gpio_out[5]}]
#DES2_RESETN
set_property PACKAGE_PIN B10 [get_ports {gpio_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[6]}]
set_property SLEW SLOW [get_ports {gpio_out[6]}]
set_property DRIVE 4 [get_ports {gpio_out[6]}]
set_property PULLUP true [get_ports {gpio_out[6]}]
#RESERVED
set_property PACKAGE_PIN E12 [get_ports {gpio_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[7]}]
set_property SLEW SLOW [get_ports {gpio_out[7]}]
set_property DRIVE 4 [get_ports {gpio_out[7]}]
#DES1_RESETN
set_property PACKAGE_PIN B11 [get_ports {gpio_out[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[8]}]
set_property SLEW SLOW [get_ports {gpio_out[8]}]
set_property DRIVE 4 [get_ports {gpio_out[8]}]
set_property PULLUP true [get_ports {gpio_out[8]}]
#CAM2_POC_EN
set_property PACKAGE_PIN A10 [get_ports {gpio_out[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[9]}]
set_property SLEW SLOW [get_ports {gpio_out[9]}]
set_property DRIVE 4 [get_ports {gpio_out[9]}]
set_property PULLUP true [get_ports {gpio_out[9]}]

#IIC0
#set_property PACKAGE_PIN G11 [get_ports {iic_0_scl_io}]
#set_property IOSTANDARD LVCMOS33 [get_ports {iic_0_scl_io}]
#set_property SLEW SLOW [get_ports {iic_0_scl_io}]
#set_property DRIVE 4 [get_ports {iic_0_scl_io}]
#set_property PACKAGE_PIN F10 [get_ports {iic_0_sda_io}]
#set_property IOSTANDARD LVCMOS33 [get_ports {iic_0_sda_io}]
#set_property SLEW SLOW [get_ports {iic_0_sda_io}]
#set_property DRIVE 4 [get_ports {iic_0_sda_io}]
###### just for test
set_property PACKAGE_PIN G11 [get_ports iic_scl_io]
set_property PACKAGE_PIN F10 [get_ports iic_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports iic_*]
set_property SLEW SLOW [get_ports iic_*]
set_property DRIVE 4 [get_ports iic_*]

#URAT0
set_property PACKAGE_PIN K13 [get_ports {uart_0_rxd}]
set_property IOSTANDARD LVCMOS33 [get_ports {uart_0_rxd}]
#set_property SLEW SLOW [get_ports {uart_0_rxd}]
#set_property DRIVE 4 [get_ports {uart_0_rxd}]
set_property PACKAGE_PIN J10 [get_ports {uart_0_txd}]
set_property IOSTANDARD LVCMOS33 [get_ports {uart_0_txd}]
set_property SLEW SLOW [get_ports {uart_0_txd}]
set_property DRIVE 4 [get_ports {uart_0_txd}]

#CAN0
set_property PACKAGE_PIN H11 [get_ports {can_0_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {can_0_rx}]
#set_property SLEW SLOW [get_ports {can_0_rx}]
#set_property DRIVE 4 [get_ports {can_0_rx}]
set_property PACKAGE_PIN G10 [get_ports {can_0_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {can_0_tx}]
set_property SLEW SLOW [get_ports {can_0_tx}]
set_property DRIVE 4 [get_ports {can_0_tx}]

#Fan Speed Enable
set_property PACKAGE_PIN A12 [get_ports {fan_en_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {fan_en_b}]
set_property SLEW SLOW [get_ports {fan_en_b}]
set_property DRIVE 4 [get_ports {fan_en_b}]


#I2C signals --> I2C switch 0--> ISP AP1302 + Sensor AR1335
#set_property PACKAGE_PIN G11 [get_ports iic_scl_io]
#set_property PACKAGE_PIN F10 [get_ports iic_sda_io]
#set_property IOSTANDARD LVCMOS33 [get_ports iic_*]
#set_property SLEW SLOW [get_ports iic_*]
#set_property DRIVE 4 [get_ports iic_*]


#Digilent PMOD pins
#set_property PACKAGE_PIN H12 [get_ports mclk_out_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports mclk_out_tx]
#set_property SLEW SLOW [get_ports mclk_out_tx]
#set_property DRIVE 4 [get_ports mclk_out_tx]

#set_property PACKAGE_PIN E10 [get_ports lrclk_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports lrclk_tx]
#set_property SLEW SLOW [get_ports lrclk_tx]
#set_property DRIVE 4 [get_ports lrclk_tx]

#set_property PACKAGE_PIN D10 [get_ports sclk_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports sclk_tx]
#set_property SLEW SLOW [get_ports sclk_tx]
#set_property DRIVE 4 [get_ports sclk_tx]

#set_property PACKAGE_PIN C11 [get_ports sdata_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports sdata_tx]
#set_property SLEW SLOW [get_ports sdata_tx]
#set_property DRIVE 4 [get_ports sdata_tx]

#
##input side
#set_property PACKAGE_PIN B10 [get_ports mclk_out_rx]
#set_property IOSTANDARD LVCMOS33 [get_ports mclk_out_rx]
#set_property SLEW SLOW [get_ports mclk_out_rx]
#set_property DRIVE 4 [get_ports mclk_out_rx]

#set_property PACKAGE_PIN E12 [get_ports lrclk_rx]
#set_property IOSTANDARD LVCMOS33 [get_ports lrclk_rx]
#set_property SLEW SLOW [get_ports lrclk_rx]
#set_property DRIVE 4 [get_ports lrclk_rx]

#set_property PACKAGE_PIN D11 [get_ports sclk_rx]
#set_property IOSTANDARD LVCMOS33 [get_ports sclk_rx]
#set_property SLEW SLOW [get_ports sclk_rx]
#set_property DRIVE 4 [get_ports sclk_rx]

#set_property PACKAGE_PIN B11 [get_ports sdata_rx]
#set_property IOSTANDARD LVCMOS33 [get_ports sdata_rx]

set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
