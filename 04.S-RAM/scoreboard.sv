class scoreboard;
  transaction trans;
  mailbox m2s;
  bit [7:0] mem [15:0];
  event st_gn;
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task run();
      trans = new();
    forever begin
      m2s.get(trans);
      trans.display("scoreboard");
      if(trans.rst) begin
        trans.data_out = 8'd0;
        clear();
      end
      else begin
        if(trans.en == 1) mem[trans.addr] = trans.data_in;
      end
      if(trans.en == 0) begin
        if(trans.en == 0 && mem[trans.addr] == trans.data_out) $display("----------------pass--------------");
        else $display("--------------fail--------------",mem[trans.addr]);
      end
      else $display("-------------------pass-----------");
      ->st_gn;
    end
  endtask
  task clear();
      foreach(mem[i]) mem[i] = 8'd0;
  endtask
  
endclass
