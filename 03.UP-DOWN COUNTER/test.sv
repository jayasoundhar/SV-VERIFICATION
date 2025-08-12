`include "environment.sv"
program test(int_f int_t);
  environment ev;
  initial begin
    ev = new(int_t);
    ev.run();
  end
endprogram
