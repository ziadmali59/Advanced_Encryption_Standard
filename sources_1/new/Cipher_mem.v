`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 02:06:26 PM
// Design Name: 
// Module Name: Cipher_mem
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


module Cipher_mem
    (
        output reg [127:0] lastout,
        output reg [127:0] data_out,
        input [127:0] data_in,
        input [3:0] round_index,
        input we,re,
        input clk
    );
    reg [127:0] Cram [0:10];

    initial 
    begin
        $readmemh("Cipher.mem",Cram);
        //read from Prog.txt    
    end

    always @(posedge clk ) 
    begin
        if (we) 
        begin
        case (round_index)
            0:Cram[1]<=data_in;
            1:Cram[2]<=data_in;
            2:Cram[3]<=data_in;
            3:Cram[4]<=data_in;
            4:Cram[5]<=data_in;
            5:Cram[6]<=data_in;
            6:Cram[7]<=data_in;
            7:Cram[8]<=data_in;
            8:Cram[9]<=data_in;
            9:Cram[10]<=data_in;
            default: Cram[round_index]<=Cram[round_index];
        endcase
        end
    end
    always @(*) 
    begin
        if (re) 
        begin
            data_out<=Cram[round_index];    
        end    
    end
    always @(*) 
    begin
        lastout<=Cram[9];    
    end


endmodule
