module MUX_memory_ALU(input select, input [7:0] data0, input [7:0] data1, output reg [7:0] data_out);
	always @ (*) begin
		data_out = 8'b00000000;
		case(select)
			1'b0: data_out = data0;
			1'b1: data_out = data1;
		endcase
	end
endmodule
