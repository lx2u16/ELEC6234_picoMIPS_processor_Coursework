// synthesise to run on Altera DE0 for testing and demo
module picoMIPS4test(
  input logic fastclk,  // 50MHz Altera DE0 clock
  input logic signed [9:0] SW, // Switches SW0..SW9
  output logic signed [7:0] LED); // LEDs
  
  logic clk; // slow clock, about 10Hz
  
  counter c (.fastclk(fastclk),.clk(clk)); // slow clk from counter
  
  // to obtain the cost figure, synthesise your design without the counter 
  // and the picoMIPS4test module using Cyclone IV E as target
  // and make a note of the synthesis statistics
  cpu picoMIPS (.clk(clk), 
                .reset_n(SW[9]),
				.SW8(SW[8]),
				.SW(SW[7:0]),
				.outport(LED));
  
endmodule