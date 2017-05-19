`include "alucodes.sv" 
module alu #(parameter n =8) (
   input logic signed [n-1:0] a, b, // ALU operands
   input logic [1:0] func, // ALU function code
   output logic signed [n-1:0] result // ALU result
);       
//------------- code starts here ---------

// create an n-bit adder 
// and then build the ALU around the adder
logic[n-1:0] ar; // temp signals

always_comb
begin
   ar = a+b; // n-bit adder
end // always_comb

//Multipler
logic [15:0] m;
always_comb
begin
if(func==`RMUL)
m = a*b;
else
m = '0;
end

// create the ALU, use signal ar in arithmetic operations
always_comb
begin
  //default output values; prevent latches
  result = '0; // default
  case(func)
     `RB:   result = b;
     `RADD: begin
	        result = ar; // arithmetic addition
		    end  
     `RMUL: begin
	        result =m[14:7];
			end
  endcase
 
 end //always_comb

endmodule //end of module ALU