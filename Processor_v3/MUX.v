module MUX(input [2:0] select, input [7:0] data0, input [7:0] data1, input [7:0] data2, input [7:0] data3, input [7:0] data4, input [7:0] data5, input [7:0] data6, input [7:0] data7, output reg [7:0] data_out);
	always @ (*) begin
		data_out = 8'b00000000;
		case(select)
			3'b000: data_out = data0;
			3'b001: data_out = data1;
			3'b010: data_out = data2;
			3'b011: data_out = data3;
			3'b100: data_out = data4;
			3'b101: data_out = data5;
			3'b110: data_out = data6;
			3'b111: data_out = data7;
		endcase
	end
endmodule
