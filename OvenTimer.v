module OvenTimer (input [12:0] currentTime, cookTime, input preheated, timeinputdone, clk, output reg done);
	integer target_time = 0;
	
	always @ (posedge clk) begin
		if (preheated&&timeinputdone) begin
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
	end
endmodule