`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2023 01:51:22 PM
// Design Name: 
// Module Name: FSM_Sbox
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


module FSM_Sbox
    (
        input clk,rst,
        output [1:0] sel
    );
    reg [1:0] state_next,state_reg;
    localparam s0 =0 ;
    localparam s1 =1 ;
    localparam s2 =2 ;
    localparam s3 =3 ;

    always @(posedge clk ,negedge rst) 
    begin
        if (~rst) 
        begin
            state_reg<=s0;    
        end
        else
            state_reg<=state_next;    
    end

     always @(*) 
    begin 
        case (state_reg)
            s0:state_next=s1;
            s1:state_next=s2;
            s2:state_next=s3;
            s3: state_next=s0;
            default: state_next=state_reg;
        endcase
    end

    assign sel=state_reg;
endmodule
