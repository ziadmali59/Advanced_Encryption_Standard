`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2023 11:23:02 PM
// Design Name: 
// Module Name: Key_mem
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


module Key_mem
    (   
        //output reg inc_index,Valid_keys,
        output reg [127:0] result,
        output reg [127:0] data_out,
        output reg [127:0] RoundKey,
        output reg [127:0] final,
        output reg [127:0] LastKey,
        input [127:0] data_in,
        input [3:0] round_index,
        input [3:0] ROUND,
        input WE,RE,
        input clk
    );

    reg [127:0] Kram [0:10];

   initial 
    begin
        $readmemh("key_RE.mem",Kram);
        //read from Prog.txt    
    end

    always @(posedge clk ) 
    begin
        if (WE) 
            begin
                case (round_index)
                    0:Kram[1]<=data_in;
                    1:Kram[2]<=data_in;
                    2:Kram[3]<=data_in;
                    3:Kram[4]<=data_in;
                    4:Kram[5]<=data_in;
                    5:Kram[6]<=data_in;
                    6:Kram[7]<=data_in;
                    7:Kram[8]<=data_in;
                    8:Kram[9]<=data_in;
                    9:Kram[10]<=data_in;
                    default: Kram[round_index]<=Kram[round_index];
                endcase
            end
    end
    always @(*) 
    begin
        RoundKey<=Kram[ROUND];
        LastKey<=Kram[9];
        final<=Kram[10]; 
    end

    always @(*) 
    begin
        if (RE) 
        begin
            case (round_index)
                0:
                    begin
                    result=Kram[0];
                    data_out=Kram[0];
                    end
                1:
                    begin
                    result=Kram[1];
                    data_out=Kram[1];
                    end
                2:
                    begin
                    result=Kram[2];
                    data_out=Kram[2];
                    end
                3:
                    begin
                    result=Kram[3];
                    data_out=Kram[3];
                    end
                4:
                    begin
                    result=Kram[4];
                    data_out=Kram[4];
                    end
                5:
                    begin
                    result=Kram[5];
                    data_out=Kram[5];
                    end
                6:
                    begin
                    result=Kram[6];
                    data_out=Kram[6]; 
                    end
                7:
                    begin
                    result=Kram[7];
                    data_out=Kram[7];
                    end
                8: 
                    begin
                    result=Kram[8];
                    data_out=Kram[8];
                    end
                9:
                    begin
                        result=Kram[9];
                        data_out=Kram[9];
                    end
                10:
                    begin
                        result=Kram[10];
                        data_out=Kram[10];
                    end
                default: 
                    begin
                        result=Kram[10];
                        data_out=Kram[10];
                    end
            endcase
        end    
    end
    /*always @(posedge clk) 
    begin
        if (Kram[round_index+1]==='bx) 
        begin
            inc_index=1'b0;
        end
        else
        begin
            inc_index=1'b1;
        end 
    end*/
    /*
    always @(*) 
    begin
        if (Kram[10]==='bx)
        begin
            Valid_keys=1'b0;
        end
        else
        begin
            Valid_keys=1'b1;
        end
    end*/


endmodule
