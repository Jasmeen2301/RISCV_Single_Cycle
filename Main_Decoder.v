module Main_Decoder(op, branch, result_src, mem_write, ALU_src, imm_src, reg_write, ALU_op);
    input [6:0]op;
    output branch, result_src, mem_write, ALU_src, reg_write;
    output [1:0] imm_src;
    output [1:0] ALU_op;

    assign branch = (op == 7'b1100011)? 1'b1 : 1'b0;
    
    assign result_src = (op == 7'b0000011) ? 1'b1 : 1'b0;
    
    assign mem_write = (op == 7'b0100011) ? 1'b1 : 1'b0;

    assign ALU_src = ((op == 7'b0000011) || (op == 7'b0100011)) ? 1'b1 : 1'b0;

    assign imm_src = (op == 7'b0100011) ? 2'b01 : 
                     (op == 7'b1100011) ? 2'b10 : 2'b00;

    assign reg_write = ((op == 7'b0000011) || (op == 7'b0110011)) ? 1'b1 : 1'b0;

    assign ALU_op = (op == 7'b0110011) ? 2'b10 :
                    (op == 7'b1100011) ? 2'b01 : 2'b00;
                    
endmodule

