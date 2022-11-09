module pc(clock, inc, load, reset, reg_in, reg_out);
    input clock, inc, load, reset;  // inputs clock, increment, load and reset(active high)
    input [7:0] reg_in;     // 8 bit input to the program counter
    input [7:0] reg_out;    //8 bit output from the program counter

    always @(posedge clock) begin       //clocked priority logic
        if(reset) begin
            reg_out <= 0;
        end
        else if(load) begin
            reg_out <= reg_in;
        end
        else if(inc) begin
            reg_out <= reg_in+1;
        end
    end
endmodule
