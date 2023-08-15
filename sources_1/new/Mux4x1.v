`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:46:28 PM
// Design Name: 
// Module Name: Mux4x1
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


module Mux4x1
    (
        output reg [7:0] out,
        input [31:0] in,
        input [1:0] sel
    );
    always @(*) 
    begin
        case (sel)
            0:out=in[31:24];
            1:out=in[23:16];
            2:out=in[15:8];
            3:out=in[7:0]; 
            default: out=8'b0;
        endcase    
    end
endmodule
