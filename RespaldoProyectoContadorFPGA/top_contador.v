module top_contador(
input clk_top, rstbutton_top, ena0_top,

output [3:0] Qdata3_top, Qdata2_top, Qdata1_top, Qdata0_top,
output ena3_top, ena2_top, ena1_top,
output rst3_top, rst2_top, rst1_top, rst0_top
);

controlador ctr(
//inputs
	.Qdata3		(Qdata3_top),
	.Qdata2		(Qdata2_top),
	.Qdata1		(Qdata1_top),
	.Qdata0		(Qdata0_top),
	
	.rstbutton	(rstbutton_top),

//outputs
	.ena3			(ena3_top),
	.ena2			(ena2_top),
	.ena1			(ena1_top),
	
	.rst3			(rst3_top),
	.rst2			(rst2_top),
	.rst1			(rst1_top),
	.rst0			(rst0_top)
);

//Contador 3
contador4bits cont3(
//inputs
	.clk			(clk_top),
	.rst			(rst3_top),
	.ena			(ena3_top),
//outputs
	.Qdata		(Qdata3_top)
);

//Contador 2
contador4bits cont2(
//inputs
	.clk			(clk_top),
	.rst			(rst2_top),
	.ena			(ena2_top),
//outputs
	.Qdata		(Qdata2_top)
);

//Contador 1
contador4bits cont1(
//inputs
	.clk			(clk_top),
	.rst			(rst1_top),
	.ena			(ena1_top),
//outputs
	.Qdata		(Qdata1_top)
);

//Contador 0
contador4bits cont0(
//inputs
	.clk			(clk_top),
	.rst			(rst0_top),
	.ena			(ena0_top),
//outputs
	.Qdata		(Qdata0_top)
);
endmodule