class transaction;
  bit [3:0] out;
  rand bit rst;
  rand bit s;
  constraint rst_range{
    rst dist{1:=50,0:=50};
    s dist{1:=50,0:=50};
  }
  
  function void display(string msg);
    $display($time,"INSIDE:- %s\nRST => %b\tS => %b\tOUT => %b",msg,rst,s,out);
  endfunction
endclass
