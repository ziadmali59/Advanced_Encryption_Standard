`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:46:55 AM
// Design Name: 
// Module Name: AddRcon
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


module AddRcon
    (
        output reg [31:0] xored,
        input [3:0] round_index,
        input [31:0] in_data
    );
    reg [31:0] rcon;
    always @(*)
        begin
            case(round_index)
               0: rcon=32'h01000000;
               1: rcon=32'h02000000;
               2: rcon=32'h04000000;
               3: rcon=32'h08000000;
               4: rcon=32'h10000000;
               5: rcon=32'h20000000;
               6: rcon=32'h40000000;
               7: rcon=32'h80000000;
               8: rcon=32'h1b000000;
               9: rcon=32'h36000000;
               default: rcon=32'h00000000;
            endcase
        end
    always @(*)
        begin
             xored=in_data^rcon;
        end

endmodule
