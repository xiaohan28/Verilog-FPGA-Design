`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 18:19:58
// Design Name: 
// Module Name: mouse_cursor
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


module mouse_cursor(
    input CLOCK,
    input [12:0] pixel_index,
    input clk_6p25m,
    input [11:0] mouse_x,
    input [11:0] mouse_y,
    output reg [15:0] oled = 0,
    output reg [11:0] cursor_x = 8 //48
    );
 
    reg [11:0] cursor_y = 62;
    reg [11:0] prev_x = 8; //48
    reg [3:0] sens = 8;
        
    wire [11:0] pix_x;
    wire [11:0] pix_y;
    assign pix_x = pixel_index % 96;
    assign pix_y = pixel_index / 96;
    
    reg [31:0] debounce_count = 0; 
      
   always @ (posedge CLOCK)
   begin
       //update cursor position based on mouse movement
       if (debounce_count <= 999_999)
       begin
         debounce_count <= debounce_count + 1;
       end
       else
       begin
          debounce_count <= 0; //reset the counter when debounce interval is reached
          //cursor_x <= (mouse_x < 87 && mouse_x > 8) ? mouse_x : cursor_x; // Limit x to OLED width (96)
          cursor_y <= 64;
          if ((mouse_x > prev_x + sens) | (mouse_x < prev_x - sens))
          begin
                if (mouse_x / sens >= 8 && mouse_x / sens <= 87)
                begin
                    cursor_x <= mouse_x / sens;
                end
                    prev_x <= mouse_x; //update the last mouse position
                end
       end
   end
  
   //oled display for cursor
    always @ (posedge clk_6p25m)
    begin
       if (((pix_x == cursor_x - 3) | (pix_x == cursor_x + 3)) && ((pix_y >= cursor_y - 12) && (pix_y <= cursor_y - 9)))
       begin
           oled <= 16'b11000_100010_00100;
        end else if (((pix_x == cursor_x - 2) | (pix_x == cursor_x + 2)) && (pix_y == cursor_y - 13)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 1) && (pix_x <= cursor_x + 1) && (pix_y == cursor_y - 14)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 8) && (pix_x <= cursor_x + 8) && (pix_y == cursor_y - 8)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 7) && (pix_x <= cursor_x + 7) && (pix_y == cursor_y - 7)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 7) && (pix_x <= cursor_x + 7) && (pix_y == cursor_y - 6)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 7) && (pix_x <= cursor_x + 7) && (pix_y == cursor_y - 5)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 7) && (pix_x <= cursor_x + 7) && (pix_y == cursor_y - 4)) begin
           oled <= 16'b11000_100010_00100;
        end else if ((pix_x >= cursor_x - 6) && (pix_x <= cursor_x + 6) && (pix_y == cursor_y - 3)) begin
           oled <= 16'b11000_100010_00100;
       end else if ((pix_x >= cursor_x - 5) && (pix_x <= cursor_x + 5) && (pix_y == cursor_y - 2)) begin
           oled <= 16'b11000_100010_00100;
       end else if ((pix_x >= cursor_x - 4) && (pix_x <= cursor_x + 4) && (pix_y == cursor_y - 1)) begin
           oled <= 16'b11000_100010_00100;
       end else begin
           oled <= 16'b00000_000000_00000; // Background color
       end
    end
endmodule