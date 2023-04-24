`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 11:57:45 AM
// Design Name: 
// Module Name: bitmem
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


module bitmem(
    input S,
    input E,
    input HW_switch_0,
    input HW_switch_1,
    output Q
    );
   
    
    assign S = HW_switch_0;
    assign E = HW_switch_1;
 
    wire r, s;
    
    assign r = (E & ~S);
    assign s = E & S;
 
    wire nQ;
    
    assign Q = ~(r | nQ);
    assign nQ = ~(s | Q);
endmodule


module MeinBit(
    input HW_switch_0, // soll S sein
    input HW_switch_1, // Adresse A0
    input HW_switch_2, // Adresse A1
    input HW_switch_3, // Adresse A2
    
 
    output HW_led_8,
    output HW_led_1,
    output HW_led_2,
    output HW_led_3,
    output HW_led_4,
    output HW_led_5,
    output HW_led_6,
    output HW_led_7
    );
    
wire enable0, enable1, enable2, enable3, enable4, enable5, enable6, enable7;
    
assign enable0 = ~HW_switch_1 & ~HW_switch_2 & ~HW_switch_3;//000
assign enable1 = ~HW_switch_1 & ~HW_switch_2 & HW_switch_3;//001
assign enable2 = ~HW_switch_1 & HW_switch_2 & ~HW_switch_3;//010
assign enable3 = ~HW_switch_1 & HW_switch_2 & HW_switch_3;//011
assign enable4 = HW_switch_1 & ~HW_switch_2 & ~HW_switch_3;//100
assign enable5 = HW_switch_1 & ~HW_switch_2 & HW_switch_3;//101
assign enable6 = HW_switch_1 & HW_switch_2 & ~HW_switch_3;//110
assign enable7 = HW_switch_1 & HW_switch_2 & HW_switch_3;//111
    
bitmem(HW_switch_0, enable0, HW_led_1);
bitmem(HW_switch_0, enable1, HW_led_2);
bitmem(HW_switch_0, enable2, HW_led_3);
bitmem(HW_switch_0, enable3, HW_led_4);
bitmem(HW_switch_0, enable4, HW_led_5);
bitmem(HW_switch_0, enable5, HW_led_6);
bitmem(HW_switch_0, enable6, HW_led_7);
bitmem(HW_switch_0, enable7, HW_led_8);
    
    
endmodule
