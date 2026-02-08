module ALU(input [1:0] sel, input [7:0] a, input [7:0] b, output reg [7:0] c);
	always @ (*) begin
		c = 8'b00000000;
		case(sel)
			2'b00: c = a + b;
			2'b01: c = a - b;
			2'b10: c = a * b;
			2'b11: begin
			   	if(b != 8'b0)
			   		c = a / b;
			   end	
		endcase
	end
endmodule
