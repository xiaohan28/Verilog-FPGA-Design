`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 15:11:27
// Design Name: 
// Module Name: butter
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


module butter(
    input clk,
    input [6:0] x,
    input [6:0] y,
    input [12:0] pixel_index,
    output reg [15:0] oled_data = 0  
    );
    
    wire [12:0] offset = y * 96 + x;
    
    always @ (posedge clk)
    case (pixel_index)
        194 + offset: oled_data = 16'b1010111010111000;
        195 + offset, 207 + offset: oled_data = 16'b1101011001101111;
        196 + offset, 198 + offset, 199 + offset, 206 + offset: oled_data = 16'b1101111001110000;
        197 + offset, 200 + offset, 204 + offset: oled_data = 16'b1101111001101111;
        201 + offset: oled_data = 16'b1101111010110000;
        202 + offset: oled_data = 16'b1110011001101111;
        203 + offset, 205 + offset: oled_data = 16'b1110011010110000;
        208 + offset: oled_data = 16'b1010011010111010;
        290 + offset, 578 + offset: oled_data = 16'b1011111001110011;
        291 + offset, 487 + offset: oled_data = 16'b1111010111100111;
        292 + offset, 293 + offset, 294 + offset, 295 + offset, 296 + offset, 389 + offset, 484 + offset, 493 + offset, 587 + offset: oled_data = 16'b1111011010101101;
        297 + offset, 491 + offset, 580 + offset, 589 + offset: oled_data = 16'b1111011001101100;
        298 + offset, 388 + offset, 392 + offset, 489 + offset, 585 + offset, 679 + offset, 680 + offset, 681 + offset, 682 + offset, 684 + offset: oled_data = 16'b1111011001101011;
        299 + offset, 303 + offset, 396 + offset, 492 + offset: oled_data = 16'b1111011001101010;
        300 + offset, 302 + offset, 393 + offset, 395 + offset, 588 + offset: oled_data = 16'b1111011000101010;
        301 + offset: oled_data = 16'b1111011001101001;
        304 + offset: oled_data = 16'b1110010111101001;
        305 + offset, 674 + offset, 689 + offset: oled_data = 16'b1001111011111101;
        386 + offset: oled_data = 16'b1011111000110010;
        387 + offset: oled_data = 16'b1110110111100101;
        390 + offset, 398 + offset, 582 + offset: oled_data = 16'b1111011000101001;
        391 + offset, 685 + offset: oled_data = 16'b1110111001101010;
        394 + offset, 397 + offset, 683 + offset: oled_data = 16'b1110111001101011;
        399 + offset, 496 + offset, 592 + offset: oled_data = 16'b1111011010101111;
        400 + offset: oled_data = 16'b1111011011101110;
        401 + offset: oled_data = 16'b1010111001111000;
        482 + offset: oled_data = 16'b1100011001110010;
        483 + offset: oled_data = 16'b1111010110100100;
        485 + offset: oled_data = 16'b1111011010110000;
        486 + offset: oled_data = 16'b1111011000100111;
        488 + offset, 579 + offset: oled_data = 16'b1110111000101000;
        490 + offset, 586 + offset: oled_data = 16'b1111011010101110;
        494 + offset: oled_data = 16'b1110110111100111;
        495 + offset, 581 + offset: oled_data = 16'b1111011011101111;
        497 + offset: oled_data = 16'b1011011010110110;
        583 + offset: oled_data = 16'b1110111000101001;
        584 + offset, 590 + offset: oled_data = 16'b1111011000101000;
        591 + offset: oled_data = 16'b1111011011110000;
        593 + offset: oled_data = 16'b1011011010111000;
        675 + offset: oled_data = 16'b1100111000101110;
        676 + offset, 678 + offset: oled_data = 16'b1110111000101010;
        677 + offset, 687 + offset: oled_data = 16'b1110111001101101;
        686 + offset: oled_data = 16'b1110111000101011;
        688 + offset: oled_data = 16'b1101111000101101;
        772 + offset, 778 + offset, 781 + offset: oled_data = 16'b1001111011111111;
        773 + offset, 774 + offset, 775 + offset, 776 + offset, 777 + offset, 779 + offset, 780 + offset, 783 + offset: oled_data = 16'b1001111011111110;
        782 + offset: oled_data = 16'b1001011011111110;
        default: oled_data = 16'b11111_101110_11011; //1001111011111111;
    endcase

//    case (pixel_index)
//        194 + offset, 401 + offset, 593 + offset: oled_data = 16'b0011100101000000;
//        195 + offset, 207 + offset: oled_data = 16'b1010010000000101;
//        196 + offset, 206 + offset: oled_data = 16'b1011010010101000;
//        197 + offset, 198 + offset, 200 + offset: oled_data = 16'b1011010010100111;
//        199 + offset: oled_data = 16'b1010110010100111;
//        201 + offset, 205 + offset: oled_data = 16'b1011110011101001;
//        202 + offset, 203 + offset, 204 + offset: oled_data = 16'b1100010100101001;
//        208 + offset: oled_data = 16'b0010100100000000;
//        290 + offset: oled_data = 16'b0110001001000001;
//        291 + offset, 579 + offset: oled_data = 16'b1110110111100111;
//        292 + offset, 293 + offset, 295 + offset, 389 + offset, 493 + offset, 587 + offset: oled_data = 16'b1111011010101101;
//        294 + offset, 400 + offset, 490 + offset, 586 + offset: oled_data = 16'b1111011010101110;
//        296 + offset, 484 + offset: oled_data = 16'b1111011001101101;
//        297 + offset: oled_data = 16'b1111011010101100;
//        298 + offset, 388 + offset, 392 + offset, 394 + offset, 397 + offset, 585 + offset, 680 + offset, 681 + offset, 682 + offset: oled_data = 16'b1111011001101011;
//        299 + offset, 300 + offset, 302 + offset, 303 + offset, 393 + offset, 492 + offset: oled_data = 16'b1111011001101010;
//        301 + offset, 390 + offset, 582 + offset, 583 + offset: oled_data = 16'b1111011000101001;
//        304 + offset: oled_data = 16'b1101010100100101;
//        305 + offset, 689 + offset: oled_data = 16'b0001000001000000;
//        386 + offset: oled_data = 16'b0110101001000001;
//        387 + offset: oled_data = 16'b1110110111100101;
//        391 + offset, 396 + offset: oled_data = 16'b1111011000101010;
//        395 + offset, 588 + offset, 679 + offset, 685 + offset: oled_data = 16'b1110111000101010;
//        398 + offset, 678 + offset, 684 + offset: oled_data = 16'b1110111000101001;
//        399 + offset, 496 + offset, 592 + offset: oled_data = 16'b1111011010101111;
//        482 + offset: oled_data = 16'b0110101010000001;
//        483 + offset: oled_data = 16'b1111010110100100;
//        485 + offset, 591 + offset: oled_data = 16'b1111011011110000;
//        486 + offset, 494 + offset: oled_data = 16'b1111010111100111;
//        487 + offset: oled_data = 16'b1110111000100111;
//        488 + offset: oled_data = 16'b1111011000101000;
//        489 + offset: oled_data = 16'b1111011000101011;
//        491 + offset, 580 + offset, 589 + offset: oled_data = 16'b1111011001101100;
//        495 + offset, 581 + offset: oled_data = 16'b1111011011101111;
//        497 + offset: oled_data = 16'b0100100111000001;
//        578 + offset: oled_data = 16'b0110101010000010;
//        584 + offset, 590 + offset: oled_data = 16'b1110111000101000;
//        674 + offset, 773 + offset, 775 + offset, 778 + offset, 780 + offset: oled_data = 16'b0000100001000000;
//        675 + offset: oled_data = 16'b1001001101000010;
//        676 + offset: oled_data = 16'b1101110110101000;
//        677 + offset: oled_data = 16'b1110010111101011;
//        683 + offset: oled_data = 16'b1110111001101011;
//        686 + offset: oled_data = 16'b1110010111101001;
//        687 + offset: oled_data = 16'b1101010101101001;
//        688 + offset: oled_data = 16'b1011010010100101;
//        776 + offset, 779 + offset, 782 + offset: oled_data = 16'b0000100000000000;
//        default: oled_data = 16'b0000000000000000;
//    endcase

endmodule
