// module Sign_Extend(imm, imm_extend);
    
//     input [31:0]imm;
//     output[31:0]imm_extend;

//     assign imm_extend = imm[31]? {{20{1'b1}}, {imm[31:20]}}:
//                                  {{20{1'b0}}, {imm[31:20]}};

// endmodule


module Sign_Extend(imm, imm_extend, imm_src);
    
    input [31:0]imm;
    input imm_src;
    output[31:0]imm_extend;

    assign imm_extend = imm_src == 1'b1 ? {{20{imm[31]}}, imm[31:25], imm[11:7]}:            //store
                                 {{20{imm[31]}}, {imm[31:20]}};                           //load

endmodule
