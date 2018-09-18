`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2018 04:21:16 PM
// Design Name: 
// Module Name: runLed
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


module runLed(
    input CLK_125_P,
    input CLK_125_N,
    input CLK_74_25_P,
    input CLK_74_25_N,
    input USER_SI570_P,
    input USER_SI570_N,
    input GPIO_DIP_SW7,
    output GPIO_LED_0,
    output GPIO_LED_1,
    output GPIO_LED_2,
    output GPIO_LED_7
    );
    
    wire clk125;
    wire clk74;
    wire clk300;
    reg[27:0] counter125 = 28'd0;
    reg[27:0] counter74 = 28'd0;
    reg[28:0] counter300 = 29'd0;
    parameter DIVISOR125 = 28'd125000000;
    parameter DIVISOR74 = 28'd74250000;
    parameter DIVISOR300 = 29'd300000000;
        
    // IBUFGDS: Differential Global Clock Input Buffer
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    IBUFGDS #(
    .DIFF_TERM("FALSE"), // Differential Termination
    .IBUF_LOW_PWR("TRUE"), // Low power="TRUE", Highest performance="FALSE"
    .IOSTANDARD("DEFAULT") // Specify the input I/O standard
    ) IBUFGDS_inst1 (
    .O(clk125), // Clock buffer output
    .I(CLK_125_P), // Diff_p clock buffer input (connect directly to top-level port)
    .IB(CLK_125_N) // Diff_n clock buffer input (connect directly to top-level port)
    );
    // End of IBUFGDS_inst instantiation
    
    // IBUFGDS: Differential Global Clock Input Buffer
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    IBUFGDS #(
    .DIFF_TERM("FALSE"), // Differential Termination
    .IBUF_LOW_PWR("TRUE"), // Low power="TRUE", Highest performance="FALSE"
    .IOSTANDARD("DEFAULT") // Specify the input I/O standard
    ) IBUFGDS_inst2 (
    .O(clk74), // Clock buffer output
    .I(CLK_74_25_P), // Diff_p clock buffer input (connect directly to top-level port)
    .IB(CLK_74_25_N) // Diff_n clock buffer input (connect directly to top-level port)
    );
    // End of IBUFGDS_inst instantiation
    
    // IBUFGDS: Differential Global Clock Input Buffer
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    IBUFGDS #(
    .DIFF_TERM("FALSE"), // Differential Termination
    .IBUF_LOW_PWR("TRUE"), // Low power="TRUE", Highest performance="FALSE"
    .IOSTANDARD("DEFAULT") // Specify the input I/O standard
    ) IBUFGDS_inst3 (
    .O(clk300), // Clock buffer output
    .I(USER_SI570_P), // Diff_p clock buffer input (connect directly to top-level port)
    .IB(USER_SI570_N) // Diff_n clock buffer input (connect directly to top-level port)
    );
    // End of IBUFGDS_inst instantiation
    
    always @(posedge clk125)
    begin
     counter125 <= counter125 + 28'd1;
     if (counter125 >= (DIVISOR125 - 1))
        counter125 <= 28'd0;
    end
    
    /* always */
    always @(posedge clk74)
    begin
     counter74 <= counter74 + 28'd1;
     if (counter74 >= (DIVISOR74 - 1))
        counter74 <= 28'd0;
    end
    
    /* always */
    always @(posedge clk300)
    begin
     counter300 <= counter300 + 28'd1;
     if (counter300 >= (DIVISOR300 - 1))
        counter300 <= 29'd0;
    end
        
    /* assign */
    assign GPIO_LED_0 = (counter125 < DIVISOR125/2)? 1'b0 : 1'b1;
    assign GPIO_LED_1 = (counter74 < DIVISOR74/2)? 1'b0 : 1'b1;
    assign GPIO_LED_2 = (counter300 < DIVISOR300/2)? 1'b0 : 1'b1;
    assign GPIO_LED_7 = GPIO_DIP_SW7;
        
endmodule
