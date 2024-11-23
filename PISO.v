module PISO(input clk ,input [7:0] par_in, output reg bit);
	reg [7:0] mem = 8'b00000000;
	reg [2:0] count = 3'b000;
	always @ (posedge clk) begin
		if (count == 3'b000) begin
			mem <= par_in;
			count <= 3'b111;
		end else begin
			bit <= mem[0];
			mem <= mem >> 1;
			count <= count - 1;
		end
	end
endmodule