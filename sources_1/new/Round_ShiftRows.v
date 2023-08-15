`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 09:54:43 PM
// Design Name: 
// Module Name: Round_ShiftRows
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


module Round_ShiftRows
    (
        output reg [31:0] last_Cshifted,Third_Cshifted,Second_Cshifted,First_Cshifted,
        input [31:0] LastCol,thirdCol,SecondCol,FirstCol,
        input clk,rst
    );

    always @(*) 
    begin
        if (~rst) 
        begin
    {last_Cshifted,Third_Cshifted,Second_Cshifted,First_Cshifted}<='b0;
        end
        else
        begin
        //row1
   First_Cshifted[31:24]<=FirstCol[31:24];
   Second_Cshifted[31:24]<=SecondCol[31:24];
   Third_Cshifted[31:24]<=thirdCol[31:24];
   last_Cshifted[31:24]<=LastCol[31:24];
        //row2
   First_Cshifted[23:16]<=SecondCol[23:16];
   Second_Cshifted[23:16]<=thirdCol[23:16];
   Third_Cshifted[23:16]<=LastCol[23:16];
   last_Cshifted[23:16]<=FirstCol[23:16];
        //row3
   First_Cshifted[15:8]<=thirdCol[15:8];
   Second_Cshifted[15:8]<=LastCol[15:8];
   Third_Cshifted[15:8]<=FirstCol[15:8];
   last_Cshifted[15:8]<=SecondCol[15:8];
        //row4
   First_Cshifted[7:0]<=LastCol[7:0];
   Second_Cshifted[7:0]<=FirstCol[7:0];
   Third_Cshifted[7:0]<=SecondCol[7:0];
   last_Cshifted[7:0]<=thirdCol[7:0];   
        end
    end
endmodule
