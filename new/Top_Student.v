`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input CLOCK,
    output [7:0] JC,
    input [15:0] sw,
    output [15:0] led,
    inout PS2Clk,
    inout PS2Data, 
    input btnC, btnU, btnD, btnL, btnR,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    //can remove btnC and switches once done integrating
    wire clk_6p25m, clk_25M, clk_0p0625, clk_0p03125, clk_0p015625, clk_1k;
    wire fb;
    wire se_pix;
    wire sa_pix;
    reg [15:0] oled_data; //changed from wire
    wire [12:0] pix_index;
    wire clk_25m;
    wire clk_40;
    wire [11:0] mouse_x;
    wire [11:0] mouse_y;
    wire [3:0] mouse_scroll;
    wire left;
    wire right;
    
    wire [15:0] oled_game1;
    wire completed1;
    reg [3:0] state = 0;
    reg btnC_state = 0;
    
    flexible_clock clk0p0625 (CLOCK, 3124999, clk_0p0625);
    flexible_clock clk0p03125 (CLOCK, 1562499, clk_0p03125);
    flexible_clock clk0p015625 (CLOCK, 781249, clk_0p015625);
    flexible_clock clk25M (CLOCK, 1, clk_25M);
    flexible_clock clk6p25m(CLOCK, 7, clk_6p25m);
    flexible_clock clk1k(CLOCK, 49999, clk_1k);
    flexible_clock clk40(CLOCK, 1249999, clk_40);
    
    
    Oled_Display led_display(.clk(clk_6p25m), .reset(0), .frame_begin(fb), .sending_pixels(se_pix),
      .sample_pixel(sa_pix), .pixel_index(pix_index), .pixel_data(oled_data), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
      .pmoden(JC[7]));
    
    wire [15:0] oled_data_tryagain;
    catch_ingredients game1(.state(state), .completed1(completed1), .CLOCK(CLOCK), .clk_drop(clk_40), .clk_6p25m(clk_6p25m), .oled(oled_game1), .mouse_x(mouse_x), .mouse_y(mouse_y), .pix_index(pix_index), .retry_bram(oled_data_tryagain));
    MouseCtl mouse_ctl(.clk(CLOCK), .ps2_clk(PS2Clk), .ps2_data(PS2Data), .xpos(mouse_x), .ypos(mouse_y), .left(left), .right(right), .zpos(mouse_scroll));
    
    wire [15:0] deco_cake;
    reg start_deco = 0;
    combined_cakes unit_decocake(.clk_1k(clk_1k), .clk_6p25M(clk_6p25m), .clk(CLOCK), .pixel_index(pix_index), 
    .oled_data(deco_cake), .mouse_scroll(mouse_scroll), .left(left), .right(right), .start(start_deco));
  
    // feature 3 - oven temperature
    wire [15:0] oled_data_startscreen, oled_data_startbuttonpressed, oled_data_feature2, oled_data_level2;
    wire [1:0] lives; 
    reg [15:0] x_min, x_max;
    wire [1:0] level_completed, level1_completed, level2_completed, level0_completed, try_again;
    reg [1:0] level1_flag, level2_flag, level3_flag;
    reg [1:0] pointer_clk;
    reg [1:0] speed = 0;
    reg btnC_pressed = 1;
    reg completed3 = 0;
    wire [6:0] seg_3;
    wire [3:0] an_3;


    start_screen framedata (clk_25M, pix_index, oled_data_startscreen);
  
    frame_data_feature3 framedatafeature3 (.pointer_clk(pointer_clk),
                                           .frame_rate(clk_25M), 
                                           .fast_clk(clk_1k), 
                                           .pixel_index(pix_index), 
                                           .oled_data(oled_data_feature2), 
                                           .lives_level(lives), 
                                           .btnC(btnC), 
                                           .x_min(x_min), 
                                           .x_max(x_max), 
                                           .level_completed(level_completed),
                                           .level0_completed(level0_completed),
                                           .level1_completed(level1_completed),
                                           .level2_completed(level2_completed),
                                           .tryagain(try_again) ,
                                           .state(state),
                                           .CLOCK(CLOCK),
                                           .seg(seg_3),
                                           .an(an_3)
                                           );
   
   
   //transition slides
   wire [15:0] transition0_bram, transition1_bram, transition2_bram, cat_start_bram;
   bram_transition0 trans0(.clk(CLOCK), .addr(pix_index), .read_write(0), 
   .clear(0), .data_in(0), .data_out(transition0_bram)); 
   bram_transition1 trans1(.clk(CLOCK), .addr(pix_index), .read_write(0), 
   .clear(0), .data_in(0), .data_out(transition1_bram));
   bram_transition2 trans2(.clk(CLOCK), .addr(pix_index), .read_write(0), 
   .clear(0), .data_in(0), .data_out(transition2_bram));
   bram_cat_start catstart(.clk(CLOCK), .addr(pix_index), .read_write(0), 
   .clear(0), .data_in(0), .data_out(cat_start_bram));
   bram_retry xhuiretry(.clk(CLOCK), .addr(pix_index), .read_write(0), .clear(0), .data_in(0), .data_out(oled_data_tryagain));
   
   
   //feature 2: mixing ingredients
   wire [15:0] game2_display;
   wire complete2;
   wire [6:0] segments;
   wire [3:0] anodes;
   
   memory_game game_two(.clk(CLOCK), .clk_1k(clk_1k), .clk_25m(clk_25m), .clk_6p25m(clk_6p25m), 
                        .sw(sw),
                        .btnU(btnU), 
                        .btnD(btnD), 
                        .btnL(btnL), 
                        .btnR(btnR),
                   //   inout PS2Clk, inout PS2Data,
                        .seg(segments), 
                        .an(anodes), 
                    //  output [7:0] JC, 
                        .led(led),
                       //for combination
                        .pix_index(pix_index),
                        .oled_data(game2_display),
                        .xpos(mouse_x), .ypos(mouse_y),
                        .left(left),
                        .complete2(complete2));
  
    /*tryagain tryagain_screen (.oled_data(oled_data_tryagain),
                              .frame_rate(clk_25M),
                              .pixel_index(pix_index));*/

    //transition counters
    reg tran0_done = 0;
    reg [31:0] tran0_counter = 0;
    reg tran1_done = 0;
    reg [31:0] tran1_counter = 0;
    reg tran2_done = 0;
    reg [31:0] tran2_counter = 0;
    
    always @(posedge CLOCK) begin
//        if (state == 2) begin
//            seg <= segments;
//            an <= anodes;
//          end
      if (state == 4'b0011) begin
      if (level2_completed) begin
          completed3 <= 1;
      end
      else if (level1_completed) begin
          // Third level
          x_min <= 47;
          x_max <= 49;
          speed <= 2;
      end else if (level0_completed) begin
          // second level
          x_min <= 30;
          x_max <= 33;
          speed <= 1;
      end else begin
          // first level
          x_min <= 56;
          x_max <= 60;
          speed <= 0;
      end end end
    
    
      always@ (posedge CLOCK) begin
          case(speed)
              0: begin
                  pointer_clk <= clk_0p0625;
                 end
          
              1: begin
                  pointer_clk <= clk_0p03125;
                 end
          
              2: begin
                  pointer_clk <= clk_0p015625;
                 end
            endcase end

  
    // integration
    always @ (posedge CLOCK)
    begin
        if (btnC)
        begin
            btnC_state <= 1;
        end
        
        if (btnC_state) //start game
        begin
            if (completed3) begin
                seg <= 7'b1111111;
                an <= 4'b1111;
                tran2_counter <= (tran2_counter == 299_999_999) ? tran2_counter : tran2_counter + 1;
                tran2_done <= (tran2_counter == 299_999_999) ? 1 : 0;
                if (!tran2_done)
                    oled_data <= transition2_bram;
                else begin
                    state <= 4'b1000;
                    start_deco <= 1;
                    oled_data <= deco_cake;
                end
            end
            
            else if (complete2) begin
                state <= 4'b0011; //3
                if (state == 4'b0011) begin
                    seg <= seg_3;
                    an <= an_3;
                end
                
                if (level_completed == 0 && lives == 0) begin
                    oled_data <= oled_data_tryagain;
                end else  
                    oled_data <= oled_data_feature2;
            end   
        
            else if (completed1)
                begin
                tran1_counter <= (tran1_counter == 299_999_999) ? tran1_counter : tran1_counter + 1;
                tran1_done <= (tran1_counter == 299_999_999) ? 1 : 0;
                if (!tran1_done)
                    oled_data <= transition1_bram;
                else begin
                    // feature 2
                    state <= 4'b0010;
                    oled_data <= game2_display;
                    an <= anodes;
                    seg <= segments;
                end
            end
            else if (!completed1)
            begin
                an <= 4'b1111;
                seg <= 7'b1111111;
                tran0_counter <= (tran0_counter == 299_999_999) ? tran0_counter : tran0_counter + 1;
                tran0_done <= (tran0_counter == 299_999_999) ? 1 : 0;
                if (!tran0_done)
                    oled_data <= transition0_bram;
//                start_deco <= 0;
                else begin
                    state <= 4'b0001;
                    oled_data <= oled_game1;
                end
            end    
        end
        else if (!btnC_state) //remain at start screen
        begin
            oled_data <= cat_start_bram;
            //oled_data_startscreen; //start screen
        end           
    end
  
endmodule