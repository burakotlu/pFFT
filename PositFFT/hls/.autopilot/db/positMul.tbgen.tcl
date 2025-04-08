set moduleName positMul
set isTopModule 0
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
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
set C_modelName {positMul}
set C_modelType { int 38 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ x_sign int 1 regular  }
	{ x_isZero int 1 regular  }
	{ x_regime1 int 6 regular  }
	{ x_exponent2 int 1 regular  }
	{ x_mantissa int 30 regular  }
	{ y_sign int 1 regular  }
	{ y_isZero int 1 regular  }
	{ y_regime1 int 6 regular  }
	{ y_exponent2 int 1 regular  }
	{ y_mantissa3 int 30 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "x_sign", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_isZero", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_regime1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "x_exponent2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_mantissa", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "y_sign", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_isZero", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_regime1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "y_exponent2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_mantissa3", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 38} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_sign sc_in sc_lv 1 signal 0 } 
	{ x_isZero sc_in sc_lv 1 signal 1 } 
	{ x_regime1 sc_in sc_lv 6 signal 2 } 
	{ x_exponent2 sc_in sc_lv 1 signal 3 } 
	{ x_mantissa sc_in sc_lv 30 signal 4 } 
	{ y_sign sc_in sc_lv 1 signal 5 } 
	{ y_isZero sc_in sc_lv 1 signal 6 } 
	{ y_regime1 sc_in sc_lv 6 signal 7 } 
	{ y_exponent2 sc_in sc_lv 1 signal 8 } 
	{ y_mantissa3 sc_in sc_lv 30 signal 9 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
	{ ap_return_2 sc_out sc_lv 6 signal -1 } 
	{ ap_return_3 sc_out sc_lv 30 signal -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
}
set NewPortList {[ 
	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_sign", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_sign", "role": "default" }} , 
 	{ "name": "x_isZero", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_isZero", "role": "default" }} , 
 	{ "name": "x_regime1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_regime1", "role": "default" }} , 
 	{ "name": "x_exponent2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_exponent2", "role": "default" }} , 
 	{ "name": "x_mantissa", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "x_mantissa", "role": "default" }} , 
 	{ "name": "y_sign", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_sign", "role": "default" }} , 
 	{ "name": "y_isZero", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_isZero", "role": "default" }} , 
 	{ "name": "y_regime1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "y_regime1", "role": "default" }} , 
 	{ "name": "y_exponent2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_exponent2", "role": "default" }} , 
 	{ "name": "y_mantissa3", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "y_mantissa3", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_30ns_30ns_60_1_1_U105", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x_sign { ap_none {  { x_sign in_data 0 1 } } }
	x_isZero { ap_none {  { x_isZero in_data 0 1 } } }
	x_regime1 { ap_none {  { x_regime1 in_data 0 6 } } }
	x_exponent2 { ap_none {  { x_exponent2 in_data 0 1 } } }
	x_mantissa { ap_none {  { x_mantissa in_data 0 30 } } }
	y_sign { ap_none {  { y_sign in_data 0 1 } } }
	y_isZero { ap_none {  { y_isZero in_data 0 1 } } }
	y_regime1 { ap_none {  { y_regime1 in_data 0 6 } } }
	y_exponent2 { ap_none {  { y_exponent2 in_data 0 1 } } }
	y_mantissa3 { ap_none {  { y_mantissa3 in_data 0 30 } } }
}
