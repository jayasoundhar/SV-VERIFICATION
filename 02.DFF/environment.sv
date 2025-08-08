`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  virtual int_f int_e;
  
  mailbox g2d;
  mailbox m2s;
  event st_gn;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard sb;
  
  function new(virtual int_f int_e);
    this.int_e = int_e;
    g2d = new();
    m2s = new();
    
    gen = new(g2d,st_gn);
    driv = new(int_e,g2d);
    mon = new(int_e,m2s);
    sb = new(m2s,st_gn);
  endfunction
  
  task run();
    fork
      gen.run();
      driv.run();
      mon.run();
      sb.run();
    join
  endtask
endclass
