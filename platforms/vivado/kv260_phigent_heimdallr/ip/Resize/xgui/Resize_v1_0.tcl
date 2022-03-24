# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Arch [ipgui::add_page $IPINST -name "Arch"]
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Arch} -widget comboBox
  ipgui::add_param $IPINST -name "AXI_ID_W" -parent ${Arch}
  ipgui::add_param $IPINST -name "SRC_IMAGE_W" -parent ${Arch}
  ipgui::add_param $IPINST -name "SRC_IMAGE_H" -parent ${Arch}
  ipgui::add_param $IPINST -name "TAR_IMAGE_W" -parent ${Arch}
  ipgui::add_param $IPINST -name "TAR_IMAGE_H" -parent ${Arch}


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

proc update_PARAM_VALUE.AXIS_DATA_W { PARAM_VALUE.AXIS_DATA_W } {
	# Procedure called to update AXIS_DATA_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXIS_DATA_W { PARAM_VALUE.AXIS_DATA_W } {
	# Procedure called to validate AXIS_DATA_W
	return true
}

proc update_PARAM_VALUE.AXI_ADDR_W { PARAM_VALUE.AXI_ADDR_W } {
	# Procedure called to update AXI_ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ADDR_W { PARAM_VALUE.AXI_ADDR_W } {
	# Procedure called to validate AXI_ADDR_W
	return true
}

proc update_PARAM_VALUE.AXI_DATA_STRB { PARAM_VALUE.AXI_DATA_STRB } {
	# Procedure called to update AXI_DATA_STRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_DATA_STRB { PARAM_VALUE.AXI_DATA_STRB } {
	# Procedure called to validate AXI_DATA_STRB
	return true
}

proc update_PARAM_VALUE.AXI_DATA_W { PARAM_VALUE.AXI_DATA_W } {
	# Procedure called to update AXI_DATA_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_DATA_W { PARAM_VALUE.AXI_DATA_W } {
	# Procedure called to validate AXI_DATA_W
	return true
}

proc update_PARAM_VALUE.AXI_ID_W { PARAM_VALUE.AXI_ID_W } {
	# Procedure called to update AXI_ID_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_W { PARAM_VALUE.AXI_ID_W } {
	# Procedure called to validate AXI_ID_W
	return true
}

proc update_PARAM_VALUE.AXI_LEN_W { PARAM_VALUE.AXI_LEN_W } {
	# Procedure called to update AXI_LEN_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_LEN_W { PARAM_VALUE.AXI_LEN_W } {
	# Procedure called to validate AXI_LEN_W
	return true
}

proc update_PARAM_VALUE.CP { PARAM_VALUE.CP } {
	# Procedure called to update CP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CP { PARAM_VALUE.CP } {
	# Procedure called to validate CP
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DP { PARAM_VALUE.DP } {
	# Procedure called to update DP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DP { PARAM_VALUE.DP } {
	# Procedure called to validate DP
	return true
}

proc update_PARAM_VALUE.DSP48_VER { PARAM_VALUE.DSP48_VER } {
	# Procedure called to update DSP48_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DSP48_VER { PARAM_VALUE.DSP48_VER } {
	# Procedure called to validate DSP48_VER
	return true
}

proc update_PARAM_VALUE.IC { PARAM_VALUE.IC } {
	# Procedure called to update IC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IC { PARAM_VALUE.IC } {
	# Procedure called to validate IC
	return true
}

proc update_PARAM_VALUE.SRC_IMAGE_H { PARAM_VALUE.SRC_IMAGE_H } {
	# Procedure called to update SRC_IMAGE_H when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IMAGE_H { PARAM_VALUE.SRC_IMAGE_H } {
	# Procedure called to validate SRC_IMAGE_H
	return true
}

proc update_PARAM_VALUE.SRC_IMAGE_W { PARAM_VALUE.SRC_IMAGE_W } {
	# Procedure called to update SRC_IMAGE_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_IMAGE_W { PARAM_VALUE.SRC_IMAGE_W } {
	# Procedure called to validate SRC_IMAGE_W
	return true
}

proc update_PARAM_VALUE.TAR_IMAGE_H { PARAM_VALUE.TAR_IMAGE_H } {
	# Procedure called to update TAR_IMAGE_H when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TAR_IMAGE_H { PARAM_VALUE.TAR_IMAGE_H } {
	# Procedure called to validate TAR_IMAGE_H
	return true
}

proc update_PARAM_VALUE.TAR_IMAGE_W { PARAM_VALUE.TAR_IMAGE_W } {
	# Procedure called to update TAR_IMAGE_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TAR_IMAGE_W { PARAM_VALUE.TAR_IMAGE_W } {
	# Procedure called to validate TAR_IMAGE_W
	return true
}

proc update_PARAM_VALUE.TUSER_WIDTH { PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to update TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TUSER_WIDTH { PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to validate TUSER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.SRC_IMAGE_W { MODELPARAM_VALUE.SRC_IMAGE_W PARAM_VALUE.SRC_IMAGE_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IMAGE_W}] ${MODELPARAM_VALUE.SRC_IMAGE_W}
}

proc update_MODELPARAM_VALUE.SRC_IMAGE_H { MODELPARAM_VALUE.SRC_IMAGE_H PARAM_VALUE.SRC_IMAGE_H } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_IMAGE_H}] ${MODELPARAM_VALUE.SRC_IMAGE_H}
}

