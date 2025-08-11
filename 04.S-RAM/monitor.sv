class monitor;
  transaction trans;
  
  virtual int_f int_m;
  mailbox m2s;
  function new(virtual int_f int_m, mailbox m2s);
    this.m2s = m2s;
    this.int_m = int_m;
  endfunction
  
  task run();
    trans = new();
    forever begin
      @(negedge int_m.clk);
      trans.clk = int_m.clk;
      trans.rst = int_m.rst;
      trans.en = int_m.en;
      trans.data_in = int_m.data_in;
      trans.addr = int_m.addr;
      trans.data_out = int_m.data_out;
      m2s.put(trans);
      trans.display("monitor");
    end
  endtask
endclass
