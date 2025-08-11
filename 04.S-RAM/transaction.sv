class transaction;
  bit clk;
  bit rst;
  bit en;
  randc bit [7:0]data_in;
  randc bit [3:0]addr;
  bit [7:0]data_out;
  constraint in_addr_range{
    if(rst == 0) data_in inside{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
    if(rst == 0) addr inside{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
  }
  
  task display(string msg);
    $display($time,"\tinside %s\nclk => %b\trst => %b\ten => %b\tdata_in => %b\taddr => %b\tdata_out => %b",msg,clk,rst,en,data_in,addr,data_out);
  endtask
endclass
