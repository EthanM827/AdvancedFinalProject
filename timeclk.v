module timeclk(input clk, output reg [12:0] current_time);
	reg [31:0] count = 0;
	parameter max_count = 50000000; //50000000 = 1 sec
	
	always @ (posedge clk) begin
			if(count <= max_count) begin
				count = count + 1;
			end else begin
				count = 0;
				current_time = current_time + 1;
			end
			if(current_time >= 3600)begin
				current_time = 0;
			end
	end
endmodule 