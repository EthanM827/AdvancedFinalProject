module temperaturedisplay(input [9:0] binary_temperature, output reg [0:6] hex1,hex10,hex100);
	integer decimal_temperature = binary_temperature;
	integer decimal_1,decimal_10,decimal_100;
	
	
	always @ (temperature)begin
		decimal_1 = (decimal_temperature - (decimal_temperature % 100))/100;
		decimal_10 = ((decimal_temperature % 100) - (decimal_temperature % 10))/10;
		decimal_100 = decimal_temperature % 10;
 		
		// something d will do for decimal
	end
endmodule 