module JK(input clk, input [1:0] JK, output reg Q, output wire Qn);
	assign Qn = ~Q;
	initial begin
		Q = 1'b0;
	end
	always @ (posedge clk) begin
		case(JK)
			2'b00: Q <= Q;
			2'b01: Q <= 1'b0;
			2'b10: Q <= 1'b1;
			2'b11: Q <= ~Q;
		endcase
	end
endmodule