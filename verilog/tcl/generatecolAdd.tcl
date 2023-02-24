set ColaddExit [lsearch -exact [get_ips colAdd] colAdd]
if { $ColaddExit <0} {
create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name colAdd
}
set_property -dict [list CONFIG.Implementation {DSP48} CONFIG.A_Width {32} CONFIG.B_Width {32} CONFIG.Latency_Configuration {Automatic} CONFIG.CE {false} CONFIG.Out_Width {32} CONFIG.Latency {2} CONFIG.B_Value {00000000000000000000000000000000}] [get_ips colAdd]
