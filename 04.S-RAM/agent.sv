`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class agent;
  virtual int_f int_a;
  
  mailbox g2d;
  mailbox m2s;
  generation gen;
  driver driv;
  monitor mon;
  function new(virtual int_f int_a,mailbox m2s);
    this.int_a = int_a;
    this.m2s = m2s;
    g2d = new();
    gen = new(g2d);
    driv = new(int_a,g2d);
    mon = new(int_a,m2s);
  endfunction
  
  task run();
    fork
      gen.run();
      driv.run();
      mon.run();
    join
  endtask
endclass
