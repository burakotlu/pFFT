set moduleName pAccumulateFC
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
set C_modelName {pAccumulateFC}
set C_modelType { int 78 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ k int 6 regular  }
	{ p_read int 40 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "k", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 78} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ k sc_in sc_lv 6 signal 0 } 
	{ p_read sc_in sc_lv 40 signal 1 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
	{ ap_return_2 sc_out sc_lv 6 signal -1 } 
	{ ap_return_3 sc_out sc_lv 1 signal -1 } 
	{ ap_return_4 sc_out sc_lv 30 signal -1 } 
	{ ap_return_5 sc_out sc_lv 1 signal -1 } 
	{ ap_return_6 sc_out sc_lv 1 signal -1 } 
	{ ap_return_7 sc_out sc_lv 6 signal -1 } 
	{ ap_return_8 sc_out sc_lv 1 signal -1 } 
	{ ap_return_9 sc_out sc_lv 30 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "k", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "ap_return_8", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_8", "role": "default" }} , 
 	{ "name": "ap_return_9", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_9", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "43", "106", "107"],
		"CDFG" : "pAccumulateFC",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "590", "EstimateLatencyMax" : "649",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "k", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "log_inverse_lut_table_0_5_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_inverse_lut_table_0_5_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_12_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_12_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_17_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_17_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_22_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_22_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_27_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_27_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "log_lut_table_ap_fixed_32_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "log_lut_table_ap_fixed_32_6_64_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "mask_table", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "one_half_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "one_half_table", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "mask_table_50", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "mask_table_50", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_double2posit_fu_120", "Port" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Inst_start_state" : "17", "Inst_end_state" : "18"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120", "Parent" : "0", "Child" : ["2", "3", "4", "5", "27", "38", "39", "40", "41", "42"],
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
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_inverse_lut_table_0_5_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log0_lut_table_ap_fixed_double_0_5_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_12_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_12_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_17_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_17_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_22_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_22_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_27_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_27_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "log_lut_table_ap_fixed_32_6_64_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_log_generic_double_s_fu_282", "Port" : "log_lut_table_ap_fixed_32_6_64_array", "Inst_start_state" : "3", "Inst_end_state" : "15"}]},
			{"Name" : "mask_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "one_half_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mask_table_50", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]},
			{"Name" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_pow_generic_double_s_fu_305", "Port" : "pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array", "Inst_start_state" : "37", "Inst_end_state" : "49"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.mask_table_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.one_half_table_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.mask_table_50_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282", "Parent" : "1", "Child" : ["6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
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
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_inverse_lut_table_0_5_64_array_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log0_lut_table_ap_fixed_double_0_5_64_array_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_U", "Parent" : "5"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_12_6_64_array_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_17_6_64_array_U", "Parent" : "5"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_22_6_64_array_U", "Parent" : "5"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_27_6_64_array_U", "Parent" : "5"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.log_lut_table_ap_fixed_32_6_64_array_U", "Parent" : "5"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_12s_66ns_76_1_1_U1", "Parent" : "5"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_28ns_28ns_55_1_1_U2", "Parent" : "5"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_54s_6ns_54_1_1_U3", "Parent" : "5"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_58ns_6ns_63_1_1_U4", "Parent" : "5"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_59ns_6ns_65_1_1_U5", "Parent" : "5"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_63ns_6ns_68_1_1_U6", "Parent" : "5"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_68ns_6ns_73_1_1_U7", "Parent" : "5"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_69ns_6ns_75_1_1_U8", "Parent" : "5"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_73ns_6ns_78_1_1_U9", "Parent" : "5"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.mul_57ns_4ns_61_1_1_U10", "Parent" : "5"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.bitselect_1ns_154ns_32ns_1_1_1_U11", "Parent" : "5"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_log_generic_double_s_fu_282.partselect_52ns_154ns_32ns_52_1_1_U12", "Parent" : "5"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305", "Parent" : "1", "Child" : ["28", "29", "30", "31", "32", "33", "34", "35", "36", "37"],
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
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array_U", "Parent" : "27"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array_U", "Parent" : "27"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mul_13s_71s_71_1_1_U35", "Parent" : "27"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mul_43ns_36ns_79_1_1_U36", "Parent" : "27"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mul_49ns_44ns_93_1_1_U37", "Parent" : "27"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mul_50ns_50ns_99_1_1_U38", "Parent" : "27"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mul_54s_67ns_120_1_1_U39", "Parent" : "27"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.sparsemux_11_4_64_1_1_U40", "Parent" : "27"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.grp_pow_generic_double_s_fu_305.mac_muladd_16s_15ns_19s_31_4_1_U41", "Parent" : "27"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.dsub_64ns_64ns_64_5_full_dsp_1_U53", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.dcmp_64ns_64ns_1_2_no_dsp_1_U55", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.sitodp_32s_64_4_no_dsp_1_U56", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.sparsemux_7_2_64_1_1_U57", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_double2posit_fu_120.sparsemux_9_3_64_1_1_U58", "Parent" : "1"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155", "Parent" : "0", "Child" : ["44", "80", "97", "102", "104", "105"],
		"CDFG" : "pAccumulateFC_Pipeline_VITIS_LOOP_1345_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "569", "EstimateLatencyMax" : "569",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_i321_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i_i351_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "deltaTheta_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "deltaTheta_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "deltaTheta_regime", "Type" : "None", "Direction" : "I"},
			{"Name" : "deltaTheta_mantissa", "Type" : "None", "Direction" : "I"},
			{"Name" : "imagSum_mantissa_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "imagSum_exponent_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "imagSum_regime_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "imagSum_isZero_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "imagSum_sign_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "realSum_mantissa_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "realSum_exponent_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "realSum_regime_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "realSum_isZero_write_assign_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "realSum_sign_write_assign_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_1345_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage7", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage7_subdone", "QuitState" : "ap_ST_fsm_pp0_stage7", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage7_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382", "Parent" : "43", "Child" : ["45", "62", "67", "72", "77", "78", "79"],
		"CDFG" : "positCos",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "51", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "51",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169", "Parent" : "44", "Child" : ["46", "51", "56", "61"],
		"CDFG" : "pReduceAngle",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "25", "EstimateLatencyMin" : "25", "EstimateLatencyMax" : "25",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "46", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255", "Parent" : "45", "Child" : ["47", "48", "49", "50"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "47", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U67", "Parent" : "46"},
	{"ID" : "48", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U68", "Parent" : "46"},
	{"ID" : "49", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_3_6_1_1_U69", "Parent" : "46"},
	{"ID" : "50", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_3_30_1_1_U70", "Parent" : "46"},
	{"ID" : "51", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275", "Parent" : "45", "Child" : ["52", "53", "54", "55"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "52", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U67", "Parent" : "51"},
	{"ID" : "53", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U68", "Parent" : "51"},
	{"ID" : "54", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_3_6_1_1_U69", "Parent" : "51"},
	{"ID" : "55", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_3_30_1_1_U70", "Parent" : "51"},
	{"ID" : "56", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296", "Parent" : "45", "Child" : ["57", "58", "59", "60"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "57", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U67", "Parent" : "56"},
	{"ID" : "58", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U68", "Parent" : "56"},
	{"ID" : "59", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_3_6_1_1_U69", "Parent" : "56"},
	{"ID" : "60", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_3_30_1_1_U70", "Parent" : "56"},
	{"ID" : "61", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_pReduceAngle_fu_169.mul_59ns_61ns_119_1_1_U84", "Parent" : "45"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_177", "Parent" : "44", "Child" : ["63", "64", "65", "66"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "63", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_2_1_1_1_U67", "Parent" : "62"},
	{"ID" : "64", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_2_1_1_1_U68", "Parent" : "62"},
	{"ID" : "65", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_3_6_1_1_U69", "Parent" : "62"},
	{"ID" : "66", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_3_30_1_1_U70", "Parent" : "62"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_198", "Parent" : "44", "Child" : ["68", "69", "70", "71"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "68", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_2_1_1_1_U67", "Parent" : "67"},
	{"ID" : "69", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_2_1_1_1_U68", "Parent" : "67"},
	{"ID" : "70", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_3_6_1_1_U69", "Parent" : "67"},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_3_30_1_1_U70", "Parent" : "67"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_214", "Parent" : "44", "Child" : ["73", "74", "75", "76"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "73", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_2_1_1_1_U67", "Parent" : "72"},
	{"ID" : "74", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_2_1_1_1_U68", "Parent" : "72"},
	{"ID" : "75", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_3_6_1_1_U69", "Parent" : "72"},
	{"ID" : "76", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_3_30_1_1_U70", "Parent" : "72"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U90", "Parent" : "44"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U91", "Parent" : "44"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U92", "Parent" : "44"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394", "Parent" : "43", "Child" : ["81", "86", "91", "96"],
		"CDFG" : "pNAngle",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "25", "EstimateLatencyMin" : "25", "EstimateLatencyMax" : "25",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_257", "Parent" : "80", "Child" : ["82", "83", "84", "85"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "82", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_2_1_1_1_U67", "Parent" : "81"},
	{"ID" : "83", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_2_1_1_1_U68", "Parent" : "81"},
	{"ID" : "84", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_3_6_1_1_U69", "Parent" : "81"},
	{"ID" : "85", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_3_30_1_1_U70", "Parent" : "81"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_274", "Parent" : "80", "Child" : ["87", "88", "89", "90"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "87", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_2_1_1_1_U67", "Parent" : "86"},
	{"ID" : "88", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_2_1_1_1_U68", "Parent" : "86"},
	{"ID" : "89", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_3_6_1_1_U69", "Parent" : "86"},
	{"ID" : "90", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_3_30_1_1_U70", "Parent" : "86"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_295", "Parent" : "80", "Child" : ["92", "93", "94", "95"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "92", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_2_1_1_1_U67", "Parent" : "91"},
	{"ID" : "93", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_2_1_1_1_U68", "Parent" : "91"},
	{"ID" : "94", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_3_6_1_1_U69", "Parent" : "91"},
	{"ID" : "95", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_3_30_1_1_U70", "Parent" : "91"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_pNAngle_fu_394.mul_59ns_61ns_119_1_1_U99", "Parent" : "80"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positAdd_fu_406", "Parent" : "43", "Child" : ["98", "99", "100", "101"],
		"CDFG" : "positAdd",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa3", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3_val", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positAdd_fu_406.sparsemux_7_2_1_1_1_U67", "Parent" : "97"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positAdd_fu_406.sparsemux_7_2_1_1_1_U68", "Parent" : "97"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positAdd_fu_406.sparsemux_7_3_6_1_1_U69", "Parent" : "97"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positAdd_fu_406.sparsemux_7_3_30_1_1_U70", "Parent" : "97"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positMul_fu_430", "Parent" : "43", "Child" : ["103"],
		"CDFG" : "positMul",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_mantissa", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_sign", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_isZero", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_regime1", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_exponent2", "Type" : "None", "Direction" : "I"},
			{"Name" : "y_mantissa3", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.grp_positMul_fu_430.mul_30ns_30ns_60_1_1_U105", "Parent" : "102"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.mul_30ns_30ns_60_1_1_U116", "Parent" : "43"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_6_max_dsp_1_U135", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32ns_64_4_no_dsp_1_U136", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pAccumulateFC {
		k {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 17 FirstWrite -1}
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
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}
	pAccumulateFC_Pipeline_VITIS_LOOP_1345_1 {
		empty_5 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		add_i321_i {Type I LastRead 0 FirstWrite -1}
		conv3_i_i351_i {Type I LastRead 0 FirstWrite -1}
		deltaTheta_sign {Type I LastRead 0 FirstWrite -1}
		deltaTheta_isZero {Type I LastRead 0 FirstWrite -1}
		deltaTheta_regime {Type I LastRead 0 FirstWrite -1}
		deltaTheta_mantissa {Type I LastRead 0 FirstWrite -1}
		imagSum_mantissa_write_assign_out {Type O LastRead -1 FirstWrite 55}
		imagSum_exponent_write_assign_out {Type O LastRead -1 FirstWrite 55}
		imagSum_regime_write_assign_out {Type O LastRead -1 FirstWrite 55}
		imagSum_isZero_write_assign_out {Type O LastRead -1 FirstWrite 55}
		imagSum_sign_write_assign_out {Type O LastRead -1 FirstWrite 55}
		realSum_mantissa_write_assign_out {Type O LastRead -1 FirstWrite 55}
		realSum_exponent_write_assign_out {Type O LastRead -1 FirstWrite 55}
		realSum_regime_write_assign_out {Type O LastRead -1 FirstWrite 55}
		realSum_isZero_write_assign_out {Type O LastRead -1 FirstWrite 55}
		realSum_sign_write_assign_out {Type O LastRead -1 FirstWrite 55}}
	positCos {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime {Type I LastRead 0 FirstWrite -1}
		x_exponent {Type I LastRead 0 FirstWrite -1}
		x_mantissa {Type I LastRead 0 FirstWrite -1}}
	pReduceAngle {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_regime {Type I LastRead 0 FirstWrite -1}
		x_exponent {Type I LastRead 0 FirstWrite -1}
		x_mantissa {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	pNAngle {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime {Type I LastRead 0 FirstWrite -1}
		x_exponent {Type I LastRead 0 FirstWrite -1}
		x_mantissa {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positAdd {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa3 {Type I LastRead 0 FirstWrite -1}
		y_sign_val {Type I LastRead 0 FirstWrite -1}
		y_isZero_val {Type I LastRead 0 FirstWrite -1}
		y_regime1_val {Type I LastRead 0 FirstWrite -1}
		y_exponent2_val {Type I LastRead 0 FirstWrite -1}
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}
	positMul {
		x_sign {Type I LastRead 0 FirstWrite -1}
		x_isZero {Type I LastRead 0 FirstWrite -1}
		x_regime1 {Type I LastRead 0 FirstWrite -1}
		x_exponent2 {Type I LastRead 0 FirstWrite -1}
		x_mantissa {Type I LastRead 0 FirstWrite -1}
		y_sign {Type I LastRead 0 FirstWrite -1}
		y_isZero {Type I LastRead 0 FirstWrite -1}
		y_regime1 {Type I LastRead 0 FirstWrite -1}
		y_exponent2 {Type I LastRead 0 FirstWrite -1}
		y_mantissa3 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "590", "Max" : "649"}
	, {"Name" : "Interval", "Min" : "590", "Max" : "649"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	k { ap_none {  { k in_data 0 6 } } }
	p_read { ap_none {  { p_read in_data 0 40 } } }
}
