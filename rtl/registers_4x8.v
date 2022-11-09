module 8bit_register (clock, load, enable, in, out) (
    input [7:0] in_databus;         // input from the databus
    output [7:0] out_databus;       //output to the databus
    input clock;
    input load;   // active high, if load is set take input from databus to register
    input enable;   //active high, if enable is set give output from register to databus
    input [1:0] in_regselect;   // to select the register to which data is written to
    input [1:0] out_regselect;  // to select the regiswter ehose value goes into the databus
    input [1:0] alu_regselect;  // register whose value will be taken to alu
    output [7:0] alu_output;     //output directly from the registers to the alu
);
    wire [7:0] value;
    reg [7:0] register_data[3:0];
    integer i;

    always @(posedge clock ) begin
        if(reset==1'b1) begin
            for (i=0; i<4 ; i++ ) begin
                register_data[i] <= 8'd0;   // reset all the register data to 8d'0
            end
        end

        if(load==1'b1) begin        // if load is high take in input from the data bus to the designated register
            register_data[in_regselect] <= in_databus;
        end
    end

    assign value = register_data[out_regselect];    
    assign out_databus = enable ? value: 8h'zz;     // if enable is high take out data from the selected register into the databus
    assign alu_output = register_data[alu_regselect];   
endmodule