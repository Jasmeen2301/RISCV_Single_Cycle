module Instruction_Memory(rst, A, rd);

    input [31:0]A;
    input rst;
    output [31:0]rd;

    reg [31:0] mem [1023:0];

    assign rd = (~rst)? {32{1'b0}} : mem[A[31:2]];

    initial begin
        $readmemh("memfile.hex", mem);
    end



    // initial begin
    //     // mem[0] = 32'hFFC4A303;   //load
    //     // mem[1] = 32'h00832383;   //load

    //     // mem[0] = 32'h0064A423;     // store
    //     // mem[1] = 32'h00B62423;     // store

    //     mem[0] = 32'h0062E233;         // R
    // end

endmodule


