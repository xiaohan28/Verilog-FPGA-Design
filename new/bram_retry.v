`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 17:34:58
// Design Name: 
// Module Name: bram_retry
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


module bram_retry(clk, addr, read_write, clear, data_in, data_out);
parameter n = 13;
parameter w = 16;

input clk, read_write, clear;
input [n-1:0] addr;
input [w-1:0] data_in;
output reg [w-1:0] data_out;

// Start module here!
reg [w-1:0] reg_array [2**n-1:0];

integer i;
initial begin
    $readmemb("C:/Users/yqneo/Desktop/MODS/bram_textfiles/try_again.txt", reg_array);
end

always @(posedge(clk)) begin
    if(read_write == 1)
        reg_array[addr] <= data_in;
    data_out = reg_array[addr];
end
endmodule
