module OvenTimer (input reg [12:0] currentTime, cookTime, input reg preheated, output done);
	reg [12:0] target_time;
	done = 0;
	always @ (*) begin
		if (preheated) begin
			if ((target_time == 0) && (cookTime > 0) begin
				target_time = (currentTime + cookTime) % 512;
			end
			if (currentTime == target_time) begin
				done = 1;
			end
		end
endmodule