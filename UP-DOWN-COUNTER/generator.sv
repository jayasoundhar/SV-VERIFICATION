class generator;
  transaction trans;
  mailbox g2d;
  event st_gn;
  function new(mailbox g2d,event st_gn);
    this.g2d = g2d;
    this.st_gn = st_gn;
  endfunction
  
  task run();
    trans = new();
    forever begin
      trans.randomize();
      g2d.put(trans);
      trans.display("GENERATOR");
      @st_gn;
    end
  endtask
endclass
