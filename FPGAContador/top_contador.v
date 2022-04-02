module top_contador(
input clk_top, rstbutton_top, ena0_in,
input rstClock_divider_top,

output [3:0] Qdata3_top, Qdata2_top, Qdata1_top, Qdata0_top,
output ena3_top, ena2_top, ena1_top, ena0_top,
output rst3_top, rst2_top, rst1_top, rst0_top,

output slow_clock_top,
output seg_clock_top,
output [6:0] seg_data3_top, seg_data2_top, seg_data1_top, seg_data0_top,

output [5:0] seg_sel_top,
output [6:0] seg_data_top 
);

//Divisor de reloj
clock_divider clkDiv(
//inputs
	.fast_clock	(clk_top),
	.rst			(rstClock_divider_top),
//outputs
	.slow_clock	(slow_clock_top),
	.seg_clock	(seg_clock_top)
);

//Controlador
controlador ctr(
//inputs
	.Qdata3		(Qdata3_top),
	.Qdata2		(Qdata2_top),
	.Qdata1		(Qdata1_top),
	.Qdata0		(Qdata0_top),
	
	.ena0in		(ena0_in),
	.rstbutton	(rstbutton_top),

//outputs
	.ena3			(ena3_top),
	.ena2			(ena2_top),
	.ena1			(ena1_top),
	.ena0			(ena0_top),
	
	.rst3			(rst3_top),
	.rst2			(rst2_top),
	.rst1			(rst1_top),
	.rst0			(rst0_top)
);

//Contador 3
contador4bits cont3(
//inputs
	.clk			(slow_clock_top),
	.rst			(rst3_top),
	.ena			(ena3_top),
//outputs
	.Qdata		(Qdata3_top)
);

//Contador 2
contador4bits cont2(
//inputs
	.clk			(slow_clock_top),
	.rst			(rst2_top),
	.ena			(ena2_top),
//outputs
	.Qdata		(Qdata2_top)
);

//Contador 1
contador4bits cont1(
//inputs
	.clk			(slow_clock_top),
	.rst			(rst1_top),
	.ena			(ena1_top),
//outputs
	.Qdata		(Qdata1_top)
);

//Contador 0
contador4bits cont0(
//inputs
	.clk			(slow_clock_top),
	.rst			(rst0_top),
	.ena			(ena0_top),
//outputs
	.Qdata		(Qdata0_top)
);

//Decodificador 7 segmentos contador3
seg_decoder segData3(
//inputs
	.bin_data	(Qdata3_top),
//outputs
	.seg_data	(seg_data3_top)
);

//Decodificador 7 segmentos contador2
seg_decoder segData2(
//inputs
	.bin_data	(Qdata2_top),
//outputs
	.seg_data	(seg_data2_top)
);

//Decodificador 7 segmentos contador1
seg_decoder segData1(
//inputs
	.bin_data	(Qdata1_top),
//outputs
	.seg_data	(seg_data1_top)
);

//Decodificador 7 segmentos contador0
seg_decoder	segData0(
//inputs
	.bin_data	(Qdata0_top),
//outputs
	.seg_data	(seg_data0_top)
);

//scanner para 7 segmentos
seg_scan seg_scan(
//input
	.clk				(seg_clock_top),
	.rst_n			(rstbutton_top),

	.seg_data_0		(seg_data0_top),
	.seg_data_1		(seg_data1_top),
	.seg_data_2		(seg_data2_top),
	.seg_data_3		(seg_data3_top),	
//output	
	.seg_sel			(seg_sel_top),
	.seg_data		(seg_data_top)
);
endmodule
