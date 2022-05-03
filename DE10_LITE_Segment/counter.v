module counter(
	input clk,
	input rst_n,
	output reg[15:0] display_num
);
//---------------------------------------
//1s定时计数
reg[24:0] cnt;

always @(posedge clk or negedge rst_n ) begin
	if(!rst_n)
		cnt <= 0;
	else if (cnt < 25'd24_999_999)
		cnt <= cnt + 1'b1;
	else
		cnt <= 0;
end
wire time_1s_flag = (cnt == 25'd24_999_999);
//-----------------------------------------
//显示数据每秒递增
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		display_num <= 16'd0;
	else if(time_1s_flag)
		display_num <= display_num + 1'b1;
end

endmodule