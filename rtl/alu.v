`include "opcodes.v"

module alu (clock, x, y, reset, operation, out, flags);
    input clock;
    input [7:0] x;      // 8 bit x
    input [7:0] y;      // 8 bit y
    input [3:0] operation;      // 16 possible operations
    output [15:0] out;       // 16 bit output, can be made 8 bit
    output [3:0] flags; //carry, zero and neg flags

    always @(*) begin
        result[15:0] = 16'd0;
    end

    case (operation)
        `ALU_SUM: begin
            out[8:0] = x+y;
            flags[`CARRY_FLAG] = out[8];        //carry
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_SMI: begin
            out[8:0] = x+y;
            flags[`CARRY_FLAG] = out[8];        //carry
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_SB: begin
            out[8:0] = x-y;
            flags[`CARRY_FLAG] = out[8];    //borrow
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_SBI: begin
            out[8:0] = x-y;
            flags[`CARRY_FLAG] = out[8];    //borrow
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_CM: begin
            out = ~x;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_CMI: begin
            out = ~x;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_ANR: begin
            out[7:0] = x&y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_ANI: begin
            out[7:0] = x&y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_ORR: begin
            out[7:0] = x|y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_ORI: begin
            out[7:0] = x|y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_XRR: begin
            out[7:0] = x^y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        `ALU_XRI: begin
            out[7:0] = x^y;
            flags[`CARRY_FLAG] = 1b'0;
            flags[`NEG_FLAG] = out[7];
        end
        default: begin
            out[15:0] = 15'd0;
            flags[`CARRY_FLAG] = 1'b0;
            flags[`NEG_FLAG] = 1'b0;
        end
    endcase

    // calculations have been done, now we have to send it to the databus, whenever required
    // ---> alu latch
endmodule