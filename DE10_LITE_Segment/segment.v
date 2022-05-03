module segment(
	input clk,    //时钟信号25MHz
	input rst_n,  //复位信号，低电平有效
	input[15:0] display_num,  //数码管千位[15:12] , 数码管百位[11:8] , 数码管十位[7:4], 数码管个位[3:0]
	input [3:0] switch,
	output reg[3:0] dseg_led,
	output reg[7:0] HEX0,
	output reg[7:0] HEX1,
	output reg[7:0] HEX2,
	output reg[7:0] HEX3
);
//-----------------------------------------
//数码管显示0~F 对应段选输出
parameter NUM0 = 8'h3f,
		  NUM1 = 8'h06,
		  NUM2 = 8'h5B,
		  NUM3 = 8'h4f,
		  NUM4 = 8'h66,
		  NUM5 = 8'h6D,
		  NUM6 = 8'h7D,
		  NUM7 = 8'h07,
		  NUM8 = 8'h7f,
		  NUM9 = 8'h6f,
		  NUMA = 8'h77,
		  NUMB = 8'h7C,
		  NUMC = 8'h39,
		  NUMD = 8'h5E,
		  NUME = 8'h79,
		  NUMF = 8'h71,
		  NUMT = 8'h80;
// 数码管位选		  
parameter CSN = 4'b1111,
		  CS0 = 4'b1110,
		  CS1 = 4'b1101,
		  CS2 = 4'b1011,
		  CS3 = 4'b0111;
		  

reg [3:0] current_display_num;



always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		current_display_num <= 4'd0;
	else begin
		case(switch)
			4'b1110: begin 
				current_display_num <= display_num[3:0];
				dseg_led <= CS0;
				
			end
			4'b1101: begin 
				current_display_num <= display_num[7:4];
				dseg_led <= CS1;
				
			end
			4'b1011: begin 
				current_display_num <= display_num[11:8];
				dseg_led <= CS2;
				
			end
			4'b0111: begin 
				current_display_num <= display_num[15:12];
				dseg_led <= CS3;
				
			end
			default: dseg_led <= CSN;
		endcase
	end
		
end

//段选数据译码
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		HEX0 <= NUM0;
	    HEX1 <= NUM0;
		HEX2 <= NUM0;
		HEX3 <= NUM0;
	end
	else begin
		case(switch) 
			4'b1110: begin 
				case(current_display_num)
					4'h0: HEX0 <= NUM0;
					4'h1: HEX0 <= NUM1;
					4'h2: HEX0 <= NUM2;
					4'h3: HEX0 <= NUM3;
					4'h4: HEX0 <= NUM4;
					4'h5: HEX0 <= NUM5;
					4'h6: HEX0 <= NUM6;
					4'h7: HEX0 <= NUM7;
					4'h8: HEX0 <= NUM8;
					4'h9: HEX0 <= NUM9;
					4'ha: HEX0 <= NUMA;
					4'hb: HEX0 <= NUMB;
					4'hc: HEX0 <= NUMC;
					4'hd: HEX0 <= NUMD;
					4'he: HEX0 <= NUME;
					4'hf: HEX0 <= NUMF;
					default HEX0 <= NUM0;
				endcase	
			end
			4'b1101: begin 
				case(current_display_num)
					4'h0: HEX1 <= NUM0;
					4'h1: HEX1 <= NUM1;
					4'h2: HEX1 <= NUM2;
					4'h3: HEX1 <= NUM3;
					4'h4: HEX1 <= NUM4;
					4'h5: HEX1 <= NUM5;
					4'h6: HEX1 <= NUM6;
					4'h7: HEX1 <= NUM7;
					4'h8: HEX1 <= NUM8;
					4'h9: HEX1 <= NUM9;
					4'ha: HEX1 <= NUMA;
					4'hb: HEX1 <= NUMB;
					4'hc: HEX1 <= NUMC;
					4'hd: HEX1 <= NUMD;
					4'he: HEX1 <= NUME;
					4'hf: HEX1 <= NUMF;
					default HEX1 <= NUM0;
				endcase	
			end
			4'b1110: begin 
				case(current_display_num)
					4'h0: HEX2 <= NUM0;
					4'h1: HEX2 <= NUM1;
					4'h2: HEX2 <= NUM2;
					4'h3: HEX2 <= NUM3;
					4'h4: HEX2 <= NUM4;
					4'h5: HEX2 <= NUM5;
					4'h6: HEX2 <= NUM6;
					4'h7: HEX2 <= NUM7;
					4'h8: HEX2 <= NUM8;
					4'h9: HEX2 <= NUM9;
					4'ha: HEX2 <= NUMA;
					4'hb: HEX2 <= NUMB;
					4'hc: HEX2 <= NUMC;
					4'hd: HEX2 <= NUMD;
					4'he: HEX2 <= NUME;
					4'hf: HEX2 <= NUMF;
					default HEX2 <= NUM0;
				endcase	
			end
			4'b1110: begin 
				case(current_display_num)
					4'h0: HEX3 <= NUM0;
					4'h1: HEX3 <= NUM1;
					4'h2: HEX3 <= NUM2;
					4'h3: HEX3 <= NUM3;
					4'h4: HEX3 <= NUM4;
					4'h5: HEX3 <= NUM5;
					4'h6: HEX3 <= NUM6;
					4'h7: HEX3 <= NUM7;
					4'h8: HEX3 <= NUM8;
					4'h9: HEX3 <= NUM9;
					4'ha: HEX3 <= NUMA;
					4'hb: HEX3 <= NUMB;
					4'hc: HEX3 <= NUMC;
					4'hd: HEX3 <= NUMD;
					4'he: HEX3 <= NUME;
					4'hf: HEX3 <= NUMF;
					default HEX3 <= NUM0;
				endcase	
			end
		endcase
	end
end		  



endmodule