class transaction;
  bit clk;
  bit rst;
  bit en,full,empty;
  randc bit [7:0]data_in;
  bit [7:0]data_out;
  constraint in_addr_range{
    if(rst == 0) data_in inside{1,2,3,4,5,6,7,8};
//     if(en)
  }
  
  task display(string msg);
    $display($time,"\tinside %s\nclk => %b\trst => %b\ten => %b\tdata_in => %b\tdata_out => %b\tfull => %b\tempty => %b",msg,clk,rst,en,data_in,data_out,full,empty);
  endtask
endclass
