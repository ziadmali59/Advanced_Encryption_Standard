`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 12:44:08 PM
// Design Name: 
// Module Name: GetKey_FSM
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


module GetKey_FSM
(
  input clk,
  input rst,
  input En_gen,
  output reg [3:0] index
);

reg [3:0] state_next,state_reg;

localparam s0 =0 ;
localparam s1 =1 ;
localparam s2 =2 ;
localparam s3 =3 ;
localparam s4 =4 ;
localparam s5 =5 ;
localparam s6 =6 ;
localparam s7 =7 ;
localparam s8 =8 ;
localparam s9 =9 ;
localparam s10 = 10 ;
localparam s11= 11;

reg [3:0] counter=8;
always @(posedge clk, negedge rst) 
begin
    if (~rst) 
    begin
        state_reg<=s0;    
    end
    else if (En_gen)
    begin
        if (counter !=0) 
        begin
            state_reg<=state_reg;
            counter<=counter-1;    
        end
        else
        begin
            state_reg<=state_next;
            counter=8;
        end
    end    
end
always @(*) 
begin
    case (state_reg)
        s0:state_next=s1;
        s1:state_next=s2;
        s2:state_next=s3;
        s3:state_next=s4;
        s4:state_next=s5;
        s5:state_next=s6;
        s6:state_next=s7;
        s7:state_next=s8;
        s8:state_next=s9;
        s9:state_next=s10;
        s10:state_next=s11;
        default: state_next=state_reg;  
    endcase    
end

always @(*) 
begin
    if (state_reg==s11) 
    begin
        index=10;    
    end
    else
        index=state_reg;    
end

assign Valid_Keys=(index==10);
endmodule
