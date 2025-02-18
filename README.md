# Verilog-FPGA-Design
An FPGA project to explore digital design concepts, including combinational and sequential circuits, implemented in Verilog.  
The project is built on the **Digilent Basys 3 Board** and integrates:
- **Pmod OLEDrgb** (96×64 RGB OLED Display)
- **Pmod MIC3** (Microphone for audio input processing)
- **BRAM** (Block RAM for image storage)

## Project Overview
This project features a **mini-game inspired by Cooking Mama**, where players interact with different baking stages using FPGA-controlled hardware and an OLED screen.  
The game implements **real-time interactions** and **hardware-driven mini-games**, simulating a baking experience.  

📄 Features and instructions are provided in **User_Guide_Report.pdf** for reference.

## Gameplay Mechanics
- Ingredient Collection: Move a **mouse-controlled basket** to collect ingredients while avoiding bombs (3 lives system).
- Mixing Ingredients: Follow a **button sequence**, then stir the batter using **mouse movement**.
- Setting Oven Temperature: Press a button to **stop the pointer in the correct range**. Higher levels = faster speed.
- Cake Decoratio*: **Scroll mouse to choose** frosting & toppings, then confirm. "BETTER THAN MAMA!" appears if unchanged.

## Hardware Implementation
- **Verilog-based** modular design.
- **Block RAM (BRAM)** for image storage.
- **OLED screen** for real-time graphical display.
- Custom input processing with buttons, switches, and mouse integration.
- **State machine logic** for game control flow.

## Additional Details
- The [User_Guide_Report.pdf](https://github.com/xiaohan28/Verilog-FPGA-Design/blob/main/User_Guide_Report.pdf) provides a detailed breakdown of **gameplay, FPGA implementation, and hardware interaction**.

## Structure
```bash
Verilog-FPGA-Design/
│── src/               # Verilog source files
│── constraints/       # FPGA constraints (.xdc)
│── bram_textfiles/    # Text files for BRAM initialization
│── MODS.xpr           # Vivado project file
│── User_Guide_Report.pdf  # Project documentation
│── README.md          # This file
