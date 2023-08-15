`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 11:57:53 AM
// Design Name: 
// Module Name: Matrix_Form
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


module Matrix_Form
    (   
        output reg  [31:0]  Last_Coloum ,
        output reg  [31:0]  Third_Coloum ,
        output reg  [31:0]  Second_Coloum ,
        output reg  [31:0]  First_Coloum ,

        input [127:0] Key,
        input clk,rst
    );
    always @(*) 
    begin
        if ((~rst))
            begin
               {Last_Coloum,Third_Coloum,Second_Coloum,First_Coloum} <=128'b0;
            end
        else
            begin
                First_Coloum=Key[127:96];
                Second_Coloum=Key[95:64];
                Third_Coloum=Key[63:32];
                Last_Coloum=Key[31:0];
            end
    end
endmodule
