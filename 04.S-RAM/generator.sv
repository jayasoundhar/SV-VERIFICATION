class generation;
  transaction trans;
  mailbox g2d;
  event st_gn,st_dr;
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task run();
      trans = new();
    forever begin
      trans.randomize();
      g2d.put(trans);
      trans.display("generator");
      @st_gn;
    end
  endtask
endclass
