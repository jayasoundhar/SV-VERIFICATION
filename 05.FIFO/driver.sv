class driver;
  transaction trans;
  mailbox g2d;
  virtual int_f int_d;
  function new(virtual int_f int_d,mailbox g2d);
    this.g2d = g2d;
    this.int_d = int_d;
  endfunction
  
  task run();
      trans = new();
    forever begin
      g2d.get(trans);
      int_d.data_in = trans.data_in;
      trans.display("driver");
    end
  endtask
  
endclass
