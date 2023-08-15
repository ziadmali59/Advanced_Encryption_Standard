`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 06:05:55 PM
// Design Name: 
// Module Name: Key_Expansion
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


module Key_Expansion
    (
        output reg [127:0] Expanded_Key,
        input [127:0] Key,
        input [3:0] round_index,
        input clk,rst
    );
    wire [31:0] last,third,second,first,G_result;
    Matrix_Form D1
    (.Last_Coloum(last),.Third_Coloum(third),.Second_Coloum(second),.First_Coloum(first),.Key(Key),.clk(clk),.rst(rst));
    G_Func D2
    (.G_result(G_result),.Last_Coloum(last),.round_index(round_index),.clk(clk),.rst(rst));

always @(*) 
begin
    Expanded_Key[127:96]=first^G_result;
    Expanded_Key[95:64]= (Expanded_Key[127:96])^second;
    Expanded_Key[63:32]= (Expanded_Key[95:64])^third;
    Expanded_Key[31:0]= (Expanded_Key[63:32])^last;
end


endmodule
