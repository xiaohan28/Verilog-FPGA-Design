`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 01:20:43
// Design Name: 
// Module Name: catch_ingredients
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


module catch_ingredients(
    input CLOCK,
    input [12:0] pix_index,
    input clk_6p25m,
    input [11:0] mouse_x,
    input [11:0] mouse_y,
    input clk_drop,
    output reg [15:0] oled = 0,
    input [3:0] state, //if state == 1 then start game1
    output reg completed1 = 0,
    input [15:0] retry_bram
    );
    
    wire [15:0] oled_cur;
    wire [15:0] oled_hearts;
    wire [15:0] oled_butter1, oled_butter2;
    wire [15:0] oled_milk1;
    wire [15:0] oled_egg1, oled_egg2;
    wire [15:0] oled_wheat1, oled_wheat2, oled_wheat3;
    wire [15:0] oled_bomb1, oled_bomb2, oled_bomb3;
    
    wire [15:0] oled_count;
    wire [15:0] oled_tracke;
    wire [15:0] oled_trackb;
    wire [15:0] oled_trackm;
    wire [15:0] oled_trackw;
    wire [15:0] oled_trackbomb;
    
    wire [6:0] x;
    wire [6:0] y;
    assign x = pix_index % 96;
    assign y = pix_index / 96;
    wire [11:0] cursor;
    
    reg [6:0] x_egg1 = 2, x_egg2 = 50;
    reg [6:0] x_wheat1 = 40, x_wheat2 = 10, x_wheat3 = 70;
    reg [6:0] x_milk1 = 60;
    reg [6:0] x_butter1 = 30, x_butter2 = 65;
    reg [6:0] x_bomb1 = 20, x_bomb2 = 35, x_bomb3 = 57;
    
    reg [8:0] delay1 = 0, delay2 = 50, delay3 = 68, delay4 = 111, delay5 = 160, delay6 = 205, delay7 = 240;
    
    wire [6:0] y_egg1, y_egg2;
    wire [6:0] y_wheat1, y_wheat2, y_wheat3;
    wire [6:0] y_milk1;
    wire [6:0] y_butter1, y_butter2;
    wire [6:0] y_bomb1, y_bomb2, y_bomb3;
    
    reg [8:0] time_count = 0;
    reg [6:0] try_screen_t = 0;
    reg reset = 0;
    reg milk_count = 0;
    reg butter_count = 0;
    reg [1:0] egg_count = 0;
    reg [1:0] wheat_count = 0;
    reg [1:0] lives_lost = 0;
    
    reg egg1_caught, egg2_caught;
    reg butter1_caught, butter2_caught;
    reg wheat1_caught, wheat2_caught, wheat3_caught;
    reg milk1_caught;
    reg bomb1_caught, bomb2_caught, bomb3_caught;
    
    reg start_drop = 0;

    mouse_cursor cursor_ctl(.CLOCK(CLOCK), .clk_6p25m(clk_6p25m), .oled(oled_cur), .mouse_x(mouse_x), .mouse_y(mouse_y), .pixel_index(pix_index), .cursor_x(cursor));
    
    drop_ingre drop_egg1(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay1), .y(y_egg1));
    drop_ingre drop_egg2(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay4), .y(y_egg2));  // Adjust delay for timing    

    drop_ingre drop_wheat1(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay3), .y(y_wheat1));
    drop_ingre drop_wheat2(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay4 + 18), .y(y_wheat2));
    drop_ingre drop_wheat3(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay7 + 15), .y(y_wheat3));

    drop_ingre drop_milk1(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay1 + 15), .y(y_milk1));
    //drop_ingre drop_milk2(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay6 + 50), .y(y_milk2));

    drop_ingre drop_butter1(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay5), .y(y_butter1));
    drop_ingre drop_butter2(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay6 + 20), .y(y_butter2));

    drop_ingre drop_bomb1(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay3), .y(y_bomb1));
    drop_ingre drop_bomb2(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay5 + 25), .y(y_bomb2));
    drop_ingre drop_bomb3(.start(start_drop), .reset(reset), .clk(clk_drop), .delay(delay7 + 15), .y(y_bomb3));

    egg egg1(.clk(clk_6p25m), .oled_data(oled_egg1), .pixel_index(pix_index), .y(y_egg1), .x(x_egg1));
    egg egg2(.clk(clk_6p25m), .oled_data(oled_egg2), .pixel_index(pix_index), .y(y_egg2), .x(x_egg2));
    
    wheat wheat1(.clk(clk_6p25m), .oled_data(oled_wheat1), .pixel_index(pix_index), .y(y_wheat1), .x(x_wheat1));
    wheat wheat2(.clk(clk_6p25m), .oled_data(oled_wheat2), .pixel_index(pix_index), .y(y_wheat2), .x(x_wheat2));
    wheat wheat3(.clk(clk_6p25m), .oled_data(oled_wheat3), .pixel_index(pix_index), .y(y_wheat3), .x(x_wheat3));
    
    milk milk1(.clk(clk_6p25m), .oled_data(oled_milk1), .pixel_index(pix_index), .y(y_milk1), .x(x_milk1));
    //milk milk2(.clk(clk_6p25m), .oled_data(oled_milk2), .pixel_index(pix_index), .y(y_milk2), .x(x_milk2));
    
    butter butter1(.clk(clk_6p25m), .oled_data(oled_butter1), .pixel_index(pix_index), .y(y_butter1), .x(x_butter1));
    butter butter2(.clk(clk_6p25m), .oled_data(oled_butter2), .pixel_index(pix_index), .y(y_butter2), .x(x_butter2));
    
    bomb bomb1(.clk(clk_6p25m), .oled_data(oled_bomb1), .pixel_index(pix_index), .y(y_bomb1), .x(x_bomb1));
    bomb bomb2(.clk(clk_6p25m), .oled_data(oled_bomb2), .pixel_index(pix_index), .y(y_bomb2), .x(x_bomb2));
    bomb bomb3(.clk(clk_6p25m), .oled_data(oled_bomb3), .pixel_index(pix_index), .y(y_bomb3), .x(x_bomb3));

    ingre_count all_ingre(.clk(clk_6p25m), .oled_data(oled_count), .pixel_index(pix_index));

    //hearts lives(.clk(CLOCK), .lives_lost(lives_lost), .oled(oled_hearts), .pixel_index(pix_index));
    track_ingre2 tracke(.clk(CLOCK), .y_pos(17), .count(egg_count), .pix_index(pix_index), .oled(oled_tracke));
    track_ingre1 trackb(.clk(CLOCK), .y_pos(1), .count(butter_count), .pix_index(pix_index), .oled(oled_trackb));
    track_ingre1 trackm(.clk(CLOCK), .y_pos(9), .count(milk_count), .pix_index(pix_index), .oled(oled_trackm));
    track_ingre3 trackw(.clk(CLOCK), .y_pos(25), .count(wheat_count), .pix_index(pix_index), .oled(oled_trackw));

    /*wire [15:0] retry_bram;
    bram_retry retry(.clk(CLOCK), .addr(pix_index), .read_write(0), .clear(0), .data_in(0), .data_out(retry_bram));*/

    always @ (posedge CLOCK)
    begin
        if (state != 4'b0001)
        begin
            start_drop <= 0;
        end
        else //state == 4'b0001
        begin
            if (egg_count == 2 && wheat_count == 3 && milk_count == 1 && butter_count == 1)
            begin
                completed1 <= 1;
                start_drop <= 0;
            end
            else if (lives_lost == 3 && try_screen_t <= 120)
            begin
                start_drop <= 0;
                completed1 <= 0;
            end
            else //try_screen_t > 120
            begin
                start_drop <= 1;
                completed1 <= 0;
            end
        end   
    end

    always @ (posedge clk_drop)
    begin
        if (lives_lost == 3 && try_screen_t <= 120)
        begin
            try_screen_t <= try_screen_t + 1;
            time_count <= 400;
        end
        else if (time_count <= 350 && start_drop)
        begin
            reset <= 0;
            time_count <= time_count + 1;
        end
        else if (try_screen_t > 120)
        begin
            reset <= 1;
            time_count <= 0;
            try_screen_t <= 0; 
        end
        else if (time_count > 350 && lives_lost < 3) // | try_screen_t > 120)
        begin
            reset <= 1;
            time_count <= 0;
            try_screen_t <= 0;
        end
    end

    always @ (posedge CLOCK)
    begin
        if (reset)
        begin
            egg1_caught <= 0;
            egg2_caught <= 0;
            wheat1_caught <= 0;
            wheat2_caught <= 0;
            wheat3_caught <= 0;
            butter1_caught <= 0;
            butter2_caught <= 0;
            milk1_caught <= 0;
//            milk2_caught <= 0;
            bomb1_caught <= 0;
            bomb2_caught <= 0;
            bomb3_caught <= 0;
        end
        if (lives_lost == 3)
        begin
            if (try_screen_t > 120)
            begin
                lives_lost <= 0;
                egg_count <= 0;
                wheat_count <= 0;
                milk_count <= 0;
                butter_count <= 0;
            end
        end
        else if (lives_lost < 3)
        begin
            if (!bomb1_caught && ((x_bomb1 + 5 >= cursor - 7 && x_bomb1 + 5 <= cursor + 7 && y_bomb1 == 56))) // center bottom pixel of basket
            begin
                lives_lost <= lives_lost + 1;
                bomb1_caught <= 1;
            end
            else if (!bomb2_caught && ((x_bomb2 + 5 >= cursor - 7 && x_bomb2 + 5 <= cursor + 7 && y_bomb2 == 56))) // center bottom pixel of basket
            begin
                lives_lost <= lives_lost + 1;
                bomb2_caught <= 1;
            end
            else if (!bomb3_caught && ((x_bomb3 + 5 >= cursor - 7 && x_bomb3 + 5 <= cursor + 7 && y_bomb3 == 56))) // center bottom pixel of basket
            begin
                lives_lost <= lives_lost + 1;
                bomb3_caught <= 1;
            end                
            if (egg_count < 2)
            begin
                if (!egg1_caught && ((x_egg1 + 6 >= cursor - 5 && x_egg1 + 6 <= cursor + 5 && y_egg1 == 56))) // center bottom pixel of basket
                //(x_egg1 + 6 >= cursor - 3 && x_egg1 + 6 <= cursor + 3 && y_egg1 == 52))) //| // left and right edge
                //(x_egg1 + 6 >= cursor - 3 && x_egg1 + 6 <= cursor + 3 && y_egg1 == 50)))  // top center pixel
                begin
                    egg_count <= egg_count + 1;
                    egg1_caught <= 1;
                end
                else if (!egg2_caught && ((x_egg2 + 6 >= cursor - 5 && x_egg2 + 6 <= cursor + 5 && y_egg2 == 56))) // center bottom pixel of basket
                //(x_egg2 + 6 >= cursor - 3 && x_egg2 + 6 <= cursor + 3 && y_egg2 == 52)))            
                begin
                    egg_count <= egg_count + 1;
                    egg2_caught <= 1;
                end                         
            end
            if (butter_count < 1)
            begin
                if (!butter1_caught && ((x_butter1 + 8 >= cursor - 5 && x_butter1 + 8 <= cursor + 5 && y_butter1 == 56))) // center bottom pixel of basket
                //(x_butter1 + 10 >= cursor - 3 && x_butter1 + 10 <= cursor + 3 && y_butter1 == 52))) 
                begin
                   butter_count <= butter_count + 1;
                   butter1_caught <= 1;
                end 
                else if (!butter2_caught && ((x_butter2 + 8 >= cursor - 5 && x_butter2 + 8 <= cursor + 5 && y_butter2 == 56))) // center bottom pixel of basket
                //(x_butter2 + 10 >= cursor - 3 && x_butter2 + 10 <= cursor + 3 && y_butter2 == 52))) 
                begin
                    butter_count <= butter_count + 1;
                    butter2_caught <= 1;
                end                   
            end
            if (milk_count < 1)
            begin
                if (!milk1_caught && ((x_milk1 + 3 >= cursor - 4 && x_milk1 + 3 <= cursor + 4 && y_milk1 == 56))) // center bottom pixel of basket
    //            (x_milk1 + 4 >= cursor - 3 && x_milk1 + 4 <= cursor + 3 && y_milk1 == 52)))
                begin
                   milk_count <= milk_count + 1;
                   milk1_caught <= 1;
                end 
//                else if (!milk2_caught && ((x_milk2 + 3 >= cursor - 4 && x_milk2 + 3 <= cursor + 4 && y_milk2 == 56))) // center bottom pixel of basket
//    //            (x_milk2 + 4 >= cursor - 3 && x_milk2 + 4 <= cursor + 3 && y_milk2 == 52)))           
//                begin
//                    milk_count <= milk_count + 1;
//                    milk2_caught <= 1;
//                end           
            end
            if (wheat_count < 3)
            begin
                if (!wheat1_caught && ((x_wheat1 + 6 >= cursor - 4 && x_wheat1 + 6 <= cursor + 4 && y_wheat1 == 56))) // center bottom pixel of basket
    //            (x_wheat1 + 4 >= cursor - 3 && x_wheat1 + 4 <= cursor + 3 && y_wheat1 == 52)))
                 begin
                     wheat_count <= wheat_count + 1;
                     wheat1_caught <= 1;
                 end
                else if (!wheat2_caught && ((x_wheat2 + 6 >= cursor - 4 && x_wheat2 + 6 <= cursor + 4 && y_wheat2 == 56))) // center bottom pixel of basket
    //            (x_wheat2 + 4 >= cursor - 3 && x_wheat2 + 4 <= cursor + 3 && y_wheat2 == 52)))       
                 begin
                     wheat_count <= wheat_count + 1;
                     wheat2_caught <= 1;
                 end
                else if (!wheat3_caught && ((x_wheat3 + 6 >= cursor - 4 && x_wheat3 + 6 <= cursor + 4 && y_wheat3 == 56))) // center bottom pixel of basket
    //            (x_wheat3 + 4 >= cursor - 3 && x_wheat3 + 4 <= cursor + 3 && y_wheat3 == 52)))
                 begin
                     wheat_count <= wheat_count + 1;
                     wheat3_caught <= 1;
                 end              
            end        
        end // end of reset == 0's if-else
    end

    always @ (posedge CLOCK)
    begin
        if (lives_lost == 3 && try_screen_t < 120)  //retry screen HERE
            oled <= retry_bram;
        else
        begin
            if ((((x == cursor - 3) | (x == cursor + 3)) && y >= 52 && y <= 55)
            | (((x == cursor - 2) | (x == cursor + 2)) && y == 51)
            | ((x >= cursor - 1) && (x <= cursor + 1) && y == 50)
            | ((x >= cursor - 8) && (x <= cursor + 8) && y == 56)
            | ((x >= cursor - 7) && (x <= cursor + 7) && y == 57)
            | ((x >= cursor - 7) && (x <= cursor + 7) && y == 58)
            | ((x >= cursor - 7) && (x <= cursor + 7) && y == 59)
            | ((x >= cursor - 7) && (x <= cursor + 7) && y == 60)
            | ((x >= cursor - 6) && (x <= cursor + 6) && y == 61)
            | ((x >= cursor - 5) && (x <= cursor + 5) && y == 62)
            | ((x >= cursor - 4) && (x <= cursor + 4) && y == 63))
            begin
                oled <= oled_cur;
            end
            else if (x >= 2 && x <= 24 && y <= 7)
            begin
//                oled <= oled_hearts;
                  if (lives_lost == 0)
                begin
                    if ((((x == 3 | x == 4 | x == 6 | x == 7) && y == 2)
                    | ((x >= 2 && x <= 8) && (y == 3 | y == 4))
                    | ((x >= 3 && x <= 7) && y == 5)
                    | ((x >= 4 && x <= 6) && y == 6)
                    | (x == 5 && y == 7))
                    //2nd heart   
                    | (((x == 11 | x == 12 | x == 14 | x == 15) && y == 2)
                    | ((x >= 10 && x <= 16) && (y == 3 | y == 4))
                    | ((x >= 11 && x <= 15) && y == 5)
                    | ((x >= 12 && x <= 14) && y == 6)
                    | (x == 13 && y == 7))
                    //3rd heart
                    | (((x == 19 | x == 20 | x == 22 | x == 23) && y == 2)
                    | ((x >= 18 && x <= 24) && (y == 3 | y == 4))
                    | ((x >= 19 && x <= 23) && y == 5)
                    | ((x >= 20 && x <= 22) && y == 6)
                    | (x == 21 && y == 7)))
                    begin
                       oled <= 16'b11100_000000_01001;
                    end
                    else
                    begin
                        oled <= 16'b11111_101110_11011; //1001111011111111;
                    end
                end
                else if (lives_lost == 1)
                begin
                    if ((((x == 3 | x == 4 | x == 6 | x == 7) && y == 2)
                    | ((x >= 2 && x <= 8) && (y == 3 | y == 4))
                    | ((x >= 3 && x <= 7) && y == 5)
                    | ((x >= 4 && x <= 6) && y == 6)
                    | (x == 5 && y == 7))
                    //2nd heart   
                    | (((x == 11 | x == 12 | x == 14 | x == 15) && y == 2)
                    | ((x >= 10 && x <= 16) && (y == 3 | y == 4))
                    | ((x >= 11 && x <= 15) && y == 5)
                    | ((x >= 12 && x <= 14) && y == 6)
                    | (x == 13 && y == 7))
                    //3rd heart
                    | (((x == 19 | x == 20 | x == 22 | x == 23) && y == 2)
                    | ((x == 18 | x == 21 | x == 24) && y == 3)
                    | ((x == 18 | x == 24) && y == 4)
                    | ((x == 19 | x == 23) && y == 5)
                    | ((x == 20 | x == 22) && y == 6)
                    | (x == 21 && y == 7)))
                    begin
                       oled <= 16'b11100_000000_01001;
                    end
                    else
                    begin
                        oled <= 16'b11111_101110_11011; //1001111011111111;
                    end
                end
                else if (lives_lost == 2)
                begin
                    if ((((x == 3 | x == 4 | x == 6 | x == 7) && y == 2)
                    | ((x >= 2 && x <= 8) && (y == 3 | y == 4))
                    | ((x >= 3 && x <= 7) && y == 5)
                    | ((x >= 4 && x <= 6) && y == 6)
                    | (x == 5 && y == 7))
                    //2nd heart   
                    | (((x == 11 | x == 12 | x == 14 | x == 15) && y == 2)
                    | ((x == 10 | x == 13 | x == 16) && y == 3)
                    | ((x == 10 | x == 16) && y == 4)
                    | ((x == 11 | x == 15) && y == 5)
                    | ((x == 12 | x == 14) && y == 6)
                    | (x == 13 && y == 7))
                    //3rd heart
                    | (((x == 19 | x == 20 | x == 22 | x == 23) && y == 2)
                    | ((x == 18 | x == 21 | x == 24) && y == 3)
                    | ((x == 18 | x == 24) && y == 4)
                    | ((x == 19 | x == 23) && y == 5)
                    | ((x == 20 | x == 22) && y == 6)
                    | (x == 21 && y == 7)))
                    begin
                       oled <= 16'b11100_000000_01001;
                    end
                    else
                    begin
        //                oled <= 16'b00000_000000_00000;
                        oled <= 16'b11111_101110_11011; //1001111011111111;
                    end
                end
                else if (lives_lost == 3)
                begin
                    if ((((x == 3 | x == 4 | x == 6 | x == 7) && y == 2)
                    | ((x == 2 | x == 5 | x == 8) && y == 3)
                    | ((x == 2 | x == 8) && y == 4)
                    | ((x == 3 | x == 7) && y == 5)
                    | ((x == 4 | x == 6) && y == 6)
                    | (x == 5 && y == 7))
                    //2nd heart
                    | (((x == 11 | x == 12 | x == 14 | x == 15) && y == 2)
                    | ((x == 10 | x == 13 | x == 16) && y == 3)
                    | ((x == 10 | x == 16) && y == 4)
                    | ((x == 11 | x == 15) && y == 5)
                    | ((x == 12 | x == 14) && y == 6)
                    | (x == 13 && y == 7))
                    //3rd heart
                    | (((x == 19 | x == 20 | x == 22 | x == 23) && y == 2)
                    | ((x == 18 | x == 21 | x == 24) && y == 3)
                    | ((x == 18 | x == 24) && y == 4)
                    | ((x == 19 | x == 23) && y == 5)
                    | ((x == 20 | x == 22) && y == 6)
                    | (x == 21 && y == 7)))
                    begin
                       oled <= 16'b11100_000000_01001;
                    end
                    else
                    begin
        //                oled <= 16'b00000_000000_00000;
                        oled <= 16'b11111_101110_11011; //1001111011111111;
                    end
                end
            end
            else if (x >= 80 && x <= 82)
            begin
                if (y >= 1 && y <= 5)
                begin
                    oled <= oled_trackb;
                end
                else if (y >= 9 && y <= 13)
                begin
                    oled <= oled_trackm;
                end
                else if (y >= 17 && y <= 21)
                begin
                    oled <= oled_tracke;
                end
                else if (y >= 25 && y <= 29)
                begin
                    oled <= oled_trackw;
                end             
                else
                begin
    //               oled <= 16'b00000_00000_000000;
                    oled <= 16'b11111_101110_11011; //1001111011111111;
                end                    
            end
            else if (x >= 83 && y <= 35)
            begin
                oled <= oled_count;
            end
            else if (time_count <= 350 && start_drop)
            begin
                //display butter
                if (y >= y_butter1 && y <= y_butter1 + 10 && x >= x_butter1 && x <= x_butter1 + 17)
                begin
                    oled <= oled_butter1;
                end  
                else if (y >= y_butter2 && y <= y_butter2 + 10 && x >= x_butter2 && x <= x_butter2 + 17)
                begin
                    oled <= oled_butter2;
                end  
                  // Display eggs
                 else if (y >= y_egg1 && y <= y_egg1 + 10 && x >= x_egg1 && x <= x_egg1 + 10)
                 begin
                     oled <= oled_egg1;
                 end
                 else if (y >= y_egg2 && y <= y_egg2 + 10 && x >= x_egg2 && x <= x_egg2 + 10)
                 begin
                     oled <= oled_egg2;              
                 end
                 // Display wheat
                 else if (y >= y_wheat1 && y <= y_wheat1 + 14 && x >= x_wheat1 && x <= x_wheat1 + 10)
                 begin
                     oled <= oled_wheat1;
                 end
                 else if (y >= y_wheat2 && y <= y_wheat2 + 14 && x >= x_wheat2 && x <= x_wheat2 + 10)
                 begin
                     oled <= oled_wheat2;
                 end
                 else if (y >= y_wheat3 && y <= y_wheat3 + 14 && x >= x_wheat3 && x <= x_wheat3 + 10)
                 begin
                     oled <= oled_wheat3;
                 end
                 // Display milk
                 else if (y >= y_milk1 && y <= y_milk1 + 16 && x >= x_milk1 && x <= x_milk1 + 12)
                 begin
                     oled <= oled_milk1;
                 end
//                 else if (y >= y_milk2 && y <= y_milk2 + 16 && x >= x_milk2 && x <= x_milk2 + 12)
//                 begin
//                     oled <= oled_milk2;
//                 end
                 // Display bomb
                 else if (y >= y_bomb1 && y <= y_bomb1 + 13 && x >= x_bomb1 && x <= x_bomb1 + 10)
                 begin
                     oled <= oled_bomb1;
                 end
                 else if (y >= y_bomb2 && y <= y_bomb2 + 13 && x >= x_bomb2 && x <= x_bomb2 + 10)
                 begin
                     oled <= oled_bomb2;
                 end
                 else if (y >= y_bomb3 && y <= y_bomb3 + 13 && x >= x_bomb3 && x <= x_bomb3 + 10)
                 begin
                     oled <= oled_bomb3;
                 end
                 else
                 begin
    //                oled <= 16'b00000_00000_000000; 
                    oled <= 16'b11111_101110_11011; //1001111011111111;
                 end
             end
             else
             begin
    //            oled <= 16'b00000_00000_000000; 
                    oled <= 16'b11111_101110_11011; //1001111011111111;
             end
        end    
    end
    
endmodule
