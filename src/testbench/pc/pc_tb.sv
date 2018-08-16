module pc_tb;

logic clk,reset_n,PCincr,SW8;
logic [3:0] PCout;

pc dut(.*);

initial
begin
clk='0;
forever #5ns clk=~clk;
end

initial
begin
      reset_n='1;
#10ns reset_n='0;
#10ns reset_n='1;
end

initial
begin
      PCincr=0; SW8='0;
#10ns PCincr=0; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
#10ns PCincr=1; SW8='0;
#10ns PCincr=1; SW8='1;
end

endmodule