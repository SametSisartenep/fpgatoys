module blink(
	input wire clk,
	output wire led1, led2, led3
);

reg [31:0] cnt;

initial begin
	cnt <= 32'h00000000;
end

always @(posedge clk) begin
	cnt <= cnt + 1;
end

assign led1 = cnt[24];
assign led2 = cnt[23];
assign led3 = cnt[22];

endmodule