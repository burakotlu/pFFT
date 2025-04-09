set SynModuleInfo {
  {SRCNAME generic_fmod<double>_Pipeline_1 MODELNAME generic_fmod_double_Pipeline_1 RTLNAME dIFFT_generic_fmod_double_Pipeline_1
    SUBMODULES {
      {MODELNAME dIFFT_flow_control_loop_pipe_sequential_init RTLNAME dIFFT_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME dIFFT_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME generic_fmod<double> MODELNAME generic_fmod_double_s RTLNAME dIFFT_generic_fmod_double_s
    SUBMODULES {
      {MODELNAME dIFFT_ctlz_54_54_1_1 RTLNAME dIFFT_ctlz_54_54_1_1 BINDTYPE op TYPE ctlz IMPL auto}
    }
  }
  {SRCNAME dIFFT MODELNAME dIFFT RTLNAME dIFFT IS_TOP 1
    SUBMODULES {
      {MODELNAME dIFFT_dadddsub_64ns_64ns_64_5_full_dsp_1 RTLNAME dIFFT_dadddsub_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME dIFFT_dmul_64ns_64ns_64_6_max_dsp_1 RTLNAME dIFFT_dmul_64ns_64ns_64_6_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME dIFFT_ddiv_64ns_64ns_64_22_no_dsp_1 RTLNAME dIFFT_ddiv_64ns_64ns_64_22_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 21 ALLOW_PRAGMA 1}
      {MODELNAME dIFFT_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME dIFFT_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME dIFFT_sitodp_32ns_64_4_no_dsp_1 RTLNAME dIFFT_sitodp_32ns_64_4_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME dIFFT_sparsemux_7_2_64_1_1 RTLNAME dIFFT_sparsemux_7_2_64_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
    }
  }
}
