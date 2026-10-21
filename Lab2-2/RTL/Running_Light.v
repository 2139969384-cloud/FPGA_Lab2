`timescale 1ns / 1ns

module Running_Light 
(
    input sys_clk,
    input sys_rst_n,
    output reg [3:0] led_out
);

parameter CNT_MAX = 25'd25000000;
reg [24:0] cnt ;

always @(posedge sys_clk, negedge sys_rst_n ) begin
    if(!sys_rst_n)begin
        cnt <= 25'b0;
        led_out <= 4'b1110;
    end
    else if (cnt == CNT_MAX-1)begin
        cnt <= 25'b0;
        led_out <= {led_out,led_out}>>1'b1;
    end
    else begin
        cnt <= cnt + 1'b1;
    end


end
    
endmodule