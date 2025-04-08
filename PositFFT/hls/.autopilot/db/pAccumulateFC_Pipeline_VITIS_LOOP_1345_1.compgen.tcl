# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name empty_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_5 \
    op interface \
    ports { empty_5 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name add_i321_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_i321_i \
    op interface \
    ports { add_i321_i { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name conv3_i_i351_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv3_i_i351_i \
    op interface \
    ports { conv3_i_i351_i { I 30 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name deltaTheta_sign \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_deltaTheta_sign \
    op interface \
    ports { deltaTheta_sign { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name deltaTheta_isZero \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_deltaTheta_isZero \
    op interface \
    ports { deltaTheta_isZero { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name deltaTheta_regime \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_deltaTheta_regime \
    op interface \
    ports { deltaTheta_regime { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name deltaTheta_mantissa \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_deltaTheta_mantissa \
    op interface \
    ports { deltaTheta_mantissa { I 30 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name imagSum_mantissa_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_imagSum_mantissa_write_assign_out \
    op interface \
    ports { imagSum_mantissa_write_assign_out { O 30 vector } imagSum_mantissa_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name imagSum_exponent_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_imagSum_exponent_write_assign_out \
    op interface \
    ports { imagSum_exponent_write_assign_out { O 1 vector } imagSum_exponent_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name imagSum_regime_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_imagSum_regime_write_assign_out \
    op interface \
    ports { imagSum_regime_write_assign_out { O 6 vector } imagSum_regime_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name imagSum_isZero_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_imagSum_isZero_write_assign_out \
    op interface \
    ports { imagSum_isZero_write_assign_out { O 1 vector } imagSum_isZero_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name imagSum_sign_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_imagSum_sign_write_assign_out \
    op interface \
    ports { imagSum_sign_write_assign_out { O 1 vector } imagSum_sign_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name realSum_mantissa_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_realSum_mantissa_write_assign_out \
    op interface \
    ports { realSum_mantissa_write_assign_out { O 30 vector } realSum_mantissa_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name realSum_exponent_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_realSum_exponent_write_assign_out \
    op interface \
    ports { realSum_exponent_write_assign_out { O 1 vector } realSum_exponent_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name realSum_regime_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_realSum_regime_write_assign_out \
    op interface \
    ports { realSum_regime_write_assign_out { O 6 vector } realSum_regime_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name realSum_isZero_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_realSum_isZero_write_assign_out \
    op interface \
    ports { realSum_isZero_write_assign_out { O 1 vector } realSum_isZero_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name realSum_sign_write_assign_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_realSum_sign_write_assign_out \
    op interface \
    ports { realSum_sign_write_assign_out { O 1 vector } realSum_sign_write_assign_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName pFFT_flow_control_loop_pipe_sequential_init_U
set CompName pFFT_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix pFFT_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


