module Memory(input clk, input rw, input enable, input [3:0] select, input [7:0] data_in, output reg [7:0] data_out);
	reg [7:0] memory [0:15];
	always @ (posedge clk) begin
		if(enable) begin
			if(rw)
				memory[select] <= datain;
			else
				dataout <= memory[select];
		end
	end
endmodule
