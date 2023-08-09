module HeatControl (input [9:0] currentTemp, targetTemp, output reg heat);
	always @(*) begin
		if (currentTemp < targetTemp) begin
			heat = 1;
		end else begin
			heat = 0;
		end
	end
endmodule