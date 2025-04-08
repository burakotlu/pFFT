set moduleName pAccumulateFC_Pipeline_VITIS_LOOP_1345_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type loop_auto_rewind
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
set C_modelName {pAccumulateFC_Pipeline_VITIS_LOOP_1345_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ empty_5 int 1 regular  }
	{ empty int 1 regular  }
	{ add_i321_i int 7 regular  }
	{ conv3_i_i351_i int 30 regular  }
	{ deltaTheta_sign int 1 regular  }
	{ deltaTheta_isZero int 1 regular  }
	{ deltaTheta_regime int 6 regular  }
	{ deltaTheta_mantissa int 30 regular  }
	{ imagSum_mantissa_write_assign_out int 30 regular {pointer 1}  }
	{ imagSum_exponent_write_assign_out int 1 regular {pointer 1}  }
	{ imagSum_regime_write_assign_out int 6 regular {pointer 1}  }
	{ imagSum_isZero_write_assign_out int 1 regular {pointer 1}  }
	{ imagSum_sign_write_assign_out int 1 regular {pointer 1}  }
	{ realSum_mantissa_write_assign_out int 30 regular {pointer 1}  }
	{ realSum_exponent_write_assign_out int 1 regular {pointer 1}  }
	{ realSum_regime_write_assign_out int 6 regular {pointer 1}  }
	{ realSum_isZero_write_assign_out int 1 regular {pointer 1}  }
	{ realSum_sign_write_assign_out int 1 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "empty_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "add_i321_i", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i_i351_i", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "deltaTheta_sign", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "deltaTheta_isZero", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "deltaTheta_regime", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "deltaTheta_mantissa", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imagSum_mantissa_write_assign_out", "interface" : "wire", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "imagSum_exponent_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "imagSum_regime_write_assign_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "imagSum_isZero_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "imagSum_sign_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "realSum_mantissa_write_assign_out", "interface" : "wire", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "realSum_exponent_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "realSum_regime_write_assign_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "realSum_isZero_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "realSum_sign_write_assign_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ empty_5 sc_in sc_lv 1 signal 0 } 
	{ empty sc_in sc_lv 1 signal 1 } 
	{ add_i321_i sc_in sc_lv 7 signal 2 } 
	{ conv3_i_i351_i sc_in sc_lv 30 signal 3 } 
	{ deltaTheta_sign sc_in sc_lv 1 signal 4 } 
	{ deltaTheta_isZero sc_in sc_lv 1 signal 5 } 
	{ deltaTheta_regime sc_in sc_lv 6 signal 6 } 
	{ deltaTheta_mantissa sc_in sc_lv 30 signal 7 } 
	{ imagSum_mantissa_write_assign_out sc_out sc_lv 30 signal 8 } 
	{ imagSum_mantissa_write_assign_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ imagSum_exponent_write_assign_out sc_out sc_lv 1 signal 9 } 
	{ imagSum_exponent_write_assign_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ imagSum_regime_write_assign_out sc_out sc_lv 6 signal 10 } 
	{ imagSum_regime_write_assign_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ imagSum_isZero_write_assign_out sc_out sc_lv 1 signal 11 } 
	{ imagSum_isZero_write_assign_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ imagSum_sign_write_assign_out sc_out sc_lv 1 signal 12 } 
	{ imagSum_sign_write_assign_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ realSum_mantissa_write_assign_out sc_out sc_lv 30 signal 13 } 
	{ realSum_mantissa_write_assign_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ realSum_exponent_write_assign_out sc_out sc_lv 1 signal 14 } 
	{ realSum_exponent_write_assign_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ realSum_regime_write_assign_out sc_out sc_lv 6 signal 15 } 
	{ realSum_regime_write_assign_out_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ realSum_isZero_write_assign_out sc_out sc_lv 1 signal 16 } 
	{ realSum_isZero_write_assign_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ realSum_sign_write_assign_out sc_out sc_lv 1 signal 17 } 
	{ realSum_sign_write_assign_out_ap_vld sc_out sc_logic 1 outvld 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "empty_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty_5", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "add_i321_i", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "add_i321_i", "role": "default" }} , 
 	{ "name": "conv3_i_i351_i", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "conv3_i_i351_i", "role": "default" }} , 
 	{ "name": "deltaTheta_sign", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "deltaTheta_sign", "role": "default" }} , 
 	{ "name": "deltaTheta_isZero", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "deltaTheta_isZero", "role": "default" }} , 
 	{ "name": "deltaTheta_regime", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "deltaTheta_regime", "role": "default" }} , 
 	{ "name": "deltaTheta_mantissa", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "deltaTheta_mantissa", "role": "default" }} , 
 	{ "name": "imagSum_mantissa_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imagSum_mantissa_write_assign_out", "role": "default" }} , 
 	{ "name": "imagSum_mantissa_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "imagSum_mantissa_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "imagSum_exponent_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "imagSum_exponent_write_assign_out", "role": "default" }} , 
 	{ "name": "imagSum_exponent_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "imagSum_exponent_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "imagSum_regime_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "imagSum_regime_write_assign_out", "role": "default" }} , 
 	{ "name": "imagSum_regime_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "imagSum_regime_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "imagSum_isZero_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "imagSum_isZero_write_assign_out", "role": "default" }} , 
 	{ "name": "imagSum_isZero_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "imagSum_isZero_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "imagSum_sign_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "imagSum_sign_write_assign_out", "role": "default" }} , 
 	{ "name": "imagSum_sign_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "imagSum_sign_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "realSum_mantissa_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "realSum_mantissa_write_assign_out", "role": "default" }} , 
 	{ "name": "realSum_mantissa_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "realSum_mantissa_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "realSum_exponent_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "realSum_exponent_write_assign_out", "role": "default" }} , 
 	{ "name": "realSum_exponent_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "realSum_exponent_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "realSum_regime_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "realSum_regime_write_assign_out", "role": "default" }} , 
 	{ "name": "realSum_regime_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "realSum_regime_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "realSum_isZero_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "realSum_isZero_write_assign_out", "role": "default" }} , 
 	{ "name": "realSum_isZero_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "realSum_isZero_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "realSum_sign_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "realSum_sign_write_assign_out", "role": "default" }} , 
 	{ "name": "realSum_sign_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "realSum_sign_write_assign_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "37", "54", "59", "61", "62"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382", "Parent" : "0", "Child" : ["2", "19", "24", "29", "34", "35", "36"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169", "Parent" : "1", "Child" : ["3", "8", "13", "18"],
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
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255", "Parent" : "2", "Child" : ["4", "5", "6", "7"],
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
	{"ID" : "4", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U67", "Parent" : "3"},
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_2_1_1_1_U68", "Parent" : "3"},
	{"ID" : "6", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_3_6_1_1_U69", "Parent" : "3"},
	{"ID" : "7", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_255.sparsemux_7_3_30_1_1_U70", "Parent" : "3"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275", "Parent" : "2", "Child" : ["9", "10", "11", "12"],
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
	{"ID" : "9", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U67", "Parent" : "8"},
	{"ID" : "10", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_2_1_1_1_U68", "Parent" : "8"},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_3_6_1_1_U69", "Parent" : "8"},
	{"ID" : "12", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_275.sparsemux_7_3_30_1_1_U70", "Parent" : "8"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296", "Parent" : "2", "Child" : ["14", "15", "16", "17"],
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
	{"ID" : "14", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U67", "Parent" : "13"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_2_1_1_1_U68", "Parent" : "13"},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_3_6_1_1_U69", "Parent" : "13"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.grp_positAdd_fu_296.sparsemux_7_3_30_1_1_U70", "Parent" : "13"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_pReduceAngle_fu_169.mul_59ns_61ns_119_1_1_U84", "Parent" : "2"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_177", "Parent" : "1", "Child" : ["20", "21", "22", "23"],
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
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_2_1_1_1_U67", "Parent" : "19"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_2_1_1_1_U68", "Parent" : "19"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_3_6_1_1_U69", "Parent" : "19"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_177.sparsemux_7_3_30_1_1_U70", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_198", "Parent" : "1", "Child" : ["25", "26", "27", "28"],
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
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_2_1_1_1_U67", "Parent" : "24"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_2_1_1_1_U68", "Parent" : "24"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_3_6_1_1_U69", "Parent" : "24"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_198.sparsemux_7_3_30_1_1_U70", "Parent" : "24"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_214", "Parent" : "1", "Child" : ["30", "31", "32", "33"],
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
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_2_1_1_1_U67", "Parent" : "29"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_2_1_1_1_U68", "Parent" : "29"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_3_6_1_1_U69", "Parent" : "29"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.grp_positAdd_fu_214.sparsemux_7_3_30_1_1_U70", "Parent" : "29"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U90", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U91", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positCos_fu_382.mul_30ns_30ns_60_1_1_U92", "Parent" : "1"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394", "Parent" : "0", "Child" : ["38", "43", "48", "53"],
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
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_257", "Parent" : "37", "Child" : ["39", "40", "41", "42"],
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
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_2_1_1_1_U67", "Parent" : "38"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_2_1_1_1_U68", "Parent" : "38"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_3_6_1_1_U69", "Parent" : "38"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_257.sparsemux_7_3_30_1_1_U70", "Parent" : "38"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_274", "Parent" : "37", "Child" : ["44", "45", "46", "47"],
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
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_2_1_1_1_U67", "Parent" : "43"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_2_1_1_1_U68", "Parent" : "43"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_3_6_1_1_U69", "Parent" : "43"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_274.sparsemux_7_3_30_1_1_U70", "Parent" : "43"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_295", "Parent" : "37", "Child" : ["49", "50", "51", "52"],
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
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_2_1_1_1_U67", "Parent" : "48"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_2_1_1_1_U68", "Parent" : "48"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_3_6_1_1_U69", "Parent" : "48"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.grp_positAdd_fu_295.sparsemux_7_3_30_1_1_U70", "Parent" : "48"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pNAngle_fu_394.mul_59ns_61ns_119_1_1_U99", "Parent" : "37"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_406", "Parent" : "0", "Child" : ["55", "56", "57", "58"],
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
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_406.sparsemux_7_2_1_1_1_U67", "Parent" : "54"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_406.sparsemux_7_2_1_1_1_U68", "Parent" : "54"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_406.sparsemux_7_3_6_1_1_U69", "Parent" : "54"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positAdd_fu_406.sparsemux_7_3_30_1_1_U70", "Parent" : "54"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_positMul_fu_430", "Parent" : "0", "Child" : ["60"],
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
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_positMul_fu_430.mul_30ns_30ns_60_1_1_U105", "Parent" : "59"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_30ns_30ns_60_1_1_U116", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "569", "Max" : "569"}
	, {"Name" : "Interval", "Min" : "569", "Max" : "569"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	empty_5 { ap_none {  { empty_5 in_data 0 1 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	add_i321_i { ap_none {  { add_i321_i in_data 0 7 } } }
	conv3_i_i351_i { ap_none {  { conv3_i_i351_i in_data 0 30 } } }
	deltaTheta_sign { ap_none {  { deltaTheta_sign in_data 0 1 } } }
	deltaTheta_isZero { ap_none {  { deltaTheta_isZero in_data 0 1 } } }
	deltaTheta_regime { ap_none {  { deltaTheta_regime in_data 0 6 } } }
	deltaTheta_mantissa { ap_none {  { deltaTheta_mantissa in_data 0 30 } } }
	imagSum_mantissa_write_assign_out { ap_vld {  { imagSum_mantissa_write_assign_out out_data 1 30 }  { imagSum_mantissa_write_assign_out_ap_vld out_vld 1 1 } } }
	imagSum_exponent_write_assign_out { ap_vld {  { imagSum_exponent_write_assign_out out_data 1 1 }  { imagSum_exponent_write_assign_out_ap_vld out_vld 1 1 } } }
	imagSum_regime_write_assign_out { ap_vld {  { imagSum_regime_write_assign_out out_data 1 6 }  { imagSum_regime_write_assign_out_ap_vld out_vld 1 1 } } }
	imagSum_isZero_write_assign_out { ap_vld {  { imagSum_isZero_write_assign_out out_data 1 1 }  { imagSum_isZero_write_assign_out_ap_vld out_vld 1 1 } } }
	imagSum_sign_write_assign_out { ap_vld {  { imagSum_sign_write_assign_out out_data 1 1 }  { imagSum_sign_write_assign_out_ap_vld out_vld 1 1 } } }
	realSum_mantissa_write_assign_out { ap_vld {  { realSum_mantissa_write_assign_out out_data 1 30 }  { realSum_mantissa_write_assign_out_ap_vld out_vld 1 1 } } }
	realSum_exponent_write_assign_out { ap_vld {  { realSum_exponent_write_assign_out out_data 1 1 }  { realSum_exponent_write_assign_out_ap_vld out_vld 1 1 } } }
	realSum_regime_write_assign_out { ap_vld {  { realSum_regime_write_assign_out out_data 1 6 }  { realSum_regime_write_assign_out_ap_vld out_vld 1 1 } } }
	realSum_isZero_write_assign_out { ap_vld {  { realSum_isZero_write_assign_out out_data 1 1 }  { realSum_isZero_write_assign_out_ap_vld out_vld 1 1 } } }
	realSum_sign_write_assign_out { ap_vld {  { realSum_sign_write_assign_out out_data 1 1 }  { realSum_sign_write_assign_out_ap_vld out_vld 1 1 } } }
}
