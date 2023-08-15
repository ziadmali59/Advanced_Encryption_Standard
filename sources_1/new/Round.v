`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 09:35:36 PM
// Design Name: 
// Module Name: Round
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


module Round
    (
        output [127:0] Round_out,
        //output [31:0] Res_LastCol,Res_ThirdCol,Res_SecCol,Res_FirstCol,
        input [127:0] Round_in,
        input clk,rst
    );
    wire [31:0] inLastCol,inthirdCol,inSecondCol,inFirstCol;
    //wire for conecting subuyte to shiftrow
    wire [31:0] tempLast,tempThird,tempSec,TempFirst;
    //wire for connecting shiftrow mixcoloum
    wire [31:0] last,third,second,first;
    //wire for connecting mixcol to add key
    wire [31:0] mixlast,mixthird,mixsecond,mixfirst;

    Matrix_Form s1
    (inLastCol,inthirdCol,inSecondCol,inFirstCol,Round_in,clk,rst);
    Round_SubBytes s2
    (.LastCol(tempLast),.thirdCol(tempThird),.SecondCol(tempSec),.FirstCol(TempFirst)
    ,.Last_Coloumn(inLastCol),.Third_Coloumn(inthirdCol),.Second_Coloumn(inSecondCol),.First_Coloumn(inFirstCol)
    ,.clk(clk),.rst(rst));
    
   Round_ShiftRows s3
   (last,third,second,first,tempLast,tempThird,tempSec,TempFirst,clk,rst);

    Round_MixColounms s4
    (.state3({first,second,third,last}),.state4({mixfirst,mixsecond,mixthird,mixlast}));

    assign Round_out={mixfirst,mixsecond,mixthird,mixlast};

endmodule
