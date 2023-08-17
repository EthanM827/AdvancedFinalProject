module Temperature (input [9:0] targetTemp, input heat, input tempInputDone, input clk, output reg [9:0] currentTemp, output reg preheated);
	always @ (posedge clk) begin
		if (currentTemp < 65) begin
			currentTemp = 65;
		end
		if (tempInputDone) begin
			if (heat) begin
				currentTemp = currentTemp + 2;
			end else begin
				if ((currentTemp - 1) <= 65) begin
					currentTemp = 65;
				end else begin
					currentTemp = currentTemp - 1;
				end
			end
			if ((currentTemp >= targetTemp - 2) && (currentTemp <= targetTemp + 2)) begin
				preheated = 1;
			end else begin
				preheated = 0;
			end
		end else begin
			preheated = 0;
		end
	end
endmodule