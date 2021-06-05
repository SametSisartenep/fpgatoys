module pwm(
	input wire clk,
	output wire led
);

reg[23:0] cnt;
always @(posedge clk) cnt = cnt + 1;

wire[3:0] pwmin = cnt[23] ? cnt[23:19] : ~cnt[23:19];
reg[4:0] pwm;

always @(posedge clk) pwm <= pwm[3:0] + pwmin;

assign led = pwm[4];
endmodule
