`timescale 1ns/1ns

module Counter_tb ();
    reg sys_clk = 0;
    reg sys_rst_n = 1;
    wire led_out;

    Counter dut(.sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .led_out(led_out));

    initial begin
        $dumpfile("Counter_tb.vcd");
        $dumpvars(0,Counter_tb);
    end

   always #10 sys_clk = ~sys_clk;

   initial begin
        #10 sys_rst_n = 0;
        #10 sys_rst_n = 1;
        #500000000 sys_rst_n = 0;
        #10 sys_rst_n = 1;
   end

   initial begin
    #500000050 $finish;
   end

    
endmodule