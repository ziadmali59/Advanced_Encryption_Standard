`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 06:41:10 PM
// Design Name: 
// Module Name: AES_TB
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


module AES_TB();
reg clk,rst;
wire [127:0] cipher_Text;

AES_Top DUT (.clk(clk),.rst(rst),.cipher_Text(cipher_Text));

initial begin
    #700 $stop;
end

initial begin
    clk=1'b1;
    forever begin
        #4 clk=~clk;
    end
end

initial begin
    rst=1'b0;
    #8
    rst=1'b1;

    
end
endmodule
