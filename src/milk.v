`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 22:24:56
// Design Name: 
// Module Name: milk
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


module milk(
    input clk,
    input [6:0] x,
    input [6:0] y,
    input [12:0] pixel_index,
    output reg [15:0] oled_data = 0  
    );
    
    wire [12:0] offset = y * 96 + x; //can include x
    
    always @ (posedge clk)
    case (pixel_index)
        100 + offset, 194 + offset, 200 + offset: oled_data = 16'b1001111010111110;
        101 + offset: oled_data = 16'b1001011010111110;
        102 + offset: oled_data = 16'b1001111010111111;
        195 + offset: oled_data = 16'b1010010100111010;
        196 + offset, 198 + offset: oled_data = 16'b1011110111111011;
        197 + offset: oled_data = 16'b1011111000111011;
        199 + offset: oled_data = 16'b1010010100111001;
        290 + offset: oled_data = 16'b1001111000111101;
        291 + offset, 292 + offset, 294 + offset, 295 + offset, 391 + offset, 484 + offset, 486 + offset: oled_data = 16'b1001110010111000;
        293 + offset: oled_data = 16'b1010010010111000;
        296 + offset: oled_data = 16'b1001011000111101;
        387 + offset: oled_data = 16'b1001010001010111;
        388 + offset: oled_data = 16'b1001010010111000;
        389 + offset: oled_data = 16'b1001110001010111;
        390 + offset: oled_data = 16'b1001010001011000;
        392 + offset, 1538 + offset: oled_data = 16'b1001111011111110;
        482 + offset: oled_data = 16'b1001010110111011;
        483 + offset: oled_data = 16'b1010110011111001;
        485 + offset: oled_data = 16'b1010110100111001;
        487 + offset: oled_data = 16'b1010010011111000;
        488 + offset: oled_data = 16'b1001110101111011;
        578 + offset: oled_data = 16'b1100011011111101;
        579 + offset, 581 + offset, 583 + offset, 675 + offset, 676 + offset, 677 + offset, 678 + offset, 679 + offset, 1251 + offset, 1252 + offset: oled_data = 16'b1111111111111111;
        1253 + offset, 1254 + offset, 1255 + offset, 1347 + offset, 1348 + offset, 1349 + offset, 1350 + offset, 1351 + offset, 1443 + offset, 1444 + offset: oled_data = 16'b1111111111111111;
        1445 + offset, 1446 + offset, 1447 + offset: oled_data = 16'b1111111111111111;
        580 + offset: oled_data = 16'b1110111101111110;
        582 + offset: oled_data = 16'b1110111100111101;
        584 + offset: oled_data = 16'b1011111011111101;
        674 + offset, 1154 + offset, 1256 + offset: oled_data = 16'b1110011101111101;
        680 + offset, 1250 + offset: oled_data = 16'b1101111101111110;
        770 + offset: oled_data = 16'b1101110100110110;
        771 + offset, 774 + offset: oled_data = 16'b1111010111111000;
        772 + offset, 773 + offset: oled_data = 16'b1111011000111001;
        775 + offset: oled_data = 16'b1110110100110110;
        776 + offset, 872 + offset: oled_data = 16'b1101110011110101;
        866 + offset: oled_data = 16'b1101110000010011;
        867 + offset: oled_data = 16'b1110110011110100;
        868 + offset, 870 + offset: oled_data = 16'b1110110001010011;
        869 + offset: oled_data = 16'b1110001111010001;
        871 + offset: oled_data = 16'b1110110010110100;
        962 + offset: oled_data = 16'b1101110110110111;
        963 + offset: oled_data = 16'b1111010111111001;
        964 + offset: oled_data = 16'b1110010000010010;
        965 + offset, 1063 + offset: oled_data = 16'b1110110000010010;
        966 + offset: oled_data = 16'b1110110010110011;
        967 + offset: oled_data = 16'b1110110100110101;
        968 + offset: oled_data = 16'b1101110010110100;
        1058 + offset: oled_data = 16'b1101110101110111;
        1059 + offset: oled_data = 16'b1110001011001101;
        1060 + offset: oled_data = 16'b1110001101001111;
        1061 + offset: oled_data = 16'b1110001110010000;
        1062 + offset: oled_data = 16'b1110110000010011;
        1064 + offset: oled_data = 16'b1101110001010011;
        1155 + offset: oled_data = 16'b1111111110111111;
        1156 + offset: oled_data = 16'b1111111100111100;
        1157 + offset, 1158 + offset: oled_data = 16'b1111011010111011;
        1159 + offset: oled_data = 16'b1111111101111101;
        1160 + offset, 1352 + offset: oled_data = 16'b1110011101111110;
        1346 + offset: oled_data = 16'b1101111100111101;
        1442 + offset, 1540 + offset, 1542 + offset: oled_data = 16'b1100111100111110;
        1448 + offset: oled_data = 16'b1101011100111101;
        1539 + offset: oled_data = 16'b1011011011111110;
        1541 + offset: oled_data = 16'b1100111101111110;
        1543 + offset: oled_data = 16'b1011111011111110;
        1544 + offset: oled_data = 16'b1001111011111111;
        default: oled_data = 16'b11111_101110_11011; //1001111011111111;
    endcase

//    case (pixel_index)
//        100 + offset, 1544 + offset: oled_data = 16'b0001000001000010;
//        101 + offset, 194 + offset: oled_data = 16'b0001000010000010;
//        102 + offset: oled_data = 16'b0000100001000010;
//        195 + offset, 199 + offset, 484 + offset: oled_data = 16'b1001110010110111;
//        196 + offset, 198 + offset: oled_data = 16'b1011110111111011;
//        197 + offset: oled_data = 16'b1011111000111011;
//        200 + offset: oled_data = 16'b0001000010000011;
//        290 + offset: oled_data = 16'b0010100101000111;
//        291 + offset, 292 + offset, 294 + offset, 295 + offset, 388 + offset, 486 + offset: oled_data = 16'b1001110010111000;
//        293 + offset: oled_data = 16'b1010010010111001;
//        296 + offset: oled_data = 16'b0011000110000111;
//        386 + offset: oled_data = 16'b0000100000000000;
//        387 + offset: oled_data = 16'b1000110000010110;
//        389 + offset, 390 + offset, 391 + offset: oled_data = 16'b1001010001010111;
//        392 + offset: oled_data = 16'b0000100000000001;
//        482 + offset, 488 + offset: oled_data = 16'b0101101010001110;
//        483 + offset: oled_data = 16'b1010010011111001;
//        485 + offset: oled_data = 16'b1010110100111001;
//        487 + offset: oled_data = 16'b1010010011111000;
//        578 + offset, 1540 + offset, 1542 + offset: oled_data = 16'b1000110001010001;
//        579 + offset, 581 + offset, 583 + offset, 675 + offset, 676 + offset, 677 + offset, 678 + offset, 679 + offset, 1155 + offset, 1251 + offset: oled_data = 16'b1111111111111111;
//        1252 + offset, 1253 + offset, 1254 + offset, 1255 + offset, 1347 + offset, 1348 + offset, 1349 + offset, 1350 + offset, 1351 + offset, 1443 + offset: oled_data = 16'b1111111111111111;
//        1444 + offset, 1445 + offset, 1446 + offset, 1447 + offset: oled_data = 16'b1111111111111111;
//        580 + offset: oled_data = 16'b1110111101111110;
//        582 + offset: oled_data = 16'b1110111100111110;
//        584 + offset: oled_data = 16'b0111101111001111;
//        674 + offset, 1250 + offset: oled_data = 16'b1100011000111000;
//        680 + offset: oled_data = 16'b1100010111110111;
//        770 + offset: oled_data = 16'b1101010010110100;
//        771 + offset, 774 + offset: oled_data = 16'b1111010111111000;
//        772 + offset: oled_data = 16'b1111011001111001;
//        773 + offset, 963 + offset: oled_data = 16'b1111011000111001;
//        775 + offset: oled_data = 16'b1110110100110110;
//        776 + offset: oled_data = 16'b1100110001010010;
//        866 + offset: oled_data = 16'b1101001111010001;
//        867 + offset: oled_data = 16'b1110110011110100;
//        868 + offset, 870 + offset: oled_data = 16'b1110110001010011;
//        869 + offset: oled_data = 16'b1110001111010001;
//        871 + offset: oled_data = 16'b1110110010110100;
//        872 + offset: oled_data = 16'b1101010001010011;
//        962 + offset, 1058 + offset: oled_data = 16'b1100110011110100;
//        964 + offset, 1063 + offset: oled_data = 16'b1110110000010010;
//        965 + offset: oled_data = 16'b1110010000010010;
//        966 + offset: oled_data = 16'b1110110010110011;
//        967 + offset: oled_data = 16'b1110110100110101;
//        968 + offset: oled_data = 16'b1100110000010001;
//        1059 + offset: oled_data = 16'b1110001010001101;
//        1060 + offset: oled_data = 16'b1110001101001111;
//        1061 + offset: oled_data = 16'b1110101101010000;
//        1062 + offset: oled_data = 16'b1110110000010011;
//        1064 + offset: oled_data = 16'b1100101111010001;
//        1154 + offset: oled_data = 16'b1101111010111010;
//        1156 + offset: oled_data = 16'b1111011100111100;
//        1157 + offset: oled_data = 16'b1111011010111011;
//        1158 + offset: oled_data = 16'b1111011011111011;
//        1159 + offset: oled_data = 16'b1111111101111101;
//        1160 + offset: oled_data = 16'b1110011100111100;
//        1256 + offset: oled_data = 16'b1101011010111010;
//        1346 + offset: oled_data = 16'b1011110111110111;
//        1352 + offset: oled_data = 16'b1101011001111010;
//        1442 + offset, 1541 + offset: oled_data = 16'b1001010010110010;
//        1448 + offset: oled_data = 16'b1010010100110100;
//        1538 + offset: oled_data = 16'b0000100001000001;
//        1539 + offset: oled_data = 16'b0110001011001100;
//        1543 + offset: oled_data = 16'b0110001100001100;
//        default: oled_data = 16'b0000000000000000;
//    endcase

endmodule
