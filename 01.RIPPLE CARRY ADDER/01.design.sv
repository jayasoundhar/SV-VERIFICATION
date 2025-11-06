//ripple carry adder.....

module full_adder(output sum,cout, input a,b,cin);
  
  assign sum = a^b^cin;
  
  assign cout = a&b | a&cin | cin&b;

endmodule

module ripple_carry_adder(output [3:0]sum,output carry, input [3:0]a,[3:0]b,input cin);
  wire [3:0] co;
  //for(integer i=0;i<4;i++) begin
    
  full_adder f0(sum[0],co[0],a[0],b[0],cin);
  full_adder f1(sum[1],co[1],a[1],b[1],co[0]);
  full_adder f2(sum[2],co[2],a[2],b[2],co[1]);
  full_adder f3(sum[3],co[3],a[3],b[3],co[2]);
  
  assign carry = co[3];
  //end

endmodule
