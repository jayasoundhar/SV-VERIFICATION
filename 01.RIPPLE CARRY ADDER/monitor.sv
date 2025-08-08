class monitor;
  virtual int_f int_m;
  mailbox m2s;
  transaction trans;
  function new(mailbox m2s,virtual int_f int_m);
    this.int_m = int_m;
    this.m2s = m2s;
  endfunction
  task monit();
    repeat(5) begin
      trans = new();
      #1;
      trans.a = int_m.a;
      trans.b = int_m.b;
      trans.cin = int_m.cin;
      trans.sum = int_m.sum;
      trans.carry = int_m.carry;
      m2s.put(trans);
      trans.display("Monitor");
    end
  endtask
endclass
