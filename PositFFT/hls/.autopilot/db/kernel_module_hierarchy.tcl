set ModuleHierarchy {[{
"Name" : "pFFT","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "VITIS_LOOP_1366_1","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_pAccumulateFC_fu_116","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_double2posit_fu_120","ID" : "3","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_log_generic_double_s_fu_282","ID" : "4","Type" : "pipeline"},
				{"Name" : "grp_pow_generic_double_s_fu_305","ID" : "5","Type" : "pipeline"},]},
			{"Name" : "grp_pAccumulateFC_Pipeline_VITIS_LOOP_1345_1_fu_155","ID" : "6","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1345_1","ID" : "7","Type" : "pipeline",
				"SubInsts" : [
				{"Name" : "grp_positCos_fu_382","ID" : "8","Type" : "pipeline",
						"SubInsts" : [
						{"Name" : "grp_pReduceAngle_fu_169","ID" : "9","Type" : "pipeline",
							"SubInsts" : [
							{"Name" : "grp_positAdd_fu_255","ID" : "10","Type" : "pipeline"},
							{"Name" : "grp_positAdd_fu_275","ID" : "11","Type" : "pipeline"},
							{"Name" : "grp_positAdd_fu_296","ID" : "12","Type" : "pipeline"},]},
						{"Name" : "grp_positAdd_fu_177","ID" : "13","Type" : "pipeline"},
						{"Name" : "grp_positAdd_fu_198","ID" : "14","Type" : "pipeline"},
						{"Name" : "grp_positAdd_fu_214","ID" : "15","Type" : "pipeline"},]},
				{"Name" : "grp_pNAngle_fu_394","ID" : "16","Type" : "pipeline",
						"SubInsts" : [
						{"Name" : "grp_positAdd_fu_257","ID" : "17","Type" : "pipeline"},
						{"Name" : "grp_positAdd_fu_274","ID" : "18","Type" : "pipeline"},
						{"Name" : "grp_positAdd_fu_295","ID" : "19","Type" : "pipeline"},]},
				{"Name" : "grp_positAdd_fu_406","ID" : "20","Type" : "pipeline"},
				{"Name" : "grp_positMul_fu_430","ID" : "21","Type" : "pipeline"},]},]},]},]},]
}]}