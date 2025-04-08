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
    id 106 \
    name x_sign \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_sign \
    op interface \
    ports { x_sign { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 107 \
    name x_isZero \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_isZero \
    op interface \
    ports { x_isZero { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name x_regime1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_regime1 \
    op interface \
    ports { x_regime1 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name x_exponent2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_exponent2 \
    op interface \
    ports { x_exponent2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name x_mantissa \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_mantissa \
    op interface \
    ports { x_mantissa { I 30 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name y_sign \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_sign \
    op interface \
    ports { y_sign { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name y_isZero \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_isZero \
    op interface \
    ports { y_isZero { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name y_regime1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_regime1 \
    op interface \
    ports { y_regime1 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name y_exponent2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_exponent2 \
    op interface \
    ports { y_exponent2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name y_mantissa3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_mantissa3 \
    op interface \
    ports { y_mantissa3 { I 30 vector } } \
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
    ports { ap_ready { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
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


