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

// Control state module opcodes
// msb 0 means the instructions are for alu
// msb 1 means the instructions are load/store/move instructions
// for control module
`define LD 5'b10000
`define ST 5'b10001
`define MR 5'b10010
`define MI 5'b10011
`define SUM 5'b00100
`define SMI 5'b00101
`define SB 5'b00110
`define SBI 5'b00111
`define CM 5'b01000
`define CMI 5'b01001
`define ANR 5'b01010
`define ANI 5'b01011
`define ORR 5'b01100
`define ORI 5'b01101
`define XRR 5'b01110
`define XRI 5'b01111

// Register declarations, to be verified if memory mapping is to be done.
`define SOURCE_REGISTER 1'b0
`define SOURCE_IMMEDIATE 1'b1

// Control signals translator opcodes here