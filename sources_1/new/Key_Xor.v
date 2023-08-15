`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 01:03:25 PM
// Design Name: 
// Module Name: Key_Xor
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


module Key_Xor
    (   
        output reg [127:0] Xor_out,
        input [127:0] Text,
        input [127:0] Key,
        input clk,rst
    );

    always @(*) 
    begin
        if (~rst) 
        begin
            Xor_out<=0;
        end
        else
        begin
            Xor_out<=Text^Key;
        end
    end
endmodule
