module contador4bits(
input clk, rst, ena,
output reg [3:0] Qdata
);


always@(posedge clk)
begin
	if(!rst)
		Qdata <= 4'd0;
	else
		begin
			if(ena)
				Qdata <= Qdata + 1'b1;
			else
				Qdata <= Qdata;
		end
end
endmodule
