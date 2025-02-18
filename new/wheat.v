`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 22:27:30
// Design Name: 
// Module Name: wheat
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


module wheat(
    input clk,
    input [6:0] x,
    input [6:0] y,
    input [12:0] pixel_index,
    output reg [15:0] oled_data = 0  
    );
    
    wire [12:0] offset = y * 96 + x; //can include x
    
    always @ (posedge clk)
    case (pixel_index)
        100 + offset, 487 + offset: oled_data = 16'b1010011011111101;
        101 + offset, 482 + offset, 679 + offset, 1253 + offset, 1350 + offset, 1352 + offset, 1353 + offset: oled_data = 16'b1001111011111110;
        196 + offset: oled_data = 16'b1101011001110010;
        197 + offset, 1160 + offset: oled_data = 16'b1011111010110111;
        292 + offset: oled_data = 16'b1110011001101101;
        293 + offset: oled_data = 16'b1100011010110111;
        294 + offset, 774 + offset: oled_data = 16'b1010111011111010;
        386 + offset: oled_data = 16'b1100011010110110;
        387 + offset: oled_data = 16'b1101111010110001;
        388 + offset, 390 + offset: oled_data = 16'b1100111001110011;
        389 + offset: oled_data = 16'b1101011010110010;
        483 + offset, 677 + offset, 1257 + offset: oled_data = 16'b1101011001110000;
        484 + offset: oled_data = 16'b1110011000101011;
        485 + offset, 871 + offset: oled_data = 16'b1110111000101011;
        486 + offset: oled_data = 16'b1011011010111000;
        578 + offset: oled_data = 16'b1001111011111101;
        579 + offset, 1065 + offset: oled_data = 16'b1101011001110011;
        580 + offset: oled_data = 16'b1011011011111001;
        581 + offset: oled_data = 16'b1010111001111001;
        582 + offset, 869 + offset, 968 + offset: oled_data = 16'b1110011001101110;
        583 + offset: oled_data = 16'b1011011010111001;
        675 + offset, 1158 + offset: oled_data = 16'b1100011010110100;
        676 + offset: oled_data = 16'b1111011000101000;
        678 + offset: oled_data = 16'b1110111000101010;
        771 + offset: oled_data = 16'b1010011011111110;
        772 + offset, 1351 + offset: oled_data = 16'b1010111010111010;
        773 + offset: oled_data = 16'b1010111001111000;
        775 + offset: oled_data = 16'b1110111001101101;
        867 + offset, 1060 + offset: oled_data = 16'b1010011011111100;
        868 + offset, 1061 + offset, 1161 + offset, 1255 + offset: oled_data = 16'b1111011001101011;
        870 + offset: oled_data = 16'b1100111001110100;
        872 + offset: oled_data = 16'b1011011011111010;
        964 + offset: oled_data = 16'b1001111010111110;
        965 + offset: oled_data = 16'b1100111001110010;
        966 + offset: oled_data = 16'b1100011001110001;
        967 + offset: oled_data = 16'b1100111010110011;
        1062 + offset: oled_data = 16'b1110011001101111;
        1063 + offset, 1064 + offset: oled_data = 16'b1101011001110001;
        1157 + offset: oled_data = 16'b1010011010111100;
        1159 + offset: oled_data = 16'b1011111000110011;
        1254 + offset: oled_data = 16'b1110111001101100;
        1256 + offset: oled_data = 16'b1100111001110001;
        default: oled_data = 16'b11111_101110_11011; //1001111011111111;
    endcase

//    case (pixel_index)
//        100 + offset, 1157 + offset: oled_data = 16'b0001100010000001;
//        101 + offset, 1253 + offset, 1350 + offset, 1352 + offset, 1353 + offset: oled_data = 16'b0000100001000000;
//        196 + offset: oled_data = 16'b1001001111000110;
//        197 + offset: oled_data = 16'b0110001010000100;
//        292 + offset: oled_data = 16'b1100010011100111;
//        293 + offset: oled_data = 16'b0111001011000101;
//        294 + offset: oled_data = 16'b0011100110000011;
//        386 + offset: oled_data = 16'b0110101011000100;
//        387 + offset: oled_data = 16'b1011010010101000;
//        388 + offset, 390 + offset, 965 + offset: oled_data = 16'b1000001101000100;
//        389 + offset: oled_data = 16'b1010110001001000;
//        482 + offset: oled_data = 16'b0000100000000000;
//        483 + offset, 677 + offset, 1064 + offset: oled_data = 16'b1001101111000101;
//        484 + offset: oled_data = 16'b1100110011100110;
//        485 + offset, 678 + offset: oled_data = 16'b1101110101100111;
//        486 + offset: oled_data = 16'b0100100110000010;
//        487 + offset, 578 + offset, 771 + offset: oled_data = 16'b0001000010000001;
//        579 + offset: oled_data = 16'b1001101111000110;
//        580 + offset: oled_data = 16'b0101001000000100;
//        581 + offset, 1351 + offset: oled_data = 16'b0011100101000010;
//        582 + offset: oled_data = 16'b1100110101101001;
//        583 + offset: oled_data = 16'b0100100111000010;
//        675 + offset, 1158 + offset, 1159 + offset: oled_data = 16'b0111001011000011;
//        676 + offset: oled_data = 16'b1111011000101000;
//        679 + offset, 964 + offset: oled_data = 16'b0001000001000000;
//        772 + offset: oled_data = 16'b0100000110000011;
//        773 + offset, 774 + offset: oled_data = 16'b0011100110000010;
//        775 + offset: oled_data = 16'b1100110101101000;
//        867 + offset, 1060 + offset: oled_data = 16'b0010000011000001;
//        868 + offset: oled_data = 16'b1110010110101000;
//        869 + offset: oled_data = 16'b1100010011101000;
//        870 + offset: oled_data = 16'b1000001101000110;
//        871 + offset: oled_data = 16'b1101110101101000;
//        872 + offset: oled_data = 16'b0100000110000010;
//        966 + offset: oled_data = 16'b1000101101000100;
//        967 + offset: oled_data = 16'b1000101110000101;
//        968 + offset: oled_data = 16'b1100110100101000;
//        1061 + offset, 1255 + offset: oled_data = 16'b1110110111101001;
//        1062 + offset: oled_data = 16'b1011110011101000;
//        1063 + offset: oled_data = 16'b1010010000000111;
//        1065 + offset: oled_data = 16'b1001001110000110;
//        1160 + offset: oled_data = 16'b0101101001000100;
//        1161 + offset: oled_data = 16'b1110010111101001;
//        1254 + offset: oled_data = 16'b1110010110101001;
//        1256 + offset: oled_data = 16'b1001001110000101;
//        1257 + offset: oled_data = 16'b1010110000000110;
//        default: oled_data = 16'b0000000000000000;
//    endcase

endmodule
