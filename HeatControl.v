module HeatControl (input [9:0] currentTemp, targetTemp, output reg [1:0] heat);
	always @(*) begin
		if (currentTemp == 65 && currentTemp == targetTemp) begin
			heat = 0;
		end
		if (currentTemp >= (targetTemp + 1)) begin
			heat = -1;
		end else begin
			heat = 2;
		end
	end
endmodule