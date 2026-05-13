`include "PC.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"

module Single_Cycle_Top(clk, rst);

input clk, rst;

wire [31:0] Pc_Top, rd_instr, RD1_Top, imm_Top, alu_result_top, read_data_top, PC_plus4, RD2_Top, src_b_top, final_result_top;
wire [2:0] ALU_control_Top;
wire [1:0] imm_src_top;
wire reg_write_top, mem_write_top, alu_src_top, result_src_top;

PC PC(
    .clk(clk), 
    .rst(rst), 
    .Pc(Pc_Top), 
    .Pc_next(PC_plus4)
);

PC_Adder PC_Adder(
            .a(Pc_Top),
            .b(32'd4),
            .c(PC_plus4)
);

Instruction_Memory Instruction_Memory(
                    .rst(rst), 
                    .A(Pc_Top), 
                    .rd(rd_instr)
);

Register_File Register_File(
                .clk(clk), 
                .rst(rst), 
                .A1(rd_instr[19:15]), 
                .A2(rd_instr[24:20]), 
                .A3(rd_instr[11:7]), 
                .WE3(reg_write_top), 
                // .WD3(alu_result_top), 
                .WD3(final_result_top), 
                .RD1(RD1_Top), 
                .RD2(RD2_Top)
);

Sign_Extend Sign_Extend(
            .imm(rd_instr), 
            .imm_extend(imm_Top),
            .imm_src(imm_src_top[0])
);

Mux Mux_reg_to_alu(
                .a(RD2_Top),
                .b(imm_Top),
                .s(alu_src_top),
                .c(src_b_top)
);

ALU ALU(
    .a(RD1_Top), 
    // .b(imm_Top), 
    .b(src_b_top),
    .aluControl(ALU_control_Top), 
    .result(alu_result_top), 
    .carry(), 
    .overflow(), 
    .negative(), 
    .zero()
);

Control_Unit_Top Control_Unit_Top(
                    .op(rd_instr[6:0]), 
                    .branch(), 
                    .result_src(result_src_top), 
                    .mem_write(mem_write_top), 
                    .ALU_src(alu_src_top), 
                    .imm_src(imm_src_top), 
                    .reg_write(reg_write_top), 
                    .func3(rd_instr[14:12]), 
                    .func7(), 
                    .ALU_control(ALU_control_Top)
);

Data_Memory Data_Memory(
            .clk(clk), 
            .rst(rst), 
            .A(alu_result_top), 
            .WE(mem_write_top), 
            .WD(RD2_Top), 
            .RD(read_data_top)
);

Mux Mux_mem_to_reg(
                .a(alu_result_top),
                .b(read_data_top),
                .s(result_src_top),
                .c(final_result_top)
);


endmodule

