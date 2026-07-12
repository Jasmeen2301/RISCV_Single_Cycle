module ALU_Decoder(op5, func3, func7, ALU_op, ALU_control);
    
    input op5, func7;
    input [2:0]func3;
    input [1:0] ALU_op;

    output [2:0] ALU_control;

    assign ALU_control = (ALU_op == 2'b00) ? 3'b000 :
                         (ALU_op == 2'b01) ? 3'b001 :  
                         ((ALU_op == 2'b10) && (func3 == 3'b000) && ({op5, func7} == 11)) ? 3'b001 :
                         ((ALU_op == 2'b10) && (func3 == 3'b000) && ({op5, func7} != 11)) ? 3'b000 :
                         ((ALU_op == 2'b10) && (func3 == 3'b010)) ? 3'b101 :
                         ((ALU_op == 2'b10) && (func3 == 3'b110)) ? 3'b011 :
                         ((ALU_op == 2'b10) && (func3 == 3'b111)) ? 3'b010 : 3'b000;
 
endmodule


