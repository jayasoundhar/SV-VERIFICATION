class monitor;
  transaction trans;
  
  virtual int_f int_m;
  mailbox m2s;
  function new(virtual int_f int_m, mailbox m2s);
    this.m2s = m2s;
    this.int_m = int_m;
  endfunction
  
  task run();
    forever begin
      @(posedge int_m.clk);
      #1;
      trans = new();
      trans.clk = int_m.clk;
      trans.rst = int_m.rst;
      trans.en = int_m.en;
      trans.data_in = int_m.data_in;
      trans.data_out = int_m.data_out;
      trans.full = int_m.full;
      trans.empty = int_m.empty;
      m2s.put(trans);
      trans.display("monitor");
//       $display(int_m.);
    end
  endtask
endclass
