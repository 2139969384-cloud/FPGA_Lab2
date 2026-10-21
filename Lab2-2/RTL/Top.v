`timescale 1ns / 1ns

module Top 
(
    input  sys_clk,
    input sys_rst_n,
    output led0, 
    output led1,
    output led2,
    output led3
);

Running_Light u0(.sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .led_out({led1,led2,led3,led0}));


endmodule