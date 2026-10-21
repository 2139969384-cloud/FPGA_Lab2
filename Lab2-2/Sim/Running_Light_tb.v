`timescale 1ns/1ns

module Running_Light_tb ();
    reg sys_clk = 0;
    reg sys_rst_n = 1;
    wire [3:0] led_out;

    Running_Light #( .CNT_MAX(25'd3)) dut ( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .led_out(led_out));

    always #10 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("Running_Light_tb.vcd");
        $dumpvars(0, Running_Light_tb);
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