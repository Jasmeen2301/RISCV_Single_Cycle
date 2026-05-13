`include "Single_Cycle_Top.v"

module Single_Cycle_Top_Tb;

    reg clk, rst;

    Single_Cycle_Top dut(
                    .clk(clk), 
                    .rst(rst)
    );

    initial begin
        $dumpfile("Single_Cycle.vcd");
        $dumpvars(0);
    end

    initial begin
        clk = 1'b1;
    end

    always begin
        clk = ~clk;
        #50;
    end
    
    initial begin
        rst = 1'b0;
        #100;

        rst = 1'b1;
        #300;
        $finish;
    end

    
endmodule



