module regs #(parameter n = 8) // n - data bus width
(input logic clk, w,// clk and write control
 input logic signed [n-1:0] Wdata,
 input logic [2:0] Raddr1, Raddr2,
 output logic signed [n-1:0] Rdata1, Rdata2);

 	// Declare 8 n-bit registers 
	logic [n-1:0] gpr [7:0];

	
	// write process, dest reg is Raddr2
	always_ff @ (posedge clk)
	begin
		if (w)
            gpr[Raddr2] <= Wdata;
	end

	// read process, output 0 if %0 is selected
	always_comb
	begin
	   if (Raddr1==3'd0)
	         Rdata1 =  {n{1'b0}};
        else  Rdata1 = gpr[Raddr1];
	 
        if (Raddr2==3'd0)
	        Rdata2 =  {n{1'b0}};
	  else  Rdata2 = gpr[Raddr2];
	end	
	

endmodule // module regs