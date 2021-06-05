module vga(
	input wire clk,
	output wire hsync,
	output wire vsync,
	output wire r,
	output wire g,
	output wire b
);

reg[9:0] hcnt;
reg[9:0] vcnt;
reg div;
reg hpulse;
reg vpulse;

wire linedone = hcnt == (800-1);
wire screendone = vcnt == (525-1);

always @(posedge clk)
	div <= div + 1;

always @(posedge div) begin
if(linedone) begin
	hcnt <= 0;
	vcnt <= vcnt + 1;
end
else
	hcnt <= hcnt + 1;
if(screendone)
	vcnt <= 0;
end

always @(posedge div) begin
	hpulse <= hcnt[9:4] == 0;
	vpulse <= vcnt == 0;
end

assign hsync = ~hpulse;
assign vsync = ~vpulse;
assign r = vcnt[3] | hcnt & 1;
assign g = vcnt[3] | hcnt & 1;
assign b = vcnt[3] | hcnt & 1;

endmodule