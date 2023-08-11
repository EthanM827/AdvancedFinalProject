module OvenTimer (input [12:0] currentTime, cookTime, input preheated, timeinputdone, output reg done);
	reg [12:0] target_time;
	always @ (*) begin
		if (preheated&&timeinputdone) begin
			if (target_time == 0) begin
				target_time = (currentTime + cookTime) % 3600;
			end
			if (currentTime == target_time) begin
				done = 1;
			end
		end
	end
endmodule