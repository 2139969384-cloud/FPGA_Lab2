`timescale 1ns/1ns

module Counter (
input sys_clk,
input sys_rst_n,
output reg led_out
);
    reg [24:0] cnt;
    always @(posedge sys_clk, negedge sys_rst_n ) begin

        if(!sys_rst_n)begin
            cnt <= 25'b0;
            led_out <= 1'b0;
        end
        else if (cnt == 24999999)begin
            cnt <= 25'b0;
            led_out <= (led_out ^ 1'b1);
        end
        else begin
            cnt <= (cnt+1'b1);
        end
        
    end

endmodule