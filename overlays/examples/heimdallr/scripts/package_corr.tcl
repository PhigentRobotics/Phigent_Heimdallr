# set xoname    [lindex $::argv 0]
# set krnl_name [lindex $::argv 1]
# set target    [lindex $::argv 2]
# set device    [lindex $::argv 3]


set path_to_ip "../../corr_ip"
set path_to_packaged "./packaged_kernel_${suffix}"
# set path_to_packaged "release/Corr_ip_package"
set path_to_tmp_project "./tmp_kernel_pack_${suffix}"

#********************************************
#****   create project
#********************************************
create_project -force kernel_pack $path_to_tmp_project
# set_property board_part xilinx.com:kv260:part0:1.1 [current_project]
add_files -norecurse -force [glob $path_to_ip/hdl/* corr_conf.vh]
set_property top corr_wrapper [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

#********************************************
#****   package_project
#********************************************
ipx::package_project -root_dir $path_to_packaged -vendor phigent.ai -library RTLKernel -taxonomy /KernelIP -import_files -set_current false
ipx::unload_core $path_to_packaged/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $path_to_packaged $path_to_packaged/component.xml
set_property core_revision 0 [ipx::current_core]
set_property name Corr [ipx::current_core]
set_property display_name {Phigent Corr IP} [ipx::current_core]
#foreach up [ipx::get_user_parameters] {
#  ipx::remove_user_parameter [get_property NAME $up] [ipx::current_core]
#}
ipgui::remove_page -component [ipx::current_core] [ipgui::get_pagespec -name "Page 0" -component [ipx::current_core]]
set_property sdx_kernel true [ipx::current_core]
set_property sdx_kernel_type rtl [ipx::current_core]
# set_property type ttcl [ipx::get_files src/*.ttcl -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis            -of_objects [ipx::current_core]]]
# set_property type ttcl [ipx::get_files src/*.ttcl -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
# ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s_axi_aclk -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m_axi_aclk -of_objects [ipx::current_core]]
set clk_bus1  [ipx::get_bus_interfaces m_axi_aclk -of_objects [ipx::current_core]]
set clk_freq1 [ipx::get_bus_parameters FREQ_HZ -of_objects $clk_bus1]
set_property value_resolve_type {user} $clk_freq1
# set clk_bus2  [ipx::get_bus_interfaces m_axi_2x_aclk -of_objects [ipx::current_core]]
# set clk_freq2 [ipx::get_bus_parameters FREQ_HZ -of_objects $clk_bus2]
# set_property value_resolve_type {user} $clk_freq2
ipx::create_xgui_files [ipx::current_core]
ipx::associate_bus_interfaces -busif S_AXI_CONTROL -clock m_axi_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif M0_R_IMG_AXI -clock m_axi_aclk [ipx::current_core]
ipx::associate_bus_interfaces -busif M0_L_IMG_AXI -clock m_axi_aclk [ipx::current_core]

set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} [ipx::current_core]
set_property supported_families { } [ipx::current_core]
set_property auto_family_support_level level_2 [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
# close_project -delete
# start_gui
close_project
