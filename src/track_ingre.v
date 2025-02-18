`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 00:14:16
// Design Name: 
// Module Name: track_ingre
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


module track_ingre2(
    input clk,
    input [6:0] y_pos,
    input [1:0] count,
    input [12:0] pix_index,
    output reg [15:0] oled = 0
    );
    
    wire [6:0] x;
    wire [6:0] y;
    assign x = pix_index % 96;
    assign y = pix_index / 96;
    
    reg [15:0] default_col = 16'b11111_101110_11011;
    
    always @ (posedge clk)
    begin
        if (count == 0)
        begin
            if (((x >= 80 && x <= 82 && (y == y_pos | y == y_pos + 2 | y == y_pos + 4)) | (x == 82 && y == y_pos + 1) | (x == 80 && y == y_pos + 3))) //2
            begin
//                oled <= 16'b11111_11111_111111;
               oled <= 16'b00000_00000_000000;
            end
            else
            begin
                oled <= default_col;
            end
        end
        else if (count == 1)
        begin
            if (((x == 80 | x == 81) && y == y_pos) | (x == 81 && y >= y_pos + 1 && y <= y_pos + 3) | (y == y_pos + 4 && x >= 80 && x <= 82)) //1
            begin
//                oled <= 16'b11111_11111_111111; 
               oled <= 16'b00000_00000_000000;           
            end
            else
            begin
                oled <= default_col;
            end            
        end
        else
        begin
            if (((x == 80 | x == 82) && y >= y_pos && y <= y_pos + 4) | (x == 81 && (y == y_pos | y == y_pos + 4))) //0
            begin
//                oled <= 16'b11111_11111_111111; 
               oled <= 16'b00000_00000_000000;           
            end  
            else
            begin
                oled <= default_col;
            end                  
        end
    end
    
endmodule
