set moduleName pReduceAngle
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
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
set C_modelName {pReduceAngle}
set C_modelType { int 39 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ x_sign int 1 regular  }
	{ x_regime int 6 regular  }
	{ x_exponent int 1 regular  }
	{ x_mantissa int 30 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "x_sign", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_regime", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "x_exponent", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_mantissa", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 39} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_sign sc_in sc_lv 1 signal 0 } 
	{ x_regime sc_in sc_lv 6 signal 1 } 
	{ x_exponent sc_in sc_lv 1 signal 2 } 
	{ x_mantissa sc_in sc_lv 30 signal 3 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 6 signal -1 } 
	{ ap_return_2 sc_out sc_lv 1 signal -1 } 
	{ ap_return_3 sc_out sc_lv 30 signal -1 } 
	{ ap_return_4 sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_sign", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_sign", "role": "default" }} , 
 	{ "name": "x_regime", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_regime", "role": "default" }} , 
 	{ "name": "x_exponent", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_exponent", "role": "default" }} , 
 	{ "name": "x_mantissa", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "x_mantissa", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "6", "11", "16"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_255", "Parent" : "0", "Child" : ["2", "3", "4", "5"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U67", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U68", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_255.sparsemux_7_3_6_1_1_U69", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_255.sparsemux_7_3_30_1_1_U70", "Parent" : "1"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_275", "Parent" : "0", "Child" : ["7", "8", "9", "10"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U67", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U68", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_275.sparsemux_7_3_6_1_1_U69", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_275.sparsemux_7_3_30_1_1_U70", "Parent" : "6"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_296", "Parent" : "0", "Child" : ["12", "13", "14", "15"],
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
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U67", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U68", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_296.sparsemux_7_3_6_1_1_U69", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_296.sparsemux_7_3_30_1_1_U70", "Parent" : "11"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_59ns_61ns_119_1_1_U84", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		y_mantissa3_val {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "25", "Max" : "25"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_sign { ap_none {  { x_sign in_data 0 1 } } }
	x_regime { ap_none {  { x_regime in_data 0 6 } } }
	x_exponent { ap_none {  { x_exponent in_data 0 1 } } }
	x_mantissa { ap_none {  { x_mantissa in_data 0 30 } } }
}
