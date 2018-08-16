`include "alucodes.sv"
module cpu #( parameter n = 8) // data bus width
(input logic clk,  
 input logic reset_n, // master reset_n
 input logic signed [7:0] SW,
 input logic SW8,
 output logic signed [n-1:0] outport // need an output port, tentatively this will be the ALU output
);       

// declarations of local signals that connect CPU modules
// ALU
logic [1:0] ALUfunc; // ALU function
logic [1:0] imm; // immediate operand signal
logic [n-1:0] Alub; // output from imm MUX
//
// registers
logic [n-1:0] Rdata1, Rdata2, Wdata; // Register data
logic w; // register write control
//
// Program Counter 
parameter Psize = 4; // up to 16 instructions
logic PCincr; // program counter control
logic [Psize-1:0]ProgAddress;

// Program Memory
parameter Isize = n+9; // Isize - instruction width
logic [Isize-1:0] I; // I - instruction code

//------------- code starts here ---------
// module instantiations
pc  #(.Psize(Psize)) 
    progCounter (.clk(clk),
                 .reset_n(reset_n),
				 .SW8(SW8),
                 .PCincr(PCincr),
                 .PCout(ProgAddress) );

prog #(.Psize(Psize),.Isize(Isize)) 
     progMemory (.address(ProgAddress),
	             .I(I));

decoder  D (.opcode(I[16:14]),
            .PCincr(PCincr),
		    .ALUfunc(ALUfunc),
			.imm(imm),
			.w(w));

regs   #(.n(n))  
       gpr(.clk(clk),
	   .w(w),
       .Wdata(Wdata),
	   .Raddr2(I[13:11]),  // reg %d number
	   .Raddr1(I[10:8]), // reg %s number
       .Rdata1(Rdata1),
	   .Rdata2(Rdata2));

alu    #(.n(n))  
       iu(.a(Rdata1),
	      .b(Alub),
          .func(ALUfunc),
          .result(Wdata)); // ALU result -> destination reg

// create MUX for immediate operand
always_comb
begin
Alub = Rdata2;
case(imm)
2'b00: Alub = Rdata2;
2'b01: Alub = SW;
2'b10: ;
2'b11: Alub = I[n-1:0];
default:Alub = Rdata2;
endcase
end

// connect ALU result to outport
assign outport = Wdata;

endmodule