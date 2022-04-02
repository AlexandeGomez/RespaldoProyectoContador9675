module clock_divider(
input fast_clock,
input rst,

output slow_clock
);

parameter COUNTER_SIZE = 1;
parameter COUNTER_MAX = (2**COUNTER_SIZE)-1;

reg [COUNTER_SIZE-1:0] count;

always@(posedge fast_clock or negedge rst)
begin
	if(!rst)
		count <= 0;
	else
		begin
			if(count==COUNTER_MAX)
				count <= 0;
			else
				count <= count + 1'b1;
		end
end

assign slow_clock = count[COUNTER_SIZE-1];

endmodule
