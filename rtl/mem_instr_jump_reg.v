module 16bit_register (clock, reset, high, low, in, out) (
    input clock;
    input reset; // active high
    input high;
    input low;
    input [7:0] in;
    output reg [15:0] out;
);
    always @(posedge clock ) begin
        if(reset) begin
            out = 0;
        end
        else if(high) begin
            out[15:8] = in;
        end
        else if(low) begin
            out[7:0] = in;
        end
    end
endmodule