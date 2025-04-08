set moduleName log_generic_double_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 1
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 13
set C_modelName {log_generic<double>}
set C_modelType { double 64 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ base_r double 64 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "base_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 64} ]}
# RTL Port declarations: 
set portNum 4
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ base_r sc_in sc_lv 64 signal 0 } 
	{ ap_return sc_out sc_lv 64 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "base_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "base_r", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
		"CDFG" : "log_generic_double_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "11", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "base_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "log_inverse_lut_table_0_5_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_12_6_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_17_6_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_22_6_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_27_6_64_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "log_lut_table_ap_fixed_32_6_64_array", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_inverse_lut_table_0_5_64_array_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log0_lut_table_ap_fixed_double_0_5_64_array_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_12_6_64_array_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_17_6_64_array_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_22_6_64_array_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_27_6_64_array_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.log_lut_table_ap_fixed_32_6_64_array_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_12s_66ns_76_1_1_U1", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_28ns_28ns_55_1_1_U2", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_54s_6ns_54_1_1_U3", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_58ns_6ns_63_1_1_U4", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_59ns_6ns_65_1_1_U5", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_63ns_6ns_68_1_1_U6", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_68ns_6ns_73_1_1_U7", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_69ns_6ns_75_1_1_U8", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_73ns_6ns_78_1_1_U9", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_57ns_4ns_61_1_1_U10", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitselect_1ns_154ns_32ns_1_1_1_U11", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partselect_52ns_154ns_32ns_52_1_1_U12", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	log_generic_double_s {
		base_r {Type I LastRead 0 FirstWrite -1}
		log_inverse_lut_table_0_5_64_array {Type I LastRead -1 FirstWrite -1}
		log0_lut_table_ap_fixed_double_0_5_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_12_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_17_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_22_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_27_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_32_6_64_array {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	base_r { ap_none {  { base_r in_data 0 64 } } }
}
