`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/23 18:49:53
// Design Name: 
// Module Name: key
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


module key(
    input CLK,
    input [3:0] row,
    output [3:0] col,
    output [3:0] key_value
    );
    reg [3:0] col_1 = 1'b0;
    reg [3:0] key_value_1;
    reg [6:0] cnt = 1'b0;
    reg [2:0] state = 1'b0;
    reg key_flag = 1'b0;
    reg CLK_500K = 1'b0;
    reg [3:0] col_reg;
    reg [3:0] row_reg;
    always @ (posedge CLK)
        begin
            if (cnt == 7'd100)
                begin
                    CLK_500K <= ~CLK_500K;
                    cnt <= 1'b0;
                end
            else
                cnt <= cnt + 1'b1;
        end
    assign col = col_1;
    always @ (posedge CLK_500K)
        begin
            case (state)
                0:begin
                    col_1 <= 4'b0000;
                    key_flag <= 1'b0;
                    if (row != 4'b1111)
                        begin
                            state <= 1;
                            col_1 <= 4'b1110;
                        end
                    else
                        state <= 0;
                end
                1:begin
                    if (row != 4'b1111)
                        state <= 5;
                    else
                        begin
                            state <= 2;
                            col_1 <= 4'b1101;
                        end
                end
                2:begin
                    if (row != 4'b1111)
                        state <= 5;
                    else
                        begin
                            state <= 3;
                            col_1 <= 4'b1011;
                        end
                end
                3:begin
                    if (row != 4'b1111)
                        state <= 5;
                    else
                        begin
                            state <= 4;
                            col_1 <= 4'b0111;
                        end
                end
                4:begin
                    if (row != 4'b1111)
                        state <= 5;
                    else
                        state <= 0;
                end
                5:begin
                    if (row != 4'b1111)
                        begin
                            col_reg <= col_1;
                            row_reg <= row;
                            state <= 5;
                            key_flag <= 1'b1;
                        end
                    else
                        state <= 0;
                end
            endcase                
        end
    assign key_value = key_value_1;
    always @ (CLK_500K or col_reg or row_reg or key_flag)
        begin
            if (key_flag == 1'b1)
                begin
                    case ({col_reg,row_reg})
                        8'b1110_1110: key_value_1 <= 12;
                        8'b1110_1101: key_value_1 <= 8;
                        8'b1110_1011: key_value_1 <= 4;
                        8'b1110_0111: key_value_1 <= 0;
                        8'b1101_1110: key_value_1 <= 13;
                        8'b1101_1101: key_value_1 <= 9;
                        8'b1101_1011: key_value_1 <= 5;
                        8'b1101_0111: key_value_1 <= 1;
                        8'b1011_1110: key_value_1 <= 14;
                        8'b1011_1101: key_value_1 <= 10;
                        8'b1011_1011: key_value_1 <= 6;
                        8'b1011_0111: key_value_1 <= 2;
                        8'b0111_1110: key_value_1 <= 15;
                        8'b0111_1101: key_value_1 <= 11;
                        8'b0111_1011: key_value_1 <= 7;
                        8'b0111_0111: key_value_1 <= 3;
                    endcase
                end
        end
endmodule
