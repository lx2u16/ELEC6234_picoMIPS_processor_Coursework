module reg_tb;

logic clk,w;
logic signed [7:0] Wdata;
logic [2:0] Raddr1, Raddr2;
logic signed [7:0] Rdata1, Rdata2;

regs dut(.*);

initial
begin
clk=0;Wdata=8'b11111111;
forever #5ns clk=~clk;
end

initial
begin
//test %0 reg
Raddr1=5'd0;Raddr2=5'd0;w='0;

//test write data
#10ns Raddr2=5'd1;w='1;
#10ns Raddr2=5'd2;
#10ns Raddr2=5'd3;
#10ns Raddr2=5'd4;
#10ns Raddr2=5'd5;
#10ns Raddr2=5'd6;
#10ns Raddr2=5'd7;

//read data
#10ns Raddr1=5'd1;Raddr2=5'd1;w='0;
#10ns Raddr1=5'd2;Raddr2=5'd2;
#10ns Raddr1=5'd3;Raddr2=5'd3;
#10ns Raddr1=5'd4;Raddr2=5'd4;
#10ns Raddr1=5'd5;Raddr2=5'd5;
#10ns Raddr1=5'd6;Raddr2=5'd6;
#10ns Raddr1=5'd7;Raddr2=5'd7;
end

endmodule