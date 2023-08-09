module ovenDisplay(input power, tempInputDone, timeInputDone, input [9:0] current_temp, input [9:0] target_temp, input [12:0] current_time, input [12:0] target_time, output reg [0:6] hex0, output reg [0:6] hex1, output reg [0:6] hex2, output reg [0:6] hex3, output reg [0:6] hex4, output reg [0:6] hex5);
	reg [6:0] hex_1 = 7'b1001111; //1
	reg [6:0] hex_2 = 7'b0010010; //2
	reg [6:0] hex_3 = 7'b0000110; //3
	reg [6:0] hex_4 = 7'b1001100; //4
	reg [6:0] hex_5 = 7'b0100100; //5
	reg [6:0] hex_6 = 7'b0100000; //6
	reg [6:0] hex_7 = 7'b0001111; //7
	reg [6:0] hex_8 = 7'b0000000; //8
	reg [6:0] hex_9 = 7'b0000100; //9
	reg [6:0] hex_0 = 7'b0000001; //0
	reg [6:0] hex_blank = 7'b1111111;
	
	integer current_time_minutes, current_time_minutes_ones_place, current_time_minutes_tens_place, current_time_seconds, current_time_seconds_ones_place, current_time_seconds_tens_place;
	integer target_time_minutes, target_time_minutes_ones_place, target_time_minutes_tens_place, target_time_seconds, target_time_seconds_ones_place, target_time_seconds_tens_place;
	integer current_temp_ones_place, current_temp_tens_place, current_temp_hundreds_place;
	integer target_temp_ones_place, target_temp_tens_place, target_temp_hundreds_place;
	
	always @ (*) begin
		// current_time values
		current_time_minutes = (current_time - (current_time % 60)) / 60;
		current_time_minutes_ones_place = current_time_minutes % 10;
		current_time_minutes_tens_place = (current_time_minutes - current_time_minutes_ones_place) / 10;

		current_time_seconds = current_time - (current_time_minutes * 60);
		current_time_seconds_ones_place = current_time_seconds % 10;
		current_time_seconds_tens_place = (current_time_seconds - current_time_seconds_ones_place) / 10;
		
		// target_time values
		target_time_minutes = (target_time - (target_time % 60)) / 60;
		target_time_minutes_ones_place = target_time_minutes % 10;
		target_time_minutes_tens_place = (target_time_minutes - target_time_minutes_ones_place) / 10;

		target_time_seconds = target_time - (target_time_minutes * 60);
		target_time_seconds_ones_place = target_time_seconds % 10;
		target_time_seconds_tens_place = (target_time_seconds - target_time_seconds_ones_place) / 10;
		
		// current_temp values
		current_temp_ones_place = current_temp % 10;
		current_temp_tens_place = ((current_temp % 100) - current_temp_ones_place) / 10;
		current_temp_hundreds_place = (current_temp - (current_temp_tens_place * 10) - current_temp_ones_place) / 100;
		
		// target_temp values
		target_temp_ones_place = target_temp % 10;
		target_temp_tens_place = ((target_temp % 100) - target_temp_ones_place) / 10;
		target_temp_hundreds_place = (target_temp - (target_temp_tens_place * 10) - target_temp_ones_place) / 100;
	end
		
	always@(*)begin
		if (power) begin
			if (~tempInputDone) begin
				case (target_temp_ones_place)
					1: hex0 = hex_1;
					2: hex0 = hex_2;
					3: hex0 = hex_3;
					4: hex0 = hex_4;
					5: hex0 = hex_5;
					6: hex0 = hex_6;
					7: hex0 = hex_7;
					8: hex0 = hex_8;
					9: hex0 = hex_9;
					0: hex0 = hex_0;
				endcase
				case (target_temp_tens_place)
					1: hex1 = hex_1;
					2: hex1 = hex_2;
					3: hex1 = hex_3;
					4: hex1 = hex_4;
					5: hex1 = hex_5;
					6: hex1 = hex_6;
					7: hex1 = hex_7;
					8: hex1 = hex_8;
					9: hex1 = hex_9;
					0: hex1 = hex_0;
				endcase
				case (target_temp_hundreds_place)
					1: hex2 = hex_1;
					2: hex2 = hex_2;
					3: hex2 = hex_3;
					4: hex2 = hex_4;
					5: hex2 = hex_5;
					6: hex2 = hex_6;
					7: hex2 = hex_7;
					8: hex2 = hex_8;
					9: hex2 = hex_9;
					0: hex2 = hex_0;
				endcase
					
				hex3 = hex_blank;
				hex4 = hex_blank;
				hex5 = hex_blank;
			end else begin
				if (~timeInputDone) begin
					hex2 = 7'b1111110;
					case (target_time_seconds_ones_place)
						1: hex0 = hex_1;
						2: hex0 = hex_2;
						3: hex0 = hex_3;
						4: hex0 = hex_4;
						5: hex0 = hex_5;
						6: hex0 = hex_6;
						7: hex0 = hex_7;
						8: hex0 = hex_8;
						9: hex0 = hex_9;
						0: hex0 = hex_0;
					endcase
					case (target_time_seconds_tens_place)
						1: hex1 = hex_1;
						2: hex1 = hex_2;
						3: hex1 = hex_3;
						4: hex1 = hex_4;
						5: hex1 = hex_5;
						0: hex1 = hex_0;
					endcase
					case (target_time_minutes_ones_place)
						1: hex3 = hex_1;
						2: hex3 = hex_2;
						3: hex3 = hex_3;
						4: hex3 = hex_4;
						5: hex3 = hex_5;
						6: hex3 = hex_6;
						7: hex3 = hex_7;
						8: hex3 = hex_8;
						9: hex3 = hex_9;
						0: hex3 = hex_0;
					endcase
					case (target_time_minutes_tens_place)
						1: hex4 = hex_1;
						2: hex4 = hex_2;
						3: hex4 = hex_3;
						4: hex4 = hex_4;
						5: hex4 = hex_5;
						0: hex4 = hex_0;
					endcase
				end else begin
				
				end
			end
		end else begin
			hex5 = hex_blank;
			hex2 = 7'b1111110;
			case(current_time_minutes_ones_place)
				1: hex3 = hex_1;
				2: hex3 = hex_2;
				3: hex3 = hex_3;
				4: hex3 = hex_4;
				5: hex3 = hex_5;
				6: hex3 = hex_6;
				7: hex3 = hex_7;
				8: hex3 = hex_8;
				9: hex3 = hex_9;
				0: hex3 = hex_0;
			endcase
			case(current_time_minutes_tens_place)
				1: hex4 = hex_1;
				2: hex4 = hex_2;
				3: hex4 = hex_3;
				4: hex4 = hex_4;
				5: hex4 = hex_5;
				0: hex4 = hex_0;
			endcase
			case(current_time_seconds_ones_place)
				1: hex0 = hex_1;
				2: hex0 = hex_2;
				3: hex0 = hex_3;
				4: hex0 = hex_4;
				5: hex0 = hex_5;
				6: hex0 = hex_6;
				7: hex0 = hex_7;
				8: hex0 = hex_8;
				9: hex0 = hex_9;
				0: hex0 = hex_0;
			endcase
			case(current_time_seconds_tens_place)
				1: hex1 = hex_1;
				2: hex1 = hex_2;
				3: hex1 = hex_3;
				4: hex1 = hex_4;
				5: hex1 = hex_5;
				0: hex1 = hex_0;
			endcase
		end
	end
endmodule 