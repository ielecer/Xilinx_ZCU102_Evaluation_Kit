#CLOCKS
#PS_REF_CLK 33 MHz U69 SI5341B
#Other net PACKAGE_PIN U24 - PS_REF_CLK Bank 503

#CLK_125 125 MHz U69 SI5341B
set_property PACKAGE_PIN F21 [get_ports "CLK_125_N"]
set_property IOSTANDARD LVDS_25 [get_ports "CLK_125_N"]
set_property PACKAGE_PIN G21 [get_ports "CLK_125_P"]
set_property IOSTANDARD LVDS_25 [get_ports "CLK_125_P"]

#CLK_74_25 74.25 MHz U69 SI5341B
set_property PACKAGE_PIN AK14 [get_ports "CLK_74_25_N"]
set_property IOSTANDARD LVDS_25 [get_ports "CLK_74_25_N"]
set_property PACKAGE_PIN AK15 [get_ports "CLK_74_25_P"]
set_property IOSTANDARD LVDS_25 [get_ports "CLK_74_25_P"]

#USER_SI570 300 MHz
set_property PACKAGE_PIN AL7 [get_ports "USER_SI570_N"]
set_property IOSTANDARD DIFF_SSTL12 [get_ports "USER_SI570_N"]
set_property PACKAGE_PIN AL8 [get_ports "USER_SI570_P"]
set_property IOSTANDARD DIFF_SSTL12 [get_ports "USER_SI570_P"]

#LED
set_property PACKAGE_PIN AG14 [get_ports "GPIO_LED_0"]
set_property IOSTANDARD LVCMOS33 [get_ports "GPIO_LED_0"]
set_property PACKAGE_PIN AF13 [get_ports "GPIO_LED_1"]
set_property IOSTANDARD LVCMOS33 [get_ports "GPIO_LED_1"]
set_property PACKAGE_PIN AE13 [get_ports "GPIO_LED_2"]
set_property IOSTANDARD LVCMOS33 [get_ports "GPIO_LED_2"]
set_property PACKAGE_PIN AL12 [get_ports "GPIO_LED_7"]
set_property IOSTANDARD LVCMOS33 [get_ports "GPIO_LED_7"] 

#DIP SWITCH 8-POLE
set_property PACKAGE_PIN AK13 [get_ports "GPIO_DIP_SW7"]
set_property IOSTANDARD LVCMOS33 [get_ports "GPIO_DIP_SW7"]
