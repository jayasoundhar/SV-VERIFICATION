class scoreboard;
  bit [3:0] sum;
  bit carry;
  mailbox m2s;
  transaction trans;
  event st_gn;
  function new(mailbox m2s,event st_gn);
    this.m2s = m2s;
    this.st_gn = st_gn;
  endfunction
  
  task scoreb();
    repeat(5) begin
      trans = new();
      m2s.get(trans);
      trans.display("scoreboard");
      this.sum = trans.a + trans.b + trans.cin;
      $display(trans.carry);
      this.carry = trans.cin;
      for(int i=0;i<4;i++)begin
        carry = (trans.a[i]&trans.b[i])|(carry&(trans.a[i]^trans.b[i]));
      end
      if(this.sum == trans.sum && this.carry == trans.carry) $display("Pass");
      else $display("Fail");
      ->st_gn;
    end
  endtask
  
endclass
