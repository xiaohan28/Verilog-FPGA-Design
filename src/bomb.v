`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 22:13:26
// Design Name: 
// Module Name: bomb
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


module bomb(
    input clk,
    input [6:0] x,
    input [6:0] y,
    input [12:0] pixel_index,
    output reg [15:0] oled_data = 0  
    );
    
    wire [12:0] offset = y * 96 + x; //can include x
    
    always @ (posedge clk)
    case (pixel_index)
        103 + offset: oled_data = 16'b1010011001111100;
        104 + offset: oled_data = 16'b1011110101110100;
        105 + offset: oled_data = 16'b1010011001111010;
        195 + offset, 386 + offset, 1250 + offset: oled_data = 16'b1001111011111111;
        196 + offset, 298 + offset: oled_data = 16'b1001111010111110;
        199 + offset: oled_data = 16'b1011010111110110;
        200 + offset: oled_data = 16'b1110010011100111;
        201 + offset, 297 + offset: oled_data = 16'b1100110010101110;
        202 + offset, 294 + offset: oled_data = 16'b1001111010111101;
        291 + offset: oled_data = 16'b1001110100110011;
        292 + offset: oled_data = 16'b1001010000001100;
        293 + offset: oled_data = 16'b1001110011110010;
        295 + offset, 583 + offset: oled_data = 16'b1011010110110110;
        296 + offset: oled_data = 16'b1101010001000101;
        387 + offset: oled_data = 16'b1010110011110000;
        388 + offset: oled_data = 16'b1011111010111011;
        389 + offset: oled_data = 16'b1000110110111000;
        390 + offset: oled_data = 16'b1000001110001011;
        391 + offset: oled_data = 16'b1001110001001111;
        392 + offset: oled_data = 16'b1000101110001100;
        393 + offset: oled_data = 16'b1010011001111011;
        482 + offset: oled_data = 16'b1001010101110110;
        483 + offset: oled_data = 16'b1011110111110111;
        484 + offset: oled_data = 16'b1000110001010001;
        485 + offset: oled_data = 16'b0111110000010001;
        486 + offset: oled_data = 16'b1001010011110100;
        487 + offset: oled_data = 16'b1000010011110100;
        488 + offset: oled_data = 16'b1001011010111110;
        578 + offset: oled_data = 16'b0111110011110100;
        579 + offset: oled_data = 16'b0110001100001100;
        580 + offset, 581 + offset, 771 + offset: oled_data = 16'b0101101011001011;
        582 + offset: oled_data = 16'b1000110001010000;
        584 + offset: oled_data = 16'b1001111000111010;
        673 + offset, 1065 + offset: oled_data = 16'b1000111000111011;
        674 + offset: oled_data = 16'b0100101000001001;
        675 + offset: oled_data = 16'b0110101101001101;
        676 + offset: oled_data = 16'b0111001110001110;
        677 + offset: oled_data = 16'b0101001001001001;
        678 + offset: oled_data = 16'b0100101001001010;
        679 + offset: oled_data = 16'b0111101111001111;
        680 + offset: oled_data = 16'b1000110010110010;
        681 + offset: oled_data = 16'b1001011001111101;
        769 + offset, 777 + offset: oled_data = 16'b0110110001010011;
        770 + offset: oled_data = 16'b0001100100000100;
        772 + offset: oled_data = 16'b0110101101001100;
        773 + offset: oled_data = 16'b0011000111000111;
        774 + offset, 869 + offset, 965 + offset: oled_data = 16'b0010100101000101;
        775 + offset: oled_data = 16'b0010100101000100;
        776 + offset, 868 + offset, 1253 + offset: oled_data = 16'b0011000110000110;
        865 + offset: oled_data = 16'b0101101111010001;
        866 + offset, 963 + offset: oled_data = 16'b0001000010000010;
        867 + offset, 870 + offset, 966 + offset, 1061 + offset: oled_data = 16'b0010000100000100;
        871 + offset: oled_data = 16'b0000100001000010;
        872 + offset, 962 + offset, 967 + offset, 968 + offset, 1059 + offset, 1063 + offset, 1156 + offset, 1157 + offset, 1158 + offset: oled_data = 16'b0000100001000001;
        873 + offset: oled_data = 16'b0101001110001111;
        961 + offset: oled_data = 16'b0110010001010011;
        964 + offset: oled_data = 16'b0010100100000101;
        969 + offset: oled_data = 16'b0110001111010001;
        1057 + offset: oled_data = 16'b1000010111111010;
        1058 + offset, 1060 + offset, 1062 + offset, 1064 + offset, 1155 + offset, 1159 + offset: oled_data = 16'b0001100011000011;
        1154 + offset: oled_data = 16'b0110110000010001;
        1160 + offset: oled_data = 16'b0110010000010001;
        1251 + offset: oled_data = 16'b0111010011110101;
        1252 + offset: oled_data = 16'b0100101010001010;
        1254 + offset: oled_data = 16'b0100001010001010;
        1255 + offset: oled_data = 16'b0111110011110110;
        default: oled_data = 16'b11111_101110_11011; //1001111011111111;
    endcase

//    case (pixel_index)
//        103 + offset: oled_data = 16'b0010000010000001;
//        104 + offset: oled_data = 16'b0110100110000011;
//        105 + offset: oled_data = 16'b0010100010000001;
//        196 + offset, 294 + offset: oled_data = 16'b0001000001000001;
//        199 + offset: oled_data = 16'b0101000101000010;
//        200 + offset: oled_data = 16'b1110010011100111;
//        201 + offset: oled_data = 16'b1001101001000100;
//        202 + offset: oled_data = 16'b0001000001000000;
//        291 + offset: oled_data = 16'b0101000111000100;
//        292 + offset: oled_data = 16'b0110101001000101;
//        293 + offset: oled_data = 16'b0101101000000100;
//        295 + offset: oled_data = 16'b0101100101000011;
//        296 + offset: oled_data = 16'b1101010010100101;
//        297 + offset: oled_data = 16'b1001001001000100;
//        298 + offset: oled_data = 16'b0000100000000000;
//        386 + offset, 871 + offset, 872 + offset, 967 + offset, 968 + offset, 1059 + offset, 1063 + offset, 1156 + offset, 1157 + offset, 1158 + offset: oled_data = 16'b0000100001000001;
//        387 + offset: oled_data = 16'b1001001110001011;
//        388 + offset: oled_data = 16'b1001110010110010;
//        389 + offset: oled_data = 16'b0001100010000001;
//        390 + offset: oled_data = 16'b0110001000000100;
//        391 + offset: oled_data = 16'b0110000111000011;
//        392 + offset: oled_data = 16'b0110000110000011;
//        393 + offset: oled_data = 16'b0010000001000001;
//        482 + offset, 579 + offset: oled_data = 16'b0110001100001100;
//        483 + offset: oled_data = 16'b1011110111110111;
//        484 + offset: oled_data = 16'b1000110001010001;
//        485 + offset, 486 + offset: oled_data = 16'b0110001011001011;
//        487 + offset: oled_data = 16'b0010100100000011;
//        578 + offset: oled_data = 16'b0100001000000111;
//        580 + offset, 581 + offset, 771 + offset: oled_data = 16'b0101101011001011;
//        582 + offset: oled_data = 16'b1000010001010000;
//        583 + offset: oled_data = 16'b1011010101110101;
//        584 + offset: oled_data = 16'b0100000111000111;
//        673 + offset, 865 + offset, 1057 + offset, 1065 + offset: oled_data = 16'b0001000010000010;
//        674 + offset: oled_data = 16'b0100001000001000;
//        675 + offset: oled_data = 16'b0110001100001101;
//        676 + offset: oled_data = 16'b0111001110001110;
//        677 + offset: oled_data = 16'b0101001001001001;
//        678 + offset: oled_data = 16'b0100101001001010;
//        679 + offset: oled_data = 16'b0111101111001111;
//        680 + offset: oled_data = 16'b1000010000010000;
//        681 + offset, 866 + offset: oled_data = 16'b0000100010000010;
//        769 + offset: oled_data = 16'b0001000010000011;
//        770 + offset: oled_data = 16'b0010000100000011;
//        772 + offset: oled_data = 16'b0110101101001100;
//        773 + offset: oled_data = 16'b0011000111000111;
//        774 + offset, 965 + offset, 1154 + offset, 1160 + offset, 1254 + offset: oled_data = 16'b0010100101000101;
//        775 + offset: oled_data = 16'b0010100100000101;
//        776 + offset, 868 + offset, 1252 + offset, 1253 + offset: oled_data = 16'b0011000110000110;
//        777 + offset, 867 + offset, 870 + offset, 966 + offset, 1061 + offset, 1255 + offset: oled_data = 16'b0010000100000100;
//        869 + offset: oled_data = 16'b0011000101000101;
//        873 + offset: oled_data = 16'b0001100011000010;
//        961 + offset, 969 + offset, 1058 + offset, 1060 + offset, 1062 + offset, 1155 + offset, 1159 + offset: oled_data = 16'b0001100011000011;
//        962 + offset: oled_data = 16'b0000100001000000;
//        963 + offset: oled_data = 16'b0001000001000010;
//        964 + offset: oled_data = 16'b0010100101000100;
//        1064 + offset: oled_data = 16'b0001100010000010;
//        1251 + offset: oled_data = 16'b0010100100000100;
//        default: oled_data = 16'b0000000000000000;
//    endcase
    
endmodule
