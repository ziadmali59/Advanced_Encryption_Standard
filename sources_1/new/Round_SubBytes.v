`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 09:36:17 PM
// Design Name: 
// Module Name: Round_SubBytes
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


module Round_SubBytes
    (
        output [31:0] LastCol,thirdCol,SecondCol,FirstCol,
        input [31:0] Last_Coloumn,Third_Coloumn,Second_Coloumn,First_Coloumn,
        input clk,rst
    );
    SubWord z4
    (.Subbed_Word(LastCol),.word(Last_Coloumn),.clk(clk),.reset(rst));
    SubWord z3
    (.Subbed_Word(thirdCol),.word(Third_Coloumn),.clk(clk),.reset(rst));
    SubWord z2
    (.Subbed_Word(SecondCol),.word(Second_Coloumn),.clk(clk),.reset(rst));
    SubWord z1
    (.Subbed_Word(FirstCol),.word(First_Coloumn),.clk(clk),.reset(rst));
//could be optimized by using state machine 
/* 1)create 4x1 mux (out of 31 byte) 
    2)FSM 
        input clk,rst
        output [1:0] sek
        input coloumn,out_coloum if (coloumn[last byte]!=outcoloumn[last byte])
        then  switch sel 0->1->2->3
        need to think more here          */
endmodule
