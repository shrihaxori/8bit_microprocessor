// ALU opcodes
`define ALU_SUM 4'b0001
`define ALU_SMI 4'b0010
`define ALU_SB 4'b0011
`define ALU_SBI 4'b0100
`define ALU_CM 4'b0101
`define ALU_CMI 4'b0110
`define ALU_ANR 4'b0111
`define ALU_ANI 4'b1000
`define ALU_ORR 4'b1001
`define ALU_ORI 4'b1010
`define ALU_XRR 4'b1011
`define ALU_XRI 4'b1100
// `define ALU_CM 4'b1101
// `define ALU_CMI 4'b1110
// `define ALU_ANR 4'b1111

// ALU flag codes
`define CARRY_FLAG 0
`define ZERO_FLAG 1
`define NEG_FLAG 2