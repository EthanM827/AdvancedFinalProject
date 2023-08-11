module OvenTimer (input [12:0] currentTime, cookTime, input preheated, timeinputdone, clk, output reg done, output reg [8:0] led);
	integer target_time = 0;
	integer led_state=0;
	integer led_state_digit;
	
	always @ (posedge clk) begin
		if (preheated&&timeinputdone) begin
			led_state = ((target_time - currentTime) * 100)/cookTime;
			if (target_time == 0) begin
				target_time = (currentTime + cookTime) % 3600;
			end
			if (currentTime >= target_time) begin
				done = 1;
				target_time=0;
			end
		end else begin
			done = 0;
			target_time=0;
		end
		
		if((currentTime < target_time) || ~timeinputdone)begin
			led_state_digit = (led_state - (led_state % 10)) / 10;
			
		end else begin
			led_state_digit = 1;
		end
		case(led_state_digit)
			9:begin
				led <= 9'b100000000;
			end
			8:begin
				led <= 9'b110000000;
			end
			7:begin
				led <= 9'b111000000;
			end
			6:begin
				led <= 9'b111100000;
			end
			5:begin
				led <= 9'b111110000;
			end
			4:begin
				led <= 9'b111111000;
			end
			3:begin
				led <= 9'b111111100;
			end
			2:begin
				led <= 9'b111111110;
			end
			1:begin
				led <= 9'b111111111;
			end
			default:begin
				led <= 9'b000000000;
			end
		endcase
	end
endmodule