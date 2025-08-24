class scoreboard;
  transaction trans;
  mailbox m2s;
  event st_gn;
  bit [3:0] out;
  bit full;
  bit empty;
  logic [4:0] queue[0:8];
  logic [4:0] w_p, r_p;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  function bit is_full();
    return ({~w_p[4],w_p[3:0]}== r_p);
  endfunction
  
  function bit is_empty();
    return (w_p == r_p);
  endfunction
  
  task run();
    forever begin
      m2s.get(trans);
      trans.display("SCOREBOARD");

      if (trans.rst) begin
        out  = 0;
        w_p  = 0;
        r_p  = 0;
      end 
      else begin
        full = is_full();
        empty = is_empty();
        
        if ( trans.en && !full) begin
          queue[w_p[3:0]] = trans.data_in;
          w_p = w_p + 1'b1;
        end
        
        else if (!trans.en && !empty) begin
          out = queue[r_p[3:0]];
          r_p = r_p + 1'b1;
        end
        else out = 5'd0;
      end
            
      full = is_full();
      empty = is_empty();
      
      if ((out == trans.data_out) && (full == trans.full) && (empty == trans.empty))
        $display("PASS");
      else
        $display("FAIL",,,,full,trans.full,,,,empty,trans.empty,,,,out,trans.data_out);
      
      ->st_gn;
    end
  endtask
endclass
