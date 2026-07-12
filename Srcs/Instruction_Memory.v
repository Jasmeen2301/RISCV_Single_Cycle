module Instruction_Memory(rst, A, rd);

    input [31:0]A;
    input rst;
    output [31:0]rd;

    reg [31:0] mem [1023:0];

    assign rd = (~rst)? {32{1'b0}} : mem[A[31:2]];

    initial begin
        $readmemh("Srcs/memfile.hex", mem);       //or x7 x5 x6    //and x8 x5 x6            
    end



    initial begin
        // mem[0] = 32'hFFC4A303;     // load -> lw x6, -4(x9)
        // mem[1] = 32'h00832383;     // load -> lw x7, 8(x6)

        // mem[0] = 32'h0064A423;     // store -> sw x6 8(x9)
        // mem[1] = 32'h00B62423;     // store -> sw x11 8(x12)

        // mem[0] = 32'h0062E233;     // R -> or x4 x5 x6 
    end

endmodule


