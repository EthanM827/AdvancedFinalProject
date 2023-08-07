module ovenDisplay(input power, current_temp, target_temp, input [12:0] current_time, output reg [0:6] hex0, output reg [0:6] hex1, output reg [0:6] hex2, output reg [0:6] hex3, output reg [0:6] hex4, output reg [0:6] hex5);
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
	
	integer minutes, minutes_ones_place, minutes_tens_place, seconds, seconds_ones_place, seconds_tens_place;
	
	always @ (*) begin
		minutes = (current_time - (current_time % 60)) / 60;
		minutes_ones_place = minutes % 10;
		minutes_tens_place = (minutes - minutes_ones_place) / 10;

		seconds = current_time - (minutes * 60);
		seconds_ones_place = seconds % 10;
		seconds_tens_place = (seconds - seconds_ones_place) / 10;
	end
		
	always@(*)begin
		if (power) begin
			hex0 = hex_blank;
			hex1 = hex_blank;
			hex2 = hex_blank;
			hex3 = hex_blank;
			hex4 = hex_blank;
			hex5 = hex_blank;
		end else begin
			hex5 = hex_blank;
			hex2 = 7'b1111110;
			case(minutes_ones_place)
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
			case(minutes_tens_place)
				1: hex4 = hex_1;
				2: hex4 = hex_2;
				3: hex4 = hex_3;
				4: hex4 = hex_4;
				5: hex4 = hex_5;
				0: hex4 = hex_0;
			endcase
			case(seconds_ones_place)
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
			case(seconds_tens_place)
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