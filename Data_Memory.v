module Data_Memory(clk, rst, A, WE, WD, RD);

    input clk, rst, WE;
    input [31:0]A, WD;
    output [31:0] RD;

    reg [31:0] Mem[1023:0];

    assign RD = (~rst) ? {32{1'b0}} : Mem[A];

    always @(posedge clk)
    begin
        if(WE) Mem[A] <= WD;
    end

    initial begin
        Mem[28] = 32'h00000020;
        Mem[40] = 32'h00000002;
    end

endmodule

