class scoreboard;
  bit [3:0] counter;
  transaction trans;
  event st_gn;
  mailbox m2s;
  
  function new(mailbox m2s,event st_gn);
    this.m2s = m2s;
    this.st_gn = st_gn;
    counter = 0;
  endfunction
  
  task run();
    trans = new();
    forever begin
      m2s.get(trans);
      trans.display("SCOREBOARD");
      if(trans.rst == 1) begin 
        counter = 0;
      end
      else begin
        if(trans.s) counter = counter+1;
        else counter = counter-1;
      end
      if(counter == trans.out) $display("---------------pass---------------");
      else $display("---------------fail---------------");
      ->st_gn;
    end
  endtask
endclass
