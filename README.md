# Verilog-FPGA-Design
An FPGA project to explore digital design concepts, including combinational and sequential circuits, implemented in Verilog. The project is built on the Digilent Basys 3 Board and integrates external peripherals such as:
Pmod OLEDrgb (96x64 RGB OLED Display)
Pmod MIC3 (Microphone for audio input processing)
BRAM (Block RAM for image storage)

# Project Overview
This project features a mini-game inspired by Cooking Mama, where players interact with different baking stages using FPGA-controlled hardware and an OLED screen. The game implements real-time interactions and various hardware-driven mini-games, simulating a baking experience.
Features and instructions are provided int the User_Guide.pdf for game reference.

# Gameplay Mechanics
Ingredient Collection: Move a mouse-controlled basket to catch ingredients while avoiding bombs (3 lives system).
Mixing Ingredients: Follow a button sequence, then stir the batter using mouse movement.
Setting Oven Temperature: Adjust the oven temperature by pressing a button at the right moment. Higher levels = faster pointer.
Cake Decoration: Scroll to select frosting & toppings, then confirm. If unchanged, "BETTER THAN MAMA!" appears.

# Hardware Implementation
Implemented in Verilog with modular design practices.
Block RAM (BRAM) used for storing in-game graphics and transitions.
OLED screen used for real-time graphical display.
Custom input processing with buttons, switches, and mouse integration.
State machine logic for game control flow.

# Additional Details
The User_Guide_Report.pdf provides a detailed breakdown of gameplay, FPGA implementation, and hardware interaction.
The game leverages transition animations between levels to improve visual appeal.


# Structure
📁 src/ → Verilog source files
📁 constraints/ → FPGA constraints (e.g., .xdc)
📁 bram_textfiles/ → Textfiles for BRAM initialization
📄 MODS.xpr → Vivado project file
📄 User_Guide_Report.pdf → Project documentation
📄 README.md → This file



