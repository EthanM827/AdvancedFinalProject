module FinalProject (input clk, pwr, key0, key1, sw0, sw1, sw2, sw3, sw4, sw5, output wire [0:6] hex0, hex1, hex2, hex3, hex4, hex5);
	reg new_clk;
	parameter MAX_COUNT = 25000000;
	reg [25:0] count = 0;
	always @ (posedge clk) begin
		if (count <= MAX_COUNT) begin
			count = count + 1;
		end
		else begin
			count = 0;
			new_clk = ~new_clk;
		end
	end
	wire [12:0] current_time;
	timeclk timeclk(clk, current_time);
	ovenDisplay display(pwr, 0, 0, current_time, hex0, hex1, hex2, hex3, hex4, hex5);

endmodule