`include "environment.sv"
// class test;
//   environment env;
//   function new(virtual int_f int_t);
    
//     env = new(int_t);    
//   endfunction
//   task run();
//     env.run();
//   endtask
  
// endclass
program test(int_f int_t);
  environment env;
  initial begin
    env = new(int_t);
    env.run();
  end
endprogram
