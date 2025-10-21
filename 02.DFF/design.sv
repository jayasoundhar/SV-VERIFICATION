module up_down_counter(
  input  clk,
  input  rst,    
  input  s,
  output reg [3:0]  out
);

  always_ff @(posedge clk) begin
    if (rst)
      out <= '0;
    else if (s)
      out <= out + 1;
    else
      out <= out - 1;
  end

endmodule
