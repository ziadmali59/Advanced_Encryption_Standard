`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:46:55 AM
// Design Name: 
// Module Name: SubWord
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


module SubWord
    (
       output reg [31:0]  Subbed_Word,
       input [31:0] word,
       input clk,reset
    );
wire valid;
wire [1:0] sel;
wire [7:0] addr,dout;
assign valid=1'b1;
wire [31:0]tempsub;
//Mux 4x1 to decide wich part of input   (x1xx/x2xx/x3xx/x4xx)
//sel decided from the fsm 
//sbox decid each byte replacement
//addr alocator decid to which part of subbed_word (x1xx/x2xx/x3xx/x4xx)
//Problem here that there is a delay after getting dout of sbox so output is shifted by a byte (simple fix to shift again the output?? is it valid)


Mux4x1 P1 (.in(word),.sel(sel),.out(addr));
SBox P2 (.clk(clk),.reset(reset),.valid_in(valid),.addr(addr),.dout(dout));
addr_alocate P3 (.clk(clk),.rst(reset),.subbed_word(tempsub),.sel(sel),.in(dout));
FSM_Sbox P4 (.clk(clk),.rst(reset),.sel(sel));

always @(*) 
begin
    Subbed_Word[31:24]<=tempsub[23:16];
    Subbed_Word[23:16]<=tempsub[15:8];
    Subbed_Word[15:8]<=tempsub[7:0];
    Subbed_Word[7:0]<=tempsub[31:24];    
end
endmodule
