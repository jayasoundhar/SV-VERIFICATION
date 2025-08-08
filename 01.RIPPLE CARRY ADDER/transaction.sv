class transaction;
  rand bit [3:0] a;
  rand bit [3:0] b;
  rand bit cin;
  bit carry;
  bit [3:0] sum;
  
  function void display(string msg);
    $display("inside %s \nA => %b\tB => %b\tC => %b\tSUM => %b\tCARRY => %b",msg,a,b,cin,sum,carry);
  endfunction
endclass
