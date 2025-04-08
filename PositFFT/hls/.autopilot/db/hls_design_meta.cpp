#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("signal_r", 40, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("result_real_address0", 6, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("result_real_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("result_real_we0", 1, hls_out, 1, "ap_memory", "mem_we", 1),
	Port_Property("result_real_d0", 40, hls_out, 1, "ap_memory", "mem_din", 1),
	Port_Property("result_imag_address0", 6, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("result_imag_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("result_imag_we0", 1, hls_out, 2, "ap_memory", "mem_we", 1),
	Port_Property("result_imag_d0", 40, hls_out, 2, "ap_memory", "mem_din", 1),
};
const char* HLS_Design_Meta::dut_name = "pFFT";
