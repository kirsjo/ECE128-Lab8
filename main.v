`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2023 02:25:11 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    output [6:0] cathode,
    output [3:0] anode
    );
    
    wire [11:0] count;
    wire done;
    wire [15:0] BCD;
    wire ready;
    wire [3:0] digit;
    wire slowClk;
    
    clk_divider createSlowClk(.clock_in(clk), .clock_out(slowClk));
    example_count counter (.clk(slowClk), .done(done), .bin_cnt(count));
    bin2BCD bin2dec (.clk(slowClk), .en (done), .bin_d_in(count), .bcd_d_out(BCD), .rdy(ready));
    multi_seg_drive(.clk(slowClk), .bcd_in(BCD), .sseg_a_o(anode), .sseg_c_o(cathode));
    
endmodule
