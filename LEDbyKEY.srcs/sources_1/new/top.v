`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/23 18:49:13
// Design Name: 
// Module Name: top
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


module top(
    input CLK,
    input [3:0] row,
    output [3:0] col,
    output [15:0] led
    );
    wire [3:0] data;
    key my_key(
        .CLK(CLK),
        .col(col),
        .row(row),
        .key_value(data)
    );
    led my_led(
        .CLK(CLK),
        .data(data),
        .led(led)
    );
endmodule
