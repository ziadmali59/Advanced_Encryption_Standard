`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 09:37:13 PM
// Design Name: 
// Module Name: Key_generator
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


module Key_generator
    (
        //output Valid_keys,inc_index,
        output [127:0] Key_Result,
        output [127:0] RoundKey,LastKey,final,
        input [3:0] round_index,
        input [3:0] ROUND,
        input clk,rst
    );
    wire we;
    assign we=~(round_index==10);
    wire re=1'b1;
    wire [127:0] Key_in;
    wire [127:0] out;
   // wire sel;
   // Mux2x1 U1
   // (.c(Key_in),.a(Initial_Key),.b(Key_Result),.sel(sel));
    Key_Expansion U2
    (.Expanded_Key(out),.Key(Key_in),.round_index(round_index),.clk(clk),.rst(rst));
    //Round_FSM U3
    //(.sel(sel),.round_index(round_index),.clk(clk),.rst(rst));
   Key_mem U4
   (.final(final),.result(Key_Result),.data_out(Key_in),.RoundKey(RoundKey),.LastKey(LastKey),.data_in(out),.round_index(round_index),.ROUND(ROUND),.WE(we),.RE(re),.clk(clk));
endmodule
