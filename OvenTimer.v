module OvenTimer (input [12:0] currentTime, cookTime, input preheated, output reg done);
	reg [12:0] target_time;
	always @ (*) begin
		if (preheated) begin
			if ((target_time == 0) && (cookTime > 0)) begin
				target_time = (currentTime + cookTime) % 512;
			end
			if (currentTime == target_time) begin
				done = 1;
			end
		end
	end
endmodule