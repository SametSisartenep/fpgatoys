module blink(
	input wire clk,
	output wire led
);

reg [31:0] cnt;

initial begin
	cnt <= 32'h00000000;
end

always @(posedge clk) begin
	cnt <= cnt + 1;
end

assign led = cnt[26];

endmodule