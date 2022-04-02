module controlador(
//inputs
input [3:0] Qdata3, Qdata2, Qdata1, Qdata0,
input rstbutton, ena0in,

//outputs
output wire ena3, ena2, ena1, ena0,
output reg rst3, rst2, rst1, rst0
);

parameter MAX_CYCLE = 4'd9;

parameter MAX_COUNT3 = 4'd9;
parameter MAX_COUNT2 = 4'd6;
parameter MAX_COUNT1 = 4'd7;
parameter MAX_COUNT0 = 4'd5;


assign ena3 = (Qdata2==MAX_CYCLE && Qdata1==MAX_CYCLE && Qdata0==MAX_CYCLE && ena0)? 1'b1 : 1'b0;
assign ena2 = (Qdata1==MAX_CYCLE && Qdata0==MAX_CYCLE && ena0)? 1'b1 : 1'b0;
assign ena1 = (Qdata0==MAX_CYCLE && ena0)? 1'b1 : 1'b0;
assign ena0 = (ena0in)? 1'b0 : 1'b1;

always@(*)
begin
	if(Qdata3==MAX_COUNT3 && Qdata2==MAX_COUNT2 && Qdata1==MAX_COUNT1 && Qdata0==MAX_COUNT0 || !rstbutton)
		begin
			rst3 = 1'b0;
			rst2 = 1'b0;
			rst1 = 1'b0;
			rst0 = 1'b0;
		end
	else
		begin
			rst3 = 1'b1;
			rst2 = 1'b1;
			rst1 = 1'b1;
			rst0 = 1'b1;
		end
	if(ena3)
		begin
			rst2 = 1'b0;
			rst1 = 1'b0;
			rst0 = 1'b0;
		end
	if(ena2)
		begin
			rst1 = 1'b0;
			rst0 = 1'b0;
		end
	if(ena1)
		rst0 = 1'b0;
end
endmodule


