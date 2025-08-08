`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  mailbox g2d;
  mailbox m2s;
  event st_gn;
  virtual int_f int_e;
  
  generator gen;
  driver driv;
  monitor moni;
  scoreboard score;
  
  function new(virtual int_f int_e);
    g2d = new();
    m2s = new();
    this.int_e = int_e;
    gen = new(g2d,st_gn);
    driv = new(g2d,int_e);
    moni = new(m2s,int_e);
    score = new(m2s,st_gn);
    
  endfunction
  
  task run();
    fork
      gen.gent();
      driv.drive();
      moni.monit();
      score.scoreb();
    join
  endtask
endclass
