set ColaddExit [lsearch -exact [get_ips colAdd] colAdd]
if { $ColaddExit <0} {
create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name colAdd
}
set_property -dict [list CONFIG.Implementation {DSP48} CONFIG.A_Width {32} CONFIG.B_Width {32} CONFIG.Latency_Configuration {Automatic} CONFIG.CE {false} CONFIG.Out_Width {32} CONFIG.Latency {2} CONFIG.B_Value {00000000000000000000000000000000}] [get_ips colAdd]
set PEaddExit [lsearch -exact [get_ips PEAdd] PEAdd]
if { $PEaddExit <0} {
create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name PEAdd
}
set_property -dict [list CONFIG.Implementation {DSP48} CONFIG.A_Width {32} CONFIG.B_Width {32} CONFIG.Latency_Configuration {Manual} CONFIG.Latency {1} CONFIG.CE {false} CONFIG.Out_Width {32} CONFIG.B_Value {00000000000000000000000000000000}] [get_ips PEAdd]
set mulExit [lsearch -exact [get_ips PEMul] PEMul]
if { $mulExit <0} {
create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name PEMul
}
set_property -dict [list CONFIG.PortAType {Unsigned} CONFIG.PortAWidth {8} CONFIG.PortBWidth {8} CONFIG.Multiplier_Construction {Use_Mults} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {31} CONFIG.PipeStages {3}] [get_ips PEMul]
