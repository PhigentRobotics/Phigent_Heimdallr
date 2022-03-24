# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXIL_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXIL_DATA_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CLKIN_FREQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRIGGER_FREQ" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXIL_ADDR_W { PARAM_VALUE.AXIL_ADDR_W } {
	# Procedure called to update AXIL_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXIL_ADDR_W { PARAM_VALUE.AXIL_ADDR_W } {
	# Procedure called to validate AXIL_ADDR_W
	return true
}

proc update_PARAM_VALUE.AXIL_DATA_W { PARAM_VALUE.AXIL_DATA_W } {
	# Procedure called to update AXIL_DATA_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXIL_DATA_W { PARAM_VALUE.AXIL_DATA_W } {
	# Procedure called to validate AXIL_DATA_W
	return true
}

proc update_PARAM_VALUE.AXI_ADDR_W { PARAM_VALUE.AXI_ADDR_W } {
	# Procedure called to update AXI_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ADDR_W { PARAM_VALUE.AXI_ADDR_W } {
	# Procedure called to validate AXI_ADDR_W
	return true
}

proc update_PARAM_VALUE.CLKIN_FREQ { PARAM_VALUE.CLKIN_FREQ } {
	# Procedure called to update CLKIN_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLKIN_FREQ { PARAM_VALUE.CLKIN_FREQ } {
	# Procedure called to validate CLKIN_FREQ
	return true
}

proc update_PARAM_VALUE.TRIGGER_FREQ { PARAM_VALUE.TRIGGER_FREQ } {
	# Procedure called to update TRIGGER_FREQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRIGGER_FREQ { PARAM_VALUE.TRIGGER_FREQ } {
	# Procedure called to validate TRIGGER_FREQ
	return true
}


proc update_MODELPARAM_VALUE.CLKIN_FREQ { MODELPARAM_VALUE.CLKIN_FREQ PARAM_VALUE.CLKIN_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLKIN_FREQ}] ${MODELPARAM_VALUE.CLKIN_FREQ}
}

proc update_MODELPARAM_VALUE.TRIGGER_FREQ { MODELPARAM_VALUE.TRIGGER_FREQ PARAM_VALUE.TRIGGER_FREQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRIGGER_FREQ}] ${MODELPARAM_VALUE.TRIGGER_FREQ}
}

proc update_MODELPARAM_VALUE.AXI_ADDR_W { MODELPARAM_VALUE.AXI_ADDR_W PARAM_VALUE.AXI_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ADDR_W}] ${MODELPARAM_VALUE.AXI_ADDR_W}
}

proc update_MODELPARAM_VALUE.AXIL_ADDR_W { MODELPARAM_VALUE.AXIL_ADDR_W PARAM_VALUE.AXIL_ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIL_ADDR_W}] ${MODELPARAM_VALUE.AXIL_ADDR_W}
}

proc update_MODELPARAM_VALUE.AXIL_DATA_W { MODELPARAM_VALUE.AXIL_DATA_W PARAM_VALUE.AXIL_DATA_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIL_DATA_W}] ${MODELPARAM_VALUE.AXIL_DATA_W}
}

