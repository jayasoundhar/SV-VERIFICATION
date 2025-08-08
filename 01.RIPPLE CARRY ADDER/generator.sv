class generator;
  transaction trans;
  mailbox g2d;
  event st_gn;
  function new(mailbox g2d,event st_gn);
    this.g2d = g2d;
    this.st_gn = st_gn;
  endfunction
  task gent();
    repeat(5) begin
      trans = new();
      trans.randomize();
      trans.display("generator");
      g2d.put(trans);
      @st_gn;
    end
  endtask
endclass
