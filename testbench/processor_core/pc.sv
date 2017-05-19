module pc #(parameter Psize = 4) // up to 16 instructions
(input logic clk, reset_n, PCincr, SW8,
 output logic [Psize-1 : 0]PCout
);

logic [3:0] count;
enum {A,X1,B,C,Y1,D,X2,E,Y2} state,next_state;

//Program Counter
always_ff @ ( posedge clk or negedge reset_n)
  if (!reset_n)
     PCout <= {Psize{1'b0}};
  else if (next_state==X1 || state == X1 || next_state==Y1 || state == Y1 || next_state == X2 || (next_state ==Y2 && state != Y2))
     PCout <= PCout + 1'b1; 
  else if (state==Y2 && next_state == A)
     PCout <= {Psize{1'b0}};  
//-----------------------------------------------------------------

//Internal Counter for state machine
always_ff@(posedge clk or negedge reset_n)
if(!reset_n)
count<=0;
else if (state == X2)
count<=count+1'b1;
else if (next_state==B)
count<=0;
//-----------------------------------------------------------------

//Using a state machine to detect the handshaking switch(as a binary sequence)
//And control the value of program counter
always_ff@(posedge clk or negedge reset_n)
if(!reset_n)
state<=A;//when the system is reset, go to the first instruction of the program (NOP)
else
state<=next_state;

always_comb
case(state)
A:  next_state = (SW8)? X1:A;//NOP, when SW8 become 1, jump to IN%1, %0(read X1)
X1: next_state = B; //jump to NOP, no condition            
B:  next_state = (!SW8)? C:B; // stay at NOP, detect SW8 become 0 again
C:  next_state = (SW8)? Y1:C; // when SW8 become 1 again, jump to IN%2, %0(read X2)
Y1: next_state = D;//jump to NOP, no condition
D:  next_state = (!SW8)? X2:D;// when SW8 become 0, jump to MULI %3, %1, 0.75
X2: next_state = (count==4'b1000)?E:X2;// start internal countet, run program to calculate and stop at ADD %3,%0(display X2)
E:  next_state = (SW8)? Y2:E;//when SW8 become 1 again, jump to ADD %5, %0(display Y2)
Y2: next_state = (!SW8)?A:Y2;//when SW8 become 0 again, jump to the first instruction of the program
endcase
//----------------------------------------------------------------
	 
endmodule