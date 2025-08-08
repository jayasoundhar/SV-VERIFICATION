class driver;
  transaction trans;
  mailbox g2d;
  virtual int_f int_d;
  function new(mailbox g2d,virtual int_f int_d);
    this.g2d = g2d;
    this.int_d = int_d;
  endfunction
  task drive();
    repeat(5) begin
      trans = new();
      g2d.get(trans);
      int_d.a = trans.a;
      int_d.b = trans.b;
      int_d.cin = trans.cin;
      trans.display("driver");
    end
  endtask
endclass
