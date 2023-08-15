`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 12:58:40 PM
// Design Name: 
// Module Name: G_Func
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


module G_Func
    (
        output [31:0] G_result,
        input [31:0] Last_Coloum,
        input [3:0] round_index,
        input clk,rst 
    );
wire [31:0] Rot_sig,Sub_sig;
RotWord M1
(.out(Rot_sig),.word(Last_Coloum));
SubWord M2
(.Subbed_Word(Sub_sig),.word(Rot_sig),.clk(clk),.reset(rst));
AddRcon M3
(.xored(G_result),.round_index(round_index),.in_data(Sub_sig));
//reg [31:0]

endmodule
