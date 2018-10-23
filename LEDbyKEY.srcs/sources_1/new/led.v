`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/23 19:42:53
// Design Name: 
// Module Name: led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led(
    input CLK,
    input [3:0] data,
    output [15:0] led
    );
    reg [15:0] led_reg = 0;
    assign led = led_reg;
    always @ (posedge CLK)
        begin
            case (data)
                0:led_reg <= 16'b0000_0000_0000_0001;
                1:led_reg <= 16'b0000_0000_0000_0010;
                2:led_reg <= 16'b0000_0000_0000_0100;
                3:led_reg <= 16'b0000_0000_0000_1000;
                4:led_reg <= 16'b0000_0000_0001_0000;
                5:led_reg <= 16'b0000_0000_0010_0000;
                6:led_reg <= 16'b0000_0000_0100_0000;
                7:led_reg <= 16'b0000_0000_1000_0000;
                8:led_reg <= 16'b0000_0001_0000_0000;
                9:led_reg <= 16'b0000_0010_0000_0000;
                10:led_reg <= 16'b0000_0100_0000_0000;
                11:led_reg <= 16'b0000_1000_0000_0000;
                12:led_reg <= 16'b0001_0000_0000_0000;
                13:led_reg <= 16'b0010_0000_0000_0000;
                14:led_reg <= 16'b0100_0000_0000_0000;
                15:led_reg <= 16'b1000_0000_0000_0000;
            endcase
        end
endmodule
