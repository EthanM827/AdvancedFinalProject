module FinalProject (input clk, power, key0, key1, sw0, sw1, sw2, sw3, sw4, sw5);
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
	reg cookTemp [9:0] = 0;
	
		
		
endmodule