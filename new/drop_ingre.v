`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 21:10:59
// Design Name: 
// Module Name: drop_ingre
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


module drop_ingre(
    input start,
    input clk,
    input [8:0] delay,
    input reset,
    output reg [6:0] y = 70
    );
    
    reg [31:0] count = 0;
   
    always @ (posedge clk)
    begin
        if (start)
        begin
            if (y == 80)
            begin
                if (reset == 1)
                begin
                    count <= 0;
                    y <= 70;
                end
            end
            else if (count < delay + 40) //give 40 clock cycles before it starts, i.e. 2 sec
            begin
                count <= count + 1;
            end
            else
            begin
                if (y == 70)
                begin
                    y <= 0;
                end
                else if (y <= 63)
                begin
                    y <= y + 1;
                end
                else
                begin
                    y <= 80;
                end
            end
        end    
    end
    
endmodule
