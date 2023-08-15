`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:46:28 PM
// Design Name: 
// Module Name: addr_alocate
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


module addr_alocate
    (
        output reg [31:0] subbed_word,
        input [1:0] sel,
        input [7:0] in,
        input clk,rst
    );

    always @(posedge clk) 
    begin
        if (~rst)
        begin
            subbed_word=0;    
        end
        else
        begin
            case (sel)
            0:subbed_word[31:24]=in;
            1:subbed_word[23:16]=in;
            2:subbed_word[15:8]=in;
            3:subbed_word[7:0]=in; 
            default: subbed_word=0;
        endcase   
        end 
    end
endmodule
