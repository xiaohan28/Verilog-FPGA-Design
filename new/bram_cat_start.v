module bram_cat_start(clk, addr, read_write, clear, data_in, data_out);
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
    $readmemb("C:/Users/yqneo/Desktop/MODS/bram_textfiles/cat_start_page.txt", reg_array);
end

always @(posedge(clk)) begin
    if(read_write == 1)
        reg_array[addr] <= data_in;
    data_out = reg_array[addr];
end
endmodule