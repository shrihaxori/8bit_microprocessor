module datapath (
    input clock;
    input reset;        //active high
    input pc_inc; input pc_load;      //program counter inputs from databus
    input reg_load; input reg_enable;
    input [1:0] reg_in_regselect;
    input [1:0] reg_out_regselect;
    input [1:0] reg_alu_regselect;
    input [3:0] alu_operation;
    input latch_grab; input latch_store;
    input mar_high; input mar_low;
    input ir_high; input ir_low;
    input jr_high; input jr_low;

    output wire [15:0] pc_out;
    output wire [15:0] mar_out;
    output wire [15:0] ir_out;
    output wire [2:0] latch_flags;

    inout [7:0] databus;
);
    wire [7:0] reg_alu;
    wire [15:0] pc_jump_pc;
    wire [15:0] alu_latch;
    wire [2:0] flgs;

    pc pc_ins(clock, pc_inc, pc_load, reset, pc_jump_pc, pc_out);

    mem_instr_jump mij_ins(clock, reset, jr_high, jr_low, databus, pc_jump_pc);

    registers_4x8 reg4x8_ins(clock, reset, reg_load, reg_enable, reg_in_regselect, reg_out_regselect, 
    reg_alu_regselect, databus, reg_alu);

    alu alu_ins(clock, reset, reg_alu, databus, alu_operation, alu_latch, flgs);
    alu_latch alu_latch_ins(clock, reset, alu_latch, flgs, latch_grab, latch_store, databus, flags);

    mem_instr_jump mij_ins2(clock, reset, mar_high, mar_low, databus, mar_out);

    mem_instr_jump mij_ins3(clock, reset, ir_high, ir_low, databus, ir_out);
endmodule