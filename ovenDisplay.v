module ovenDisplay(intput power, current_temp, target_temp, input [12:0] current_time, output [0:6] hex0,hex1,hex2,hex3,hex4,hex5);
	1_hex = 7'b1001111; //1
	2_hex = 7'b0010010; //2
	3_hex = 7'b0000110; //3
	4_hex = 7'b1001100; //4
	5_hex = 7'b0100100; //5
	6_hex = 7'b0100000; //6
	7_hex = 7'b0001111; //7
	8_hex = 7'b0000000; //8
	9_hex = 7'b0000100; //9
	0_hex = 7'b0000001; //0
	
	always@(*)begin
		if(power == 1)begin
			
		end if(power == 0)begin
			hex2 = 7'b0000010;
			minutes = (current_time - seconds) % 60;
			minutes_ones_place = minutes % 10;
			minutes_tens_place = minutes - minutes_tens_place;

			seconds = current_time - (minutes * 60);
			seconds_ones_place = seconds % 10;
			seconds_tens_place = seconds - seconds_ones_place;
		end
	end
	
	always@(minutes_ones_place, minutes_tens_place,seconds_ones_place,seconds_tens_place)begin
		case(minutes_ones_place)
			1: hex3 = 1_hex;
			2: hex3 = 2_hex;
			3: hex3 = 3_hex;
			4: hex3 = 4_hex;
			5: hex3 = 5_hex;
			6: hex3 = 6_hex;
			7: hex3 = 7_hex;
			8: hex3 = 8_hex;
			9: hex3 = 9_hex;
			0: hex3 = 0_hex;
		endcase
		case(minutes_tens_place)
			1: hex4 = 1_hex;
			2: hex4 = 2_hex;
			3: hex4 = 3_hex;
			4: hex4 = 4_hex;
			5: hex4 = 5_hex;
			6: hex4 = 6_hex;
			7: hex4 = 7_hex;
			8: hex4 = 8_hex;
			9: hex4 = 9_hex;
			0: hex4 = 0_hex;
		endcase
		case(seconds_ones_place)
			1: hex0 = 1_hex;
			2: hex0 = 2_hex;
			3: hex0 = 3_hex;
			4: hex0 = 4_hex;
			5: hex0 = 5_hex;
			6: hex0 = 6_hex;
			7: hex0 = 7_hex;
			8: hex0 = 8_hex;
			9: hex0 = 9_hex;
			0: hex0 = 0_hex;
		endcase
		case(seconds_tens_place)
			1: hex1 = 1_hex;
			2: hex1 = 2_hex;
			3: hex1 = 3_hex;
			4: hex1 = 4_hex;
			5: hex1 = 5_hex;
			6: hex1 = 6_hex;
			7: hex1 = 7_hex;
			8: hex1 = 8_hex;
			9: hex1 = 9_hex;
			0: hex1 = 0_hex;
		endcase
	end
endmodule 