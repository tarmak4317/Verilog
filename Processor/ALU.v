module ALU(input clk, input enable, input [3:0]op1, input [3:0]op2, input [1:0]opc, output reg carry, output reg [3:0]res);
	always @ (negedge clk) begin
		if(enable) begin
			case(opc)
				2'b00: {carry, res} <= op1 + op2;
				2'b01: {carry, res} <= op1 - op2;
				2'b10: begin
			               		res <= op1 * op2;
						carry <= 1'b0;
				       end
				2'b11: begin
						res <= op1 / op2;
						carry <= 1'b0;
				       end
			endcase
		end
	end
endmodule
