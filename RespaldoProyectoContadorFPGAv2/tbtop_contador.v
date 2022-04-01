`timescale 1ns/1ns
module tbtop_contador();

reg clk_tb, rstbutton_tb, ena0_intb;

wire [3:0] Qdata3_tb, Qdata2_tb, Qdata1_tb, Qdata0_tb;
wire ena3_tb, ena2_tb, ena1_tb, ena0_tb;
wire rst3_tb, rst2_tb, rst1_tb, rst0_tb;

//intanciando el top contador
top_contador tp(
//inputs
	.clk_top			(clk_tb),
	.rstbutton_top	(rstbutton_tb),
	.ena0_in			(ena0_intb),

//outputs
	.Qdata3_top		(Qdata3_tb),
	.Qdata2_top		(Qdata2_tb),
	.Qdata1_top		(Qdata1_tb),
	.Qdata0_top		(Qdata0_tb),

	.ena3_top		(ena3_tb),
	.ena2_top		(ena2_tb),
	.ena1_top		(ena1_tb),
	.ena0_top		(ena0_tb),
	
	.rst3_top		(rst3_tb),
	.rst2_top		(rst2_tb),
	.rst1_top		(rst1_tb),
	.rst0_top		(rst0_tb)
);

initial begin
	clk_tb = 1'b0;
	rstbutton_tb = 1'b0;
	ena0_intb = 1'b1;
	#2 rstbutton_tb = 1'b1;
	#1 rstbutton_tb = 1'b0;
	#19 ena0_intb = 1'b0;
	#10 ena0_intb = 1'b1;
	#50 $stop;
end

always #1 clk_tb = ~clk_tb;

endmodule
