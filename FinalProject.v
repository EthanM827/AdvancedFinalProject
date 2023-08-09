module FinalProject (input clk, pwr, key0, key1, sw5, sw4, sw3, sw2, sw1, sw0, output wire [0:6] hex0, hex1, hex2, hex3, hex4, hex5);
	parameter default_temp = 300;
	parameter max_temp = 500;
	parameter min_temp = 65;
	
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
	
	reg key0_old, key1_old;
	reg key0_edge, key1_edge;
	always @ (posedge clk) begin
		key0_old <= key0;
		key0_edge <= ~(~key0 && key0_old);
		
		key1_old <= key1;
		key1_edge <= ~(~key1 && key1_old);
	end
		
	
	wire [12:0] current_time;
	wire [9:0] current_temp;
	integer target_temp = 300;
	reg tempInputDone, timeInputDone;
	timeclk timeclk(clk, current_time);
	ovenDisplay display(pwr, tempInputDone, timeInputDone, 65, target_temp, current_time, 0, hex0, hex1, hex2, hex3, hex4, hex5);
	
	integer tempChange, timeChange;
	always @ (posedge clk) begin
		if (pwr) begin
			// continue looping to get target temp until both key0 and key1 pressed
			if(~(key0 == 0 && key1 == 0)) begin
				case ({sw5, sw4, sw3, sw2, sw1, sw0})
					5'b00001: tempChange = 5;
					5'b00010: tempChange = 10;
					5'b00100: tempChange = 25;
					5'b01000: tempChange = 50;
					5'b10000: tempChange = 100;
					// only modify value if 1 switch toggled
					default: tempChange = 0;
				endcase
				// increase
				if (~key0_edge && key1_edge) begin
					// if new temp would be higher than minimum oven temp, cap it
					if ((target_temp + tempChange) >= max_temp) begin
						target_temp = max_temp;
					end else begin
						target_temp = target_temp + tempChange;
					end
				end
				// decrease
				if (~key1_edge && key0_edge) begin
					// if new temp would be lower than minimum oven temp, cap it
					if ((target_temp - tempChange) <= min_temp) begin
						target_temp = min_temp;
					end else begin
						target_temp = target_temp - tempChange;
					end
				end
			end else begin
				tempInputDone = 1;
			end
		end else begin
			target_temp = default_temp;
			timeInputDone = 0;
			tempInputDone = 0;
		end
	end

endmodule