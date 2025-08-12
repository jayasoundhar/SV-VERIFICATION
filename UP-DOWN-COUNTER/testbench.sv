`include "test.sv"
`include "interface.sv"

module tb;
  
  int_f int_tb();
  
  test tes(int_tb);
  
  up_down_counter ud(.clk(int_tb.clk),.s(int_tb.s),.out(int_tb.out),.rst(int_tb.rst));
  initial begin 
    int_tb.clk = 1;
    int_tb.rst = 1;
  end
  always #2 int_tb.clk = ~int_tb.clk;
  initial begin  
//     $monitor(int_tb.clk,int_tb.rst,int_tb.s,int_tb.out);
    #200 $finish;
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
