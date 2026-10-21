`timescale 1ns/1ns

module Top_tb ();
    reg sys_clk = 0;
    reg sys_rst_n = 1;
    wire led0;
    wire led1;
    wire led2;
    wire led3;

    Top #(.CNT_MAX(3)) dut( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), 
	.led0(led0), .led1(led1), .led2(led2), .led3(led3));

    always #10 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("Top_tb.vcd");
        $dumpvars(0, Top_tb);
    end

    initial begin
        #10 sys_rst_n = 0;
        #10 sys_rst_n = 1;
        #250 sys_rst_n = 0;
        #10 sys_rst_n = 1;
    end

    initial begin
        #300 $finish;
    end
endmodule