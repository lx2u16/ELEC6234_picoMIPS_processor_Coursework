`include "opcodes.sv"
//---------------------------------------------------------
module decoder
(input logic [2:0] opcode, // top 3 bits of instruction
output logic PCincr, // PC control
output logic [1:0] ALUfunc, // ALU control
output logic [1:0] imm, // imm mux control
output logic w// register file control
  );
   
//------------- code starts here ---------
// instruction decoder
always_comb 
begin
  // set default output signal values for NOP instruction
   PCincr = 1'b1; // PC increments by default
   ALUfunc = opcode[1:0]; 
   imm=2'b00; w=1'b0;
   case(opcode)
     `NOP: ;
	 `IN:  begin
	       w=2'b1;
		   imm = 2'b01;//use data from switches
		   end
     `ADD: begin // register-register
	       w = 1'b1; // write result to dest register
	       imm=2'b00;//use data from regs
	       end
     `ADDI,`MULI: begin // register-immediate
	              w = 1'b1; // write result to dest register
		          imm = 2'b11; //use imm 
	              end 
	default:
	    $error("unimplemented opcode %h",opcode);
   endcase // opcode
  
end // always_comb


endmodule //module decoder --------------------------------