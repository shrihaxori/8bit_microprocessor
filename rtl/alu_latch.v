module alu_latch(
    
) (
    input clock;
    input reset;        //active high
    input [15:0] alu_result;    // result from alu
    input [2:0] flags;      // flags from the alu
    input grab;         //grab the results from the alu into the latch
    input store;        //store the results from the latch into the databus
    output [7:0] out;   
    output [2:0] flags_out;
);
    reg[15:0] value;

    always @(posedge clk ) begin
        if(reset==1'b1) begin
            value <= 16b'0;
        end
        if(grab==1'b1) begin
            value <= result;
            flags_out <= flags;
        end
    end

    always @(*) begin
        if(store==1'b1)begin
            out <= value[7:0];
        end
        else begin
            out <= 8'hzz;
        end
    end
endmodule