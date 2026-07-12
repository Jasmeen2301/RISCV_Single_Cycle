module ALU(a, b, aluControl, result, carry, overflow, negative, zero);

    input [31:0]a, b;
    input [2:0]aluControl;
    output[31:0]result;
    output carry, overflow, negative, zero;

    wire[31:0] sum;
    wire cout;

    assign {cout, sum} = (aluControl[0] == 0) ? a+b : a + (~b+1);
    
    assign result = aluControl == 3'b000 ? sum :
                    aluControl == 3'b001 ? sum :
                    aluControl == 3'b010 ? a&b :
                    aluControl == 3'b011 ? a|b :
                    aluControl == 3'b101 ? {{31{1'b0}}, sum[31]} : {32{1'b0}};
                    
    assign carry = (~aluControl[1]) & (aluControl[0]==0) ?  carry : ~carry;                //borrow = ~ carry
    
    assign negative = result[31];
    
    assign zero = &(~result);
    
    assign overflow = (~aluControl[1]) & (a[31]^sum[31]) & (~(a[31] ^ b[31] ^ aluControl[0])); 
                    
endmodule


