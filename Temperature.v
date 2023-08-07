module Temperature (input reg [9:0] targetTemp, input reg [1:0] heat, output wire [9:0] currentTemp, output wire preheated);
	currentTemp = 65;
	always @ (*) begin
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