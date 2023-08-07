module Temperature (input [9:0] targetTemp, input [1:0] heat, output reg [9:0] currentTemp, output reg preheated);
	integer nextTemp = 0;
	always @ (*) begin
		if (currentTemp < 65) begin
			currentTemp = 65;
		end
		nextTemp = currentTemp + heat;
		if (nextTemp > 511) begin
			nextTemp = 511;
		end
		currentTemp = nextTemp;
		if ((currentTemp >= targetTemp - 2) && (currentTemp <= targetTemp + 2)) begin
			preheated = 1;
		end else begin
			preheated = 0;
		end
	end
endmodule