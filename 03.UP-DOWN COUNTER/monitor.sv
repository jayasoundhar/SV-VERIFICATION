class monitor;
  transaction trans;
  
  mailbox m2s;
  
  virtual int_f int_m;
  
  function new(virtual int_f int_m,mailbox m2s);
    this.int_m = int_m;
    this.m2s = m2s;
  endfunction
  
  task run();
    trans = new();
    forever begin
      @(posedge int_m.clk);
      #1;
      trans.s = int_m.s;
      trans.out = int_m.out;
      trans.rst = int_m.rst;
      m2s.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
