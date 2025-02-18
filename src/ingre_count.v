`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 00:37:48
// Design Name: 
// Module Name: ingre_count
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


module ingre_count(
   input clk,
   input [12:0] pixel_index,
   output reg [15:0] oled_data = 0  
   );
   
   wire offset = 0;
   
   always @ (posedge clk)
   case (pixel_index)
       182 + offset, 479 + offset, 2685 + offset, 3070 + offset: oled_data = 16'b1010011011111100;
       183 + offset, 184 + offset, 185 + offset, 188 + offset: oled_data = 16'b1010111010111001;
       186 + offset, 189 + offset: oled_data = 16'b1011011010111001;
       187 + offset: oled_data = 16'b1011011011111001;
       190 + offset: oled_data = 16'b1010011011111011;
       278 + offset: oled_data = 16'b1011111001110010;
       279 + offset: oled_data = 16'b1111011000101010;
       280 + offset, 283 + offset: oled_data = 16'b1111011010101101;
       281 + offset, 285 + offset: oled_data = 16'b1111011010101100;
       282 + offset, 286 + offset: oled_data = 16'b1111011001101101;
       284 + offset, 376 + offset, 379 + offset: oled_data = 16'b1111011001101100;
       287 + offset, 2682 + offset: oled_data = 16'b1011011010111000;
       374 + offset: oled_data = 16'b1100011001110011;
       375 + offset, 380 + offset: oled_data = 16'b1111011001101010;
       377 + offset: oled_data = 16'b1110110111100111;
       378 + offset: oled_data = 16'b1111011000101000;
       381 + offset: oled_data = 16'b1110111000101010;
       382 + offset: oled_data = 16'b1111011010101110;
       383 + offset, 2781 + offset, 3068 + offset: oled_data = 16'b1011111010110111;
       470 + offset, 2106 + offset, 2204 + offset: oled_data = 16'b1010011010111100;
       471 + offset: oled_data = 16'b1011111010110100;
       472 + offset, 474 + offset, 475 + offset, 477 + offset, 2586 + offset, 2974 + offset: oled_data = 16'b1100011010110100;
       473 + offset, 2972 + offset: oled_data = 16'b1100111010110100;
       476 + offset, 2973 + offset: oled_data = 16'b1100011001110100;
       478 + offset, 2492 + offset: oled_data = 16'b1100011010110110;
       666 + offset, 2110 + offset: oled_data = 16'b1001111010111110;
       667 + offset: oled_data = 16'b1010010101111010;
       668 + offset: oled_data = 16'b1011010110111011;
       669 + offset: oled_data = 16'b1010010110111010;
       762 + offset: oled_data = 16'b1001111001111110;
       763 + offset: oled_data = 16'b1001010001010111;
       764 + offset: oled_data = 16'b1001110010111000;
       765 + offset: oled_data = 16'b1001010010111000;
       858 + offset: oled_data = 16'b1010011001111101;
       859 + offset, 860 + offset: oled_data = 16'b1100010111111011;
       861 + offset: oled_data = 16'b1011110111111010;
       862 + offset: oled_data = 16'b1001111010111111;
       954 + offset, 1242 + offset: oled_data = 16'b1100011100111110;
       955 + offset, 956 + offset, 957 + offset, 1339 + offset, 1340 + offset, 1341 + offset: oled_data = 16'b1111111111111111;
       958 + offset: oled_data = 16'b1010011011111110;
       1050 + offset, 1146 + offset: oled_data = 16'b1011110110111001;
       1051 + offset: oled_data = 16'b1110110001010011;
       1052 + offset: oled_data = 16'b1110110010110100;
       1053 + offset: oled_data = 16'b1110001111010001;
       1054 + offset: oled_data = 16'b1010111000111011;
       1147 + offset: oled_data = 16'b1110110010110011;
       1148 + offset: oled_data = 16'b1110110100110101;
       1149 + offset: oled_data = 16'b1110110000010010;
       1150 + offset: oled_data = 16'b1010011000111100;
       1243 + offset: oled_data = 16'b1111011010111011;
       1244 + offset: oled_data = 16'b1111010110111000;
       1245 + offset: oled_data = 16'b1111011001111010;
       1246 + offset, 1342 + offset, 1434 + offset: oled_data = 16'b1010111011111110;
       1338 + offset: oled_data = 16'b1100011100111111;
       1435 + offset, 1436 + offset: oled_data = 16'b1110111110111110;
       1437 + offset: oled_data = 16'b1110011101111110;
       1438 + offset, 1822 + offset, 2203 + offset, 2299 + offset: oled_data = 16'b1001111011111111;
       1723 + offset, 1918 + offset: oled_data = 16'b1011011001111010;
       1724 + offset: oled_data = 16'b1100111000110110;
       1725 + offset: oled_data = 16'b1010111010111100;
       1818 + offset: oled_data = 16'b1010011010111101;
       1819 + offset: oled_data = 16'b1111011000110100;
       1820 + offset, 2011 + offset: oled_data = 16'b1111010100101111;
       1821 + offset: oled_data = 16'b1110010101110001;
       1914 + offset, 2010 + offset: oled_data = 16'b1100011000110111;
       1915 + offset: oled_data = 16'b1111010110110001;
       1916 + offset: oled_data = 16'b1110110101101111;
       1917 + offset: oled_data = 16'b1111010101101111;
       2012 + offset: oled_data = 16'b1111010101110000;
       2013 + offset, 2108 + offset: oled_data = 16'b1110110100101111;
       2014 + offset: oled_data = 16'b1011111000111001;
       2107 + offset: oled_data = 16'b1110110101110000;
       2109 + offset: oled_data = 16'b1110010100110000;
       2395 + offset: oled_data = 16'b1101011001110001;
       2489 + offset: oled_data = 16'b1001111011111110;
       2490 + offset: oled_data = 16'b1101011010110010;
       2491 + offset, 2779 + offset: oled_data = 16'b1101011001110010;
       2587 + offset, 2780 + offset, 2876 + offset: oled_data = 16'b1100111001110011;
       2588 + offset: oled_data = 16'b1100111010110011;
       2683 + offset: oled_data = 16'b1100111001110001;
       2684 + offset, 2877 + offset: oled_data = 16'b1101111001110000;
       2778 + offset: oled_data = 16'b1010011011111101;
       2875 + offset: oled_data = 16'b1100011010110101;
       2878 + offset: oled_data = 16'b1010111011111011;
       2971 + offset: oled_data = 16'b1001111011111101;
       3069 + offset: oled_data = 16'b1011111001110110;
       default: oled_data = 16'b11111_101110_11011; //1001111011111111;
   endcase

//   case (pixel_index)
//       181 + offset: oled_data = 16'b0011000100000000;
//       182 + offset, 2779 + offset: oled_data = 16'b1000101110000110;
//       183 + offset, 186 + offset, 188 + offset: oled_data = 16'b1001010000001000;
//       184 + offset, 185 + offset: oled_data = 16'b1001001111000111;
//       187 + offset: oled_data = 16'b1001110000001000;
//       189 + offset: oled_data = 16'b1001001111001000;
//       190 + offset: oled_data = 16'b0111001011000100;
//       277 + offset: oled_data = 16'b0101101000000001;
//       278 + offset: oled_data = 16'b1111011000101001;
//       279 + offset, 478 + offset: oled_data = 16'b1111011010101110;
//       280 + offset, 379 + offset, 477 + offset: oled_data = 16'b1111011001101011;
//       281 + offset, 378 + offset, 380 + offset: oled_data = 16'b1111011001101100;
//       282 + offset: oled_data = 16'b1110111000101001;
//       283 + offset: oled_data = 16'b1111010111100111;
//       284 + offset: oled_data = 16'b1111010111100110;
//       285 + offset: oled_data = 16'b1110110111100110;
//       286 + offset, 473 + offset: oled_data = 16'b1111011001101010;
//       287 + offset: oled_data = 16'b0101001000000001;
//       373 + offset: oled_data = 16'b0110001001000001;
//       374 + offset, 376 + offset: oled_data = 16'b1110111000100111;
//       375 + offset: oled_data = 16'b1111011010110000;
//       377 + offset: oled_data = 16'b1111010110100100;
//       381 + offset: oled_data = 16'b1111011000101000;
//       382 + offset, 471 + offset: oled_data = 16'b1111011011101111;
//       383 + offset: oled_data = 16'b0111101011000100;
//       469 + offset: oled_data = 16'b0011100101000001;
//       470 + offset: oled_data = 16'b1110110111101000;
//       472 + offset: oled_data = 16'b1111011000101010;
//       474 + offset, 475 + offset, 476 + offset: oled_data = 16'b1111011010101101;
//       479 + offset: oled_data = 16'b0101101001000010;
//       566 + offset, 574 + offset: oled_data = 16'b0001000001000000;
//       567 + offset, 573 + offset: oled_data = 16'b0001100010000000;
//       568 + offset, 570 + offset: oled_data = 16'b0001100011000001;
//       569 + offset: oled_data = 16'b0010000010000000;
//       571 + offset: oled_data = 16'b0010000011000000;
//       572 + offset: oled_data = 16'b0001100010000001;
//       665 + offset: oled_data = 16'b0110101101010000;
//       666 + offset: oled_data = 16'b1010010011111000;
//       667 + offset: oled_data = 16'b1000010000010100;
//       668 + offset: oled_data = 16'b0001100011000011;
//       761 + offset: oled_data = 16'b1000001111010100;
//       762 + offset, 763 + offset: oled_data = 16'b1001110001010111;
//       764 + offset: oled_data = 16'b0001100011000101;
//       856 + offset: oled_data = 16'b0001000001000010;
//       857 + offset, 859 + offset: oled_data = 16'b1011110111111010;
//       858 + offset: oled_data = 16'b1100010111111011;
//       860 + offset: oled_data = 16'b0100001000001010;
//       952 + offset: oled_data = 16'b0010100101000101;
//       953 + offset, 954 + offset, 955 + offset, 1337 + offset, 1338 + offset, 1339 + offset: oled_data = 16'b1111111111111111;
//       956 + offset: oled_data = 16'b0111001110001110;
//       1048 + offset, 1144 + offset: oled_data = 16'b0011000011000100;
//       1049 + offset: oled_data = 16'b1110110011110100;
//       1050 + offset: oled_data = 16'b1110010000010010;
//       1051 + offset: oled_data = 16'b1110110001010010;
//       1052 + offset: oled_data = 16'b0111001000001001;
//       1145 + offset: oled_data = 16'b1110110010110011;
//       1146 + offset: oled_data = 16'b1110101110010001;
//       1147 + offset: oled_data = 16'b1110110100110110;
//       1148 + offset: oled_data = 16'b0111101000001001;
//       1240 + offset: oled_data = 16'b0011000110000110;
//       1241 + offset: oled_data = 16'b1111011100111100;
//       1242 + offset: oled_data = 16'b1111010110110111;
//       1243 + offset: oled_data = 16'b1111011000111001;
//       1244 + offset, 1340 + offset: oled_data = 16'b0111101111001111;
//       1336 + offset: oled_data = 16'b0010100100000101;
//       1432 + offset: oled_data = 16'b0000100001000001;
//       1433 + offset: oled_data = 16'b1100011000111000;
//       1434 + offset: oled_data = 16'b1110111101111101;
//       1435 + offset: oled_data = 16'b1101111011111010;
//       1436 + offset: oled_data = 16'b0100001000001001;
//       1721 + offset, 2202 + offset, 2777 + offset: oled_data = 16'b0010000011000010;
//       1722 + offset: oled_data = 16'b1000101100001001;
//       1723 + offset: oled_data = 16'b0110001000000110;
//       1817 + offset: oled_data = 16'b1011110010101110;
//       1818 + offset: oled_data = 16'b1111010110110001;
//       1819 + offset, 2009 + offset, 2011 + offset: oled_data = 16'b1111010101101111;
//       1820 + offset: oled_data = 16'b0100000101000100;
//       1912 + offset: oled_data = 16'b0001000010000001;
//       1913 + offset, 1914 + offset: oled_data = 16'b1111010101110000;
//       1915 + offset: oled_data = 16'b1110110101101111;
//       1916 + offset: oled_data = 16'b1001001100001001;
//       2008 + offset: oled_data = 16'b0001100010000010;
//       2010 + offset: oled_data = 16'b1110110100101111;
//       2012 + offset: oled_data = 16'b1001101100001001;
//       2105 + offset: oled_data = 16'b1010101110001011;
//       2106 + offset: oled_data = 16'b1111010100101111;
//       2107 + offset: oled_data = 16'b1110110011101101;
//       2108 + offset: oled_data = 16'b0100100101000100;
//       2203 + offset, 2488 + offset: oled_data = 16'b0000100001000000;
//       2298 + offset: oled_data = 16'b0000100000000000;
//       2394 + offset: oled_data = 16'b1010010000000110;
//       2489 + offset: oled_data = 16'b1010010000000111;
//       2490 + offset, 2778 + offset: oled_data = 16'b1001101111000110;
//       2491 + offset: oled_data = 16'b0110001010000100;
//       2585 + offset, 2972 + offset: oled_data = 16'b0111101100000100;
//       2586 + offset, 2587 + offset: oled_data = 16'b1000001101000101;
//       2681 + offset: oled_data = 16'b0100100111000010;
//       2682 + offset: oled_data = 16'b1001101111000101;
//       2683 + offset: oled_data = 16'b1010110000000110;
//       2684 + offset: oled_data = 16'b0010000100000001;
//       2780 + offset, 3068 + offset: oled_data = 16'b0101101001000011;
//       2874 + offset: oled_data = 16'b0110101011000100;
//       2875 + offset: oled_data = 16'b1000001100000101;
//       2876 + offset: oled_data = 16'b1011010010101000;
//       2877 + offset: oled_data = 16'b0010100100000010;
//       2970 + offset: oled_data = 16'b0001000010000000;
//       2971 + offset: oled_data = 16'b1000001100000100;
//       2973 + offset: oled_data = 16'b0111101100000101;
//       3067 + offset: oled_data = 16'b0101101000000100;
//       3069 + offset: oled_data = 16'b0010100100000001;
//       default: oled_data = 16'b0000000000000000;
//   endcase

endmodule
