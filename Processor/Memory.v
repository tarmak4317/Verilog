module Memory(input clk, input enable, input rw, input [1:0]address, input [3:0]datain, output reg [3:0]dataout);
	reg [3:0]memory [3:0];
	always @ (negedge clk) begin
		if(enable) begin
			if(rw)
				dataout <= memory[address];
			else
				memory[address] <= datain;
		end
	end
endmodule
