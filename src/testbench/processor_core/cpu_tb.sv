module cpu_tb;

logic clk;
logic reset_n;
logic signed [7:0] SW;
logic SW8;
logic signed [7:0] outport;

cpu dut (.*);

initial
begin
clk='0;
forever #20ns clk=~clk;
end

initial
begin
      reset_n='1;SW8='0;SW=8'b00000000;
#20ns reset_n='0;
#20ns reset_n='1;
end

//X1=5, Y1=-5, expect X2=20 Y2=-27
initial
begin
#200ns SW=8'b00000101;//5
#100ns SW8='1;
#100ns SW8='0;
#100ns SW=8'b11111011;//-5
#100ns SW8='1;
#100ns SW8='0;
#1000ns SW8='1;
#100ns SW8='0;
end

endmodule
