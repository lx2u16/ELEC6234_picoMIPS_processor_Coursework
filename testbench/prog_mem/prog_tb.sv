module prog_tb;

logic [3:0] address;
logic [16:0] I;

prog dut(.*);

initial
begin
      address = 4'b0000;
#10ns address = 4'b0001;
#10ns address = 4'b0010;
#10ns address = 4'b0011;
#10ns address = 4'b0100;
#10ns address = 4'b0101;
#10ns address = 4'b0110;
#10ns address = 4'b0111;
#10ns address = 4'b1000;
#10ns address = 4'b1001;
#10ns address = 4'b1010;
#10ns address = 4'b1011;
#10ns address = 4'b1100;
#10ns address = 4'b1101;
#10ns address = 4'b1110;
#10ns address = 4'b1111;
end
endmodule