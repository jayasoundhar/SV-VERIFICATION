`include "test.sv"
`include "interface.sv"

module tb;
  
  int_f int_tb();
  
  test tes(int_tb);
  
  syncfifo fifo(.clk(int_tb.clk),.rst(int_tb.rst),.en(int_tb.en),.data_in(int_tb.data_in),.full(int_tb.full),.data_out(int_tb.data_out),.empty(int_tb.empty));
  initial begin 
    int_tb.clk = 0;
    int_tb.rst =1;#5;
    int_tb.rst = 0;#128;
    int_tb.rst = 1;
  end
  initial begin
    int_tb.en = 1;#40;
    int_tb.en = 0;
  end
  always #2 int_tb.clk = ~int_tb.clk;
  initial begin
    #100 $finish;
  end
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
