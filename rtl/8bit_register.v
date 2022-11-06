module 8bit_register (clock, load, enable, in, out) (
    input [7:0] in;
    output [7:0] out;
    input clock;
    input load, enable;
);
    wire [7:0] value;
    reg [7:0] data;

    always @(posedge clock ) begin
        if(reset==1'b1) begin
            data = 8'd0;
        end

        if(load==1'b1) begin
            data <= in;
        end
    end

    assign out = data   // incomplete
endmodule