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
    
endmodule