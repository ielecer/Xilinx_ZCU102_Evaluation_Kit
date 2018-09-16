`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2018 03:43:02 PM
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
    output GPIO_LED_0,
    output GPIO_LED_1,
    input PS_REF_CLK,
    input CLK_125_P,
    input CLK_125_N
    );
    wire clk125;
    reg[27:0] counter33 = 28'd0;
    reg[27:0] counter125 = 28'd0;
    parameter DIVISOR33 = 28'd33330000;
    parameter DIVISOR125 = 28'd125000000;
    
    // IBUFGDS: Differential Global Clock Input Buffer
    // 7 Series
    // Xilinx HDL Libraries Guide, version 14.7
    IBUFGDS #(
    .DIFF_TERM("FALSE"), // Differential Termination
    .IBUF_LOW_PWR("TRUE"), // Low power="TRUE", Highest performance="FALSE"
    .IOSTANDARD("DEFAULT") // Specify the input I/O standard
    ) IBUFGDS_inst2 (
    .O(clk125), // Clock buffer output
    .I(CLK_125_P), // Diff_p clock buffer input (connect directly to top-level port)
    .IB(CLK_125_N) // Diff_n clock buffer input (connect directly to top-level port)
    );
    // End of IBUFGDS_inst instantiation
    
    /* always */
    always @(posedge PS_REF_CLK)
    begin
     counter33 <= counter33 + 28'd1;
     if (counter33 >= (DIVISOR33 - 1))
        counter33 <= 28'd0;
    end
    
    always @(posedge clk125)
    begin
     counter125 <= counter125 + 28'd1;
     if (counter125 >= (DIVISOR125 - 1))
        counter125 <= 28'd0;
    end
        
    /* assign */
    assign GPIO_LED_1 = (counter33 < DIVISOR33/2)? 1'b0 : 1'b1;
    assign GPIO_LED_0 = (counter125 < DIVISOR125/2)? 1'b0 : 1'b1;
   
endmodule
