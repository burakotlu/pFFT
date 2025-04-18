// ==============================================================
// Generated by Vitis HLS v2024.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module dFFT_generic_fmod_double_Pipeline_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zext_ln254,
        zext_ln300,
        r_sh_1_out,
        r_sh_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [9:0] zext_ln254;
input  [52:0] zext_ln300;
output  [53:0] r_sh_1_out;
output   r_sh_1_out_ap_vld;

reg ap_idle;
reg r_sh_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln308_fu_99_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [53:0] r_sh_fu_42;
wire   [53:0] r_sh_3_fu_155_p3;
wire   [53:0] zext_ln300_cast_fu_73_p1;
wire    ap_block_pp0_stage0_11001;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [12:0] i_fu_46;
wire   [12:0] i_2_fu_163_p3;
wire   [12:0] zext_ln254_cast_fu_77_p1;
reg   [11:0] loop_fu_50;
wire   [11:0] loop_2_fu_105_p2;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln309_fu_117_p2;
wire   [53:0] add_ln310_fu_123_p2;
wire   [53:0] r_sh_1_fu_129_p3;
wire   [0:0] icmp_ln311_fu_137_p2;
wire   [53:0] r_sh_2_fu_143_p2;
wire   [12:0] i_1_fu_149_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 r_sh_fu_42 = 54'd0;
#0 i_fu_46 = 13'd0;
#0 loop_fu_50 = 12'd0;
#0 ap_done_reg = 1'b0;
end

dFFT_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_46 <= zext_ln254_cast_fu_77_p1;
        end else if (((icmp_ln308_fu_99_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_46 <= i_2_fu_163_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            loop_fu_50 <= 12'd0;
        end else if (((icmp_ln308_fu_99_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            loop_fu_50 <= loop_2_fu_105_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            r_sh_fu_42 <= zext_ln300_cast_fu_73_p1;
        end else if (((icmp_ln308_fu_99_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            r_sh_fu_42 <= r_sh_3_fu_155_p3;
        end
    end
end

always @ (*) begin
    if (((icmp_ln308_fu_99_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln308_fu_99_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r_sh_1_out_ap_vld = 1'b1;
    end else begin
        r_sh_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln310_fu_123_p2 = ($signed(r_sh_fu_42) + $signed(54'd10943747094510305));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_ready = ap_ready_sig;

assign i_1_fu_149_p2 = ($signed(i_fu_46) + $signed(13'd8191));

assign i_2_fu_163_p3 = ((icmp_ln311_fu_137_p2[0:0] == 1'b1) ? i_1_fu_149_p2 : i_fu_46);

assign icmp_ln308_fu_99_p2 = ((loop_fu_50 == 12'd2098) ? 1'b1 : 1'b0);

assign icmp_ln309_fu_117_p2 = ((r_sh_fu_42 > 54'd7070651414971678) ? 1'b1 : 1'b0);

assign icmp_ln311_fu_137_p2 = (($signed(i_fu_46) > $signed(13'd0)) ? 1'b1 : 1'b0);

assign loop_2_fu_105_p2 = (loop_fu_50 + 12'd1);

assign r_sh_1_fu_129_p3 = ((icmp_ln309_fu_117_p2[0:0] == 1'b1) ? add_ln310_fu_123_p2 : r_sh_fu_42);

assign r_sh_1_out = r_sh_fu_42;

assign r_sh_2_fu_143_p2 = r_sh_1_fu_129_p3 << 54'd1;

assign r_sh_3_fu_155_p3 = ((icmp_ln311_fu_137_p2[0:0] == 1'b1) ? r_sh_2_fu_143_p2 : r_sh_1_fu_129_p3);

assign zext_ln254_cast_fu_77_p1 = zext_ln254;

assign zext_ln300_cast_fu_73_p1 = zext_ln300;

endmodule //dFFT_generic_fmod_double_Pipeline_1
