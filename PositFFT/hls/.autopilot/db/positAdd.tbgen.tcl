set moduleName positAdd
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
set C_modelName {positAdd}
set C_modelType { int 39 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ x_sign int 1 regular  }
	{ x_isZero int 1 regular  }
	{ x_regime1 int 6 regular  }
	{ x_exponent2 int 1 regular  }
	{ x_mantissa3 int 30 regular  }
	{ y_sign_val int 1 regular  }
	{ y_isZero_val int 1 regular  }
	{ y_regime1_val int 6 regular  }
	{ y_exponent2_val int 1 regular  }
	{ y_mantissa3_val int 30 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "x_sign", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_isZero", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_regime1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "x_exponent2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_mantissa3", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "y_sign_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_isZero_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_regime1_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "y_exponent2_val", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_mantissa3_val", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 39} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
	{ x_sign sc_in sc_lv 1 signal 0 } 
	{ x_isZero sc_in sc_lv 1 signal 1 } 
	{ x_regime1 sc_in sc_lv 6 signal 2 } 
	{ x_exponent2 sc_in sc_lv 1 signal 3 } 
	{ x_mantissa3 sc_in sc_lv 30 signal 4 } 
	{ y_sign_val sc_in sc_lv 1 signal 5 } 
	{ y_isZero_val sc_in sc_lv 1 signal 6 } 
	{ y_regime1_val sc_in sc_lv 6 signal 7 } 
	{ y_exponent2_val sc_in sc_lv 1 signal 8 } 
	{ y_mantissa3_val sc_in sc_lv 30 signal 9 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
	{ ap_return_2 sc_out sc_lv 6 signal -1 } 
	{ ap_return_3 sc_out sc_lv 1 signal -1 } 
	{ ap_return_4 sc_out sc_lv 30 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }} , 
 	{ "name": "x_sign", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_sign", "role": "default" }} , 
 	{ "name": "x_isZero", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_isZero", "role": "default" }} , 
 	{ "name": "x_regime1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_regime1", "role": "default" }} , 
 	{ "name": "x_exponent2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_exponent2", "role": "default" }} , 
 	{ "name": "x_mantissa3", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "x_mantissa3", "role": "default" }} , 
 	{ "name": "y_sign_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_sign_val", "role": "default" }} , 
 	{ "name": "y_isZero_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_isZero_val", "role": "default" }} , 
 	{ "name": "y_regime1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "y_regime1_val", "role": "default" }} , 
 	{ "name": "y_exponent2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_exponent2_val", "role": "default" }} , 
 	{ "name": "y_mantissa3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "y_mantissa3_val", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_1_1_1_U67", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_1_1_1_U68", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_3_6_1_1_U69", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_3_30_1_1_U70", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_sign { ap_none {  { x_sign in_data 0 1 } } }
	x_isZero { ap_none {  { x_isZero in_data 0 1 } } }
	x_regime1 { ap_none {  { x_regime1 in_data 0 6 } } }
	x_exponent2 { ap_none {  { x_exponent2 in_data 0 1 } } }
	x_mantissa3 { ap_none {  { x_mantissa3 in_data 0 30 } } }
	y_sign_val { ap_none {  { y_sign_val in_data 0 1 } } }
	y_isZero_val { ap_none {  { y_isZero_val in_data 0 1 } } }
	y_regime1_val { ap_none {  { y_regime1_val in_data 0 6 } } }
	y_exponent2_val { ap_none {  { y_exponent2_val in_data 0 1 } } }
	y_mantissa3_val { ap_none {  { y_mantissa3_val in_data 0 30 } } }
}
