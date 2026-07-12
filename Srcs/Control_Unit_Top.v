module Control_Unit_Top(op, branch, result_src, mem_write, ALU_src, imm_src, reg_write, func3, func7, ALU_control);

input [6:0]op, func7;
input[2:0]func3;
output branch, result_src, mem_write, ALU_src, reg_write;
output [1:0] imm_src;
output [2:0]ALU_control; 

wire [1:0] ALU_op;

Main_Decoder MD(
    .op(op),
    .branch(branch), 
    .result_src(result_src), 
    .mem_write(mem_write), 
    .ALU_src(ALU_src), 
    .imm_src(imm_src), 
    .reg_write(reg_write), 
    .ALU_op(ALU_op)
    );

ALU_Decoder AD(
    .op5(op[5]), 
    .func3(func3), 
    .func7(func7[5]), 
    .ALU_op(ALU_op), 
    .ALU_control(ALU_control)
    );


endmodule
