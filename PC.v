module PC(clk, rst, Pc, Pc_next);

    input clk, rst;
    input [31:0] Pc_next;
    output reg [31:0] Pc;

    always @(posedge clk)
    begin
      if(~rst) Pc = {32{1'b0}};
      else Pc <= Pc_next;
    end

endmodule

