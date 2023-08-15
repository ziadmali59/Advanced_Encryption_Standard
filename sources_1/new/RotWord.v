`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:46:55 AM
// Design Name: 
// Module Name: RotWord
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


module RotWord
    (
        output reg [31:0] out,
        input [31:0] word
    );
    always @(*) 
    begin
        out[7:0]<=word[31:24];
        out[31:8]<=word[23:0];
    end
endmodule
