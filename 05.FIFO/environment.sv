`include "agent.sv"
`include "scoreboard.sv"
class environment;
  virtual int_f int_e;
  
  mailbox m2s;
  agent ag;
  event st_gn;
  
  scoreboard sb;
  
  function new(virtual int_f int_e);
    this.int_e = int_e;
    m2s = new();
    ag = new(int_e,m2s);
    sb = new(m2s);
    ag.gen.st_gn = st_gn;
    sb.st_gn = st_gn;
  endfunction
  
  task run();
    fork
      ag.run();
      sb.run();
    join
  endtask
endclass
