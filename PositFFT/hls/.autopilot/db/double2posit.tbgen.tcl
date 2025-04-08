set moduleName double2posit
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
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
set C_modelName {double2posit}
set C_modelType { int 38 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ div double 64 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "div", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 38} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ div sc_in sc_lv 64 signal 0 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
	{ ap_return_2 sc_out sc_lv 6 signal -1 } 
	{ ap_return_3 sc_out sc_lv 30 signal -1 } 
	{ grp_fu_177_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_177_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_177_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_177_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "div", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "div", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "grp_fu_177_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_177_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_177_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_177_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_177_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_177_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_177_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_177_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "26", "37", "38", "39", "40", "41"],
		"CDFG" : "double2posit",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "61",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "div", "Type" : "None", "Direction" : "I"},
			{"Name" : "log_inverse_lut_table_0_5_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_inverse_lut_table_0_5_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_12_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_12_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_17_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_17_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_22_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_22_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_27_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_27_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_32_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_32_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "one_half_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mask_table_50", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mask_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.one_half_table_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mask_table_50_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282", "Parent" : "0", "Child" : ["5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"],
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
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_inverse_lut_table_0_5_64_array_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log0_lut_table_ap_fixed_double_0_5_64_array_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_U", "Parent" : "4"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_U", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_12_6_64_array_U", "Parent" : "4"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_17_6_64_array_U", "Parent" : "4"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_22_6_64_array_U", "Parent" : "4"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_27_6_64_array_U", "Parent" : "4"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_32_6_64_array_U", "Parent" : "4"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_12s_66ns_76_1_1_U1", "Parent" : "4"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_28ns_28ns_55_1_1_U2", "Parent" : "4"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_54s_6ns_54_1_1_U3", "Parent" : "4"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_58ns_6ns_63_1_1_U4", "Parent" : "4"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_59ns_6ns_65_1_1_U5", "Parent" : "4"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_63ns_6ns_68_1_1_U6", "Parent" : "4"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_68ns_6ns_73_1_1_U7", "Parent" : "4"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_69ns_6ns_75_1_1_U8", "Parent" : "4"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_73ns_6ns_78_1_1_U9", "Parent" : "4"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.mul_57ns_4ns_61_1_1_U10", "Parent" : "4"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.bitselect_1ns_154ns_32ns_1_1_1_U11", "Parent" : "4"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_log_generic_double_s_fu_282.partselect_52ns_154ns_32ns_52_1_1_U12", "Parent" : "4"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305", "Parent" : "0", "Child" : ["27", "28", "29", "30", "31", "32", "33", "34", "35", "36"],
		"CDFG" : "pow_generic_double_s",
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
			{"Name" : "exp", "Type" : "None", "Direction" : "I"},
			{"Name" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array_U", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array_U", "Parent" : "26"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array_U", "Parent" : "26"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mul_13s_71s_71_1_1_U35", "Parent" : "26"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mul_43ns_36ns_79_1_1_U36", "Parent" : "26"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mul_49ns_44ns_93_1_1_U37", "Parent" : "26"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mul_50ns_50ns_99_1_1_U38", "Parent" : "26"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mul_54s_67ns_120_1_1_U39", "Parent" : "26"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.sparsemux_11_4_64_1_1_U40", "Parent" : "26"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pow_generic_double_s_fu_305.mac_muladd_16s_15ns_19s_31_4_1_U41", "Parent" : "26"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_5_full_dsp_1_U53", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dcmp_64ns_64ns_1_2_no_dsp_1_U55", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32s_64_4_no_dsp_1_U56", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_64_1_1_U57", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_64_1_1_U58", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	double2posit {
		div {Type I LastRead 0 FirstWrite -1}
		log_inverse_lut_table_0_5_64_array {Type I LastRead -1 FirstWrite -1}
		log0_lut_table_ap_fixed_double_0_5_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_12_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_17_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_22_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_27_6_64_array {Type I LastRead -1 FirstWrite -1}
		log_lut_table_ap_fixed_32_6_64_array {Type I LastRead -1 FirstWrite -1}
		mask_table {Type I LastRead -1 FirstWrite -1}
		one_half_table {Type I LastRead -1 FirstWrite -1}
		mask_table_50 {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}
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
		log_lut_table_ap_fixed_32_6_64_array {Type I LastRead -1 FirstWrite -1}}
	pow_generic_double_s {
		exp {Type I LastRead 0 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "61"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "61"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	div { ap_none {  { div in_data 0 64 } } }
}
