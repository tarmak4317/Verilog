module ALU(input clk, input enable, input [3:0]op1, input [3:0]op2, input [1:0]opc, output reg [3:0]res);
	always @ (negedge clk) begin
		if(enable) begin
			case(opc)
				2'b00: res <= op1 + op2;
				2'b01: res <= op1 - op2;
				2'b10: res <= op1 * op2;
				2'b11: res <= op1 / op2;
			endcase
		end
	end
endmodule
