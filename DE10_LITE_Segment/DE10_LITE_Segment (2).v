module DE10_LITE_Segment(
	input Max10_clk_50m,
	input Max10_rst_n,
	output[3:0] dseg_cs_n,
	output[7:0] dseg_data
);

//PLL initiation
wire clk_12m5;
wire clk_25m;
wire clk_50m;
wire clk_100m;
wire sys_rst_n;

pll	pll_inst (
	.areset ( Max10_rst_n),
	.inclk0 ( Max10_clk_50m),
	.c0 ( clk_12m5 ),
	.c1 ( clk_25m ),
	.c2 ( clk_50m ),
	.c3 ( clk_100m),
	.locked ( sys_rst_n )
	);
	
//-----------------------------------------
// 25Mhz clk produce the 16bits data and every second plus 1
wire[15:0] display_num;

counter uut_counter(
	.clk(clk_25m),
	.rst_n(sys_rst_n),
	.display_num(display_num)
	);
	
//---------------------------------------------
// driving 4bits digital segment
segment uut_segment(
	.clk(clk_25m),
	.rst_n(sys_rst_n),
	.display_num(display_num),
	.dseg_cs_n(dseg_cs_n),
	.dseg_data(dseg_data)
);

endmodule
