module Control(input clk, input [3:0]portin, input [3:0]instr, output reg [3:0]portout);
	reg mem_enable;
	reg alu_enable;
	reg transfer_enable;
	reg rw;
	wire [3:0]mem_out;
	wire [3:0]alu_out;
	reg [3:0]Y;
	reg [3:0]Y1;
	Memory m1(.clk(clk), .enable(mem_enable), .rw(rw), .address(portin), .datain(Y), .dataout(mem_out));
	ALU a1(.clk(clk), .enable(alu_enable), .op1(Y), .op2(Y1), .opc(instr), .res(alu_out));
	always @ (posedge clk) begin
		if(mem_enable)
			Y <= mem_out;
		if(alu_enable)
			Y <= alu_out;
		if(transfer_enable)
			Y1 <= Y;
		alu_enable <= 1'b0;
		mem_enable <= 1'b0;
		transfer_enable <= 1'b0;
		case(instr)
			4'b0000: alu_enable <= 1'b1;
			4'b0001: alu_enable <= 1'b1;
			4'b0010: alu_enable <= 1'b1;
			4'b0011: alu_enable <= 1'b1;
			4'b0100: begin
					rw <= 1'b0;
					mem_enable <= 1'b1;
				 end
			4'b0101: begin
					rw <= 1'b1;
					mem_enable <= 1'b1;
				 end
			4'b0110: Y <= portin;
			4'b0111: portout <= Y;
			4'b1000: transfer_enable <= 1'b1;
			4'b1001: begin
				 	mem_enable <= 1'b0;
				 	alu_enable <= 1'b0;
				 	rw <= 1'b0;
				 end
		endcase
	end
endmodule
