class transaction;
  rand bit d;
  rand bit rst;
//   rand clk;
  constraint rst_range{
    				  rst dist{0:=70,1:=30};
    				  d dist{0:=30,1:=70};}
  bit q,qb;
  
  task display(string msg);
    $display($time,"\tinside %s\nrst => %b\tD => %b\tQ => %b\t~Q => %b",msg,rst,d,q,qb);
  endtask
endclass
