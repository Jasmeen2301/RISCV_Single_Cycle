module Register_File(clk, rst, A1, A2, A3, WE3, WD3, RD1, RD2);

    input clk, rst, WE3;

    input [4:0] A1, A2, A3;
    input [31:0] WD3;
    output [31:0] RD1, RD2;

    reg [31:0] registers [31:0];

    assign RD1 = (~rst) ? {32{1'b0}} : registers[A1];
    assign RD2 = (~rst) ? {32{1'b0}} : registers[A2];

    always @(posedge clk)
    begin
      if(WE3) registers[A3] <= WD3;
    end


    initial begin
      // registers[9] = 32'h00000020;    // load

      // registers[6] = 32'h00000040;   // store
      // registers[11] = 32'h00000028;   // store
      // registers[12] = 32'h00000030;   // store

      // registers[5] = 32'h00000006;        // R
      // registers[6] = 32'h0000000A;        // R

      // Using hexfile for OR operation
      registers[5] = 32'h00000005;        
      registers[6] = 32'h00000004; 

    end

endmodule



