module syncfifo
#(parameter FIFO_DEPTH = 8,
parameter DATA_WIDTH = 5)
(input clk,
input rst,
input en,
input [DATA_WIDTH-1:0] data_in,
output reg [DATA_WIDTH-1:0] data_out,
output empty,
output full);


localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);
reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];

reg[FIFO_DEPTH_LOG:0] write_pointer;
reg[FIFO_DEPTH_LOG:0] read_pointer;

always @(posedge clk) begin
  if(rst) begin
	write_pointer <=0;
    read_pointer <= 0;
    foreach(fifo[i]) fifo[i] <= '0;
  end
else if (en && !full) begin
fifo[write_pointer[FIFO_DEPTH_LOG-1:0]] <=data_in;
write_pointer <=write_pointer +1'b1;
end
  else if(!en && !empty) begin
data_out<=fifo[read_pointer[FIFO_DEPTH_LOG-1:0]];
read_pointer<=read_pointer +1'b1;
end
  else data_out <= 5'd0;
end

assign empty =(read_pointer == write_pointer);
assign full=(read_pointer=={~write_pointer[FIFO_DEPTH_LOG],write_pointer[FIFO_DEPTH_LOG-1:0]});
endmodule
