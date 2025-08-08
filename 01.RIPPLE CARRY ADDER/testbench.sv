`include "interface.sv"
`include "test.sv"
module tb;
  int_f int_tb();
  test tes(int_tb);
  
  ripple_carry_adder rip(.a(int_tb.a),.b(int_tb.b),.cin(int_tb.cin),.sum(int_tb.sum),.carry(int_tb.carry));

endmodule
