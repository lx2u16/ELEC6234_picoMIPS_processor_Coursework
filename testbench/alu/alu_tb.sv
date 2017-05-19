module alu_tb;

logic signed [7:0] a,b,result;
logic [1:0] func;

alu dut(.*);

initial
begin
      func =2'b10;//MUL
      a=8'b01100000;//0.75
	  b=8'b00000101;//5
#10ns a=8'b01000000;//0.5
      b=8'b11111011;//-5
#10ns a=8'b11000000;//-0.5
      b=8'b00000101;//5
#10ns a=8'b01100000;//0.75
      b=8'b11111011;//-5
#10ns func=3'b01;//ADD
      a=8'b00000011;//3
      b=8'b00010100;//20
#10ns a=8'b11111110;//-2 
      b=8'b00010100;//20
#10ns a=8'b11111110;//-2
	  b=8'b11101100;//-20
#10ns a=8'b11111101;//-3
	  b=8'b11101100;//-20
#10ns func=2'b00;//RB	 
      a=8'b11111110;//-2 
      b=8'b00010100;//20
#10ns a=8'b11111110;//-2
	  b=8'b11101100;//-20
#10ns a=8'b11111101;//-3
	  b=8'b11101100;//-20 
      
end

endmodule