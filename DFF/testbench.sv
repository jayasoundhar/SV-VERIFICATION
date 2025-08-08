`include "test.sv"
`include "interface.sv"

module tb;
  
  int_f int_tb();
  
  test tes(int_tb);
  
  d_ff ff(.clk(int_tb.clk),.d(int_tb.d),.q(int_tb.q),.qb(int_tb.qb),.rst(int_tb.rst));
  initial begin 
    int_tb.clk = 0;
    int_tb.d = 1;
  end
  always #2 int_tb.clk = ~int_tb.clk;
  initial begin  
//     $monitor(int_tb.clk,int_tb.rst,int_tb.d,int_tb.q,int_tb.qb);
    #200 $finish;
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