proc update_MODELPARAM_VALUE.TAR_IMAGE_W { MODELPARAM_VALUE.TAR_IMAGE_W PARAM_VALUE.TAR_IMAGE_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TAR_IMAGE_W}] ${MODELPARAM_VALUE.TAR_IMAGE_W}
}

proc update_MODELPARAM_VALUE.TAR_IMAGE_H { MODELPARAM_VALUE.TAR_IMAGE_H PARAM_VALUE.TAR_IMAGE_H } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TAR_IMAGE_H}] ${MODELPARAM_VALUE.TAR_IMAGE_H}
}

proc update_MODELPARAM_VALUE.TUSER_WIDTH { MODELPARAM_VALUE.TUSER_WIDTH PARAM_VALUE.TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TUSER_WIDTH}] ${MODELPARAM_VALUE.TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_ID_W { MODELPARAM_VALUE.AXI_ID_W PARAM_VALUE.AXI_ID_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_W}] ${MODELPARAM_VALUE.AXI_ID_W}
}

proc update_MODELPARAM_VALUE.AXI_LEN_W { MODELPARAM_VALUE.AXI_LEN_W PARAM_VALUE.AXI_LEN_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_LEN_W}] ${MODELPARAM_VALUE.AXI_LEN_W}
}

proc update_MODELPARAM_VALUE.AXI_DATA_W { MODELPARAM_VALUE.AXI_DATA_W PARAM_VALUE.AXI_DATA_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_DATA_W}] ${MODELPARAM_VALUE.AXI_DATA_W}
}

proc update_MODELPARAM_VALUE.AXI_DATA_STRB { MODELPARAM_VALUE.AXI_DATA_STRB PARAM_VALUE.AXI_DATA_STRB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_DATA_STRB}] ${MODELPARAM_VALUE.AXI_DATA_STRB}
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

proc update_MODELPARAM_VALUE.AXIS_DATA_W { MODELPARAM_VALUE.AXIS_DATA_W PARAM_VALUE.AXIS_DATA_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIS_DATA_W}] ${MODELPARAM_VALUE.AXIS_DATA_W}
}

proc update_MODELPARAM_VALUE.DSP48_VER { MODELPARAM_VALUE.DSP48_VER PARAM_VALUE.DSP48_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DSP48_VER}] ${MODELPARAM_VALUE.DSP48_VER}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.CP { MODELPARAM_VALUE.CP PARAM_VALUE.CP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CP}] ${MODELPARAM_VALUE.CP}
}

proc update_MODELPARAM_VALUE.DP { MODELPARAM_VALUE.DP PARAM_VALUE.DP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DP}] ${MODELPARAM_VALUE.DP}
}

proc update_MODELPARAM_VALUE.IC { MODELPARAM_VALUE.IC PARAM_VALUE.IC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IC}] ${MODELPARAM_VALUE.IC}
}

