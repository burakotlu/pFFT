-- ==============================================================
-- Generated by Vitis HLS v2024.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dFFT_generic_fmod_double_Pipeline_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    zext_ln254 : IN STD_LOGIC_VECTOR (9 downto 0);
    zext_ln300 : IN STD_LOGIC_VECTOR (52 downto 0);
    r_sh_1_out : OUT STD_LOGIC_VECTOR (53 downto 0);
    r_sh_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of dFFT_generic_fmod_double_Pipeline_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_832 : STD_LOGIC_VECTOR (11 downto 0) := "100000110010";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv54_191EB851EB851E : STD_LOGIC_VECTOR (53 downto 0) := "011001000111101011100001010001111010111000010100011110";
    constant ap_const_lv54_26E147AE147AE1 : STD_LOGIC_VECTOR (53 downto 0) := "100110111000010100011110101110000101000111101011100001";
    constant ap_const_lv54_1 : STD_LOGIC_VECTOR (53 downto 0) := "000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv13_1FFF : STD_LOGIC_VECTOR (12 downto 0) := "1111111111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln308_fu_99_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r_sh_fu_42 : STD_LOGIC_VECTOR (53 downto 0) := "000000000000000000000000000000000000000000000000000000";
    signal r_sh_3_fu_155_p3 : STD_LOGIC_VECTOR (53 downto 0);
    signal zext_ln300_cast_fu_73_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal i_fu_46 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    signal i_2_fu_163_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln254_cast_fu_77_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal loop_fu_50 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    signal loop_2_fu_105_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln309_fu_117_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln310_fu_123_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal r_sh_1_fu_129_p3 : STD_LOGIC_VECTOR (53 downto 0);
    signal icmp_ln311_fu_137_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_sh_2_fu_143_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal i_1_fu_149_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component dFFT_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component dFFT_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready_sig,
        ap_done => ap_done_sig,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    i_fu_46_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_46 <= zext_ln254_cast_fu_77_p1;
                elsif (((icmp_ln308_fu_99_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_46 <= i_2_fu_163_p3;
                end if;
            end if; 
        end if;
    end process;

    loop_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    loop_fu_50 <= ap_const_lv12_0;
                elsif (((icmp_ln308_fu_99_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    loop_fu_50 <= loop_2_fu_105_p2;
                end if;
            end if; 
        end if;
    end process;

    r_sh_fu_42_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    r_sh_fu_42 <= zext_ln300_cast_fu_73_p1;
                elsif (((icmp_ln308_fu_99_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    r_sh_fu_42 <= r_sh_3_fu_155_p3;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln310_fu_123_p2 <= std_logic_vector(unsigned(r_sh_fu_42) + unsigned(ap_const_lv54_26E147AE147AE1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln308_fu_99_p2)
    begin
        if (((icmp_ln308_fu_99_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;
    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    i_1_fu_149_p2 <= std_logic_vector(unsigned(i_fu_46) + unsigned(ap_const_lv13_1FFF));
    i_2_fu_163_p3 <= 
        i_1_fu_149_p2 when (icmp_ln311_fu_137_p2(0) = '1') else 
        i_fu_46;
    icmp_ln308_fu_99_p2 <= "1" when (loop_fu_50 = ap_const_lv12_832) else "0";
    icmp_ln309_fu_117_p2 <= "1" when (unsigned(r_sh_fu_42) > unsigned(ap_const_lv54_191EB851EB851E)) else "0";
    icmp_ln311_fu_137_p2 <= "1" when (signed(i_fu_46) > signed(ap_const_lv13_0)) else "0";
    loop_2_fu_105_p2 <= std_logic_vector(unsigned(loop_fu_50) + unsigned(ap_const_lv12_1));
    r_sh_1_fu_129_p3 <= 
        add_ln310_fu_123_p2 when (icmp_ln309_fu_117_p2(0) = '1') else 
        r_sh_fu_42;
    r_sh_1_out <= r_sh_fu_42;

    r_sh_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln308_fu_99_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln308_fu_99_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r_sh_1_out_ap_vld <= ap_const_logic_1;
        else 
            r_sh_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    r_sh_2_fu_143_p2 <= std_logic_vector(shift_left(unsigned(r_sh_1_fu_129_p3),to_integer(unsigned('0' & ap_const_lv54_1(31-1 downto 0)))));
    r_sh_3_fu_155_p3 <= 
        r_sh_2_fu_143_p2 when (icmp_ln311_fu_137_p2(0) = '1') else 
        r_sh_1_fu_129_p3;
    zext_ln254_cast_fu_77_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln254),13));
    zext_ln300_cast_fu_73_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln300),54));
end behav;
