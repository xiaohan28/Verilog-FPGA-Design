`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 22:26:06
// Design Name: 
// Module Name: egg
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


module egg(
    input clk,
    input [6:0] x,
    input [6:0] y,
    input [12:0] pixel_index,
    output reg [15:0] oled_data = 0  
    );
    
    wire [12:0] offset = y * 96 + x; //can include x
    
    always @ (posedge clk)
    case (pixel_index)
        196 + offset, 291 + offset: oled_data = 16'b1100011000110111;
        197 + offset, 578 + offset, 674 + offset: oled_data = 16'b1101110110110011;
        198 + offset: oled_data = 16'b1100110111110110;
        199 + offset, 681 + offset, 1061 + offset: oled_data = 16'b1001111011111110;
        292 + offset: oled_data = 16'b1111010111110010;
        293 + offset, 487 + offset: oled_data = 16'b1111010101110000;
        294 + offset, 391 + offset, 677 + offset, 772 + offset, 869 + offset: oled_data = 16'b1110110101101111;
        295 + offset: oled_data = 16'b1101110110110100;
        386 + offset: oled_data = 16'b1010011010111100;
        387 + offset: oled_data = 16'b1111010111110011;
        388 + offset, 483 + offset: oled_data = 16'b1111011000110100;
        389 + offset, 486 + offset, 581 + offset, 679 + offset, 867 + offset: oled_data = 16'b1111010100101111;
        390 + offset, 580 + offset, 583 + offset, 675 + offset, 678 + offset, 771 + offset, 774 + offset, 868 + offset: oled_data = 16'b1111010101101111;
        392 + offset: oled_data = 16'b1011111001111010;
        482 + offset: oled_data = 16'b1100111000110111;
        484 + offset: oled_data = 16'b1111010110110001;
        485 + offset, 579 + offset, 582 + offset: oled_data = 16'b1110110101110000;
        488 + offset: oled_data = 16'b1110010100110000;
        584 + offset, 680 + offset, 964 + offset, 965 + offset: oled_data = 16'b1110110011101110;
        676 + offset, 773 + offset, 870 + offset: oled_data = 16'b1111010100110000;
        770 + offset: oled_data = 16'b1101010110110011;
        775 + offset: oled_data = 16'b1110110100101111;
        776 + offset: oled_data = 16'b1110110011101101;
        866 + offset: oled_data = 16'b1011011000111010;
        871 + offset: oled_data = 16'b1111010011101101;
        872 + offset: oled_data = 16'b1100110110110101;
        963 + offset: oled_data = 16'b1011111000111000;
        966 + offset: oled_data = 16'b1110110010101101;
        967 + offset: oled_data = 16'b1100110110110100;
        default: oled_data = 16'b11111_101110_11011; //1001111011111111;
    endcase

//    case (pixel_index)
//        196 + offset: oled_data = 16'b0111001010000111;
//        197 + offset: oled_data = 16'b1011001111001011;
//        198 + offset: oled_data = 16'b1000101100001001;
//        199 + offset: oled_data = 16'b0001000001000001;
//        291 + offset: oled_data = 16'b0111101011001000;
//        292 + offset: oled_data = 16'b1111010111110010;
//        293 + offset, 294 + offset, 389 + offset, 391 + offset, 485 + offset, 583 + offset, 675 + offset, 676 + offset, 772 + offset, 774 + offset: oled_data = 16'b1111010101101111;
//        868 + offset: oled_data = 16'b1111010101101111;
//        295 + offset, 578 + offset: oled_data = 16'b1010101111001011;
//        386 + offset: oled_data = 16'b0010100011000011;
//        387 + offset: oled_data = 16'b1110110111110010;
//        388 + offset: oled_data = 16'b1111010111110100;
//        390 + offset, 487 + offset, 771 + offset, 775 + offset, 867 + offset: oled_data = 16'b1110110100101111;
//        392 + offset: oled_data = 16'b0101000111000101;
//        482 + offset: oled_data = 16'b1000001011001000;
//        483 + offset: oled_data = 16'b1111011000110100;
//        484 + offset: oled_data = 16'b1111010110110001;
//        486 + offset: oled_data = 16'b1111010101110000;
//        488 + offset: oled_data = 16'b1101010001001101;
//        579 + offset, 581 + offset, 678 + offset, 773 + offset, 870 + offset: oled_data = 16'b1111010100101111;
//        580 + offset, 677 + offset: oled_data = 16'b1110110101110000;
//        582 + offset, 679 + offset, 869 + offset: oled_data = 16'b1110110101101111;
//        584 + offset, 871 + offset: oled_data = 16'b1110110011101110;
//        674 + offset: oled_data = 16'b1011110000001100;
//        680 + offset, 965 + offset: oled_data = 16'b1111010011101110;
//        681 + offset, 1061 + offset: oled_data = 16'b0000100001000000;
//        770 + offset: oled_data = 16'b1010101110001011;
//        776 + offset: oled_data = 16'b1110010010101100;
//        866 + offset: oled_data = 16'b0100100110000100;
//        872 + offset: oled_data = 16'b1000001010000111;
//        963 + offset: oled_data = 16'b0110001000000101;
//        964 + offset: oled_data = 16'b1110010010101101;
//        966 + offset: oled_data = 16'b1110110010101100;
//        967 + offset: oled_data = 16'b1001001011001000;
//        default: oled_data = 16'b0000000000000000;
//    endcase
    
endmodule
