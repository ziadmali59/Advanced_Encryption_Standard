`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 09:16:23 PM
// Design Name: 
// Module Name: AES_Top
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


module AES_Top
    (   
        
        output [127:0] cipher_Text,
        input clk,rst
        
    );
    wire [127:0] x;
    wire [127:0] y;
    wire [127:0] z;
    wire [127:0] final;

    wire [127:0] ttest;
    wire [127:0] t;
    wire valid_check;
    //wire to generate valid keys for all rounds
    wire [3:0] i,j;
    //wire to know the round we are in
    wire [127:0] tempRkey,tempLkey,tempRound_out,tempRound_in;
    Key_generator l1
    (.final(final),.RoundKey(tempRkey),.LastKey(tempLkey),.round_index(i),.ROUND(j),.clk(clk),.rst(rst));
    Index_FSM l2
    (.clk(clk),.rst(rst),.index(i),.Valid_Keys(valid_check));
    GetKey_FSM l3 
    (.clk(clk),.rst(rst),.En_gen(1),.index(j));
    // en_gen->valid_check
    Key_Xor l4
    (.Xor_out(tempRound_in),.Text(t),.Key(tempRkey),.clk(clk),.rst(rst));
    //rst ->valid_check
   Round l5
    (.Round_out(tempRound_out),.Round_in(tempRound_in),.clk(clk),.rst(rst));
    Cipher_mem l6
    (.lastout(ttest),.data_out(t),.data_in(tempRound_out),.round_index(j),.we(rst),.re(1),.clk(clk));
    Key_Xor l7
        (.Xor_out(x),.Text(ttest),.Key(tempLkey),.clk(clk),.rst(rst));
    Round_SubBytes l8
    (.FirstCol(y[127:96]),.SecondCol(y[95:64]),.thirdCol(y[63:32]),.LastCol(y[31:0])
    ,.First_Coloumn(x[127:96]),.Second_Coloumn(x[95:64]),.Third_Coloumn(x[63:32]),.Last_Coloumn(x[31:0])
    ,.clk(clk),.rst(rst));
    Round_ShiftRows l9
    (z[31:0],z[63:32],z[95:64],z[127:96],y[31:0],y[63:32],y[95:64],y[127:96],clk,rst);
    Key_Xor l10
            (.Xor_out(cipher_Text),.Text(z),.Key(final),.clk(clk),.rst(rst));
    
endmodule

