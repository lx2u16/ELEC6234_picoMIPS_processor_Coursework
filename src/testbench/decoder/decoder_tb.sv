module decoder_tb;

logic [2:0] opcode;
logic PCincr;
logic [1:0] ALUfunc;
logic [1:0] imm;
logic w;

decoder dut(.*);

initial
begin
      opcode=3'b000; //NOP
#10ns opcode=3'b100; //IN
#10ns opcode=3'b001; //ADD
#10ns opcode=3'b110; //MULI
#10ns opcode=3'b101; //ADDI
end
endmodule