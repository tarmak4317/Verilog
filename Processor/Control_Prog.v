module Control_Prog(input clk, input mem_write, input PC_reset, input [3:0]portin, input [3:0]instr, output reg [3:0]portout);
	reg mem_enable;
	reg alu_enable;
	reg transfer_enable;
	reg jmp_enable;
	reg rw;
	wire [3:0]mem_out;
	wire [3:0]alu_out;
	reg [3:0]Y;
	reg [3:0]Y1;
	reg [3:0]PC;
	reg [7:0]PM[15:0];
	Memory m1(.clk(clk), .enable(mem_enable), .rw(rw), .address(PM[PC][3:0]), .datain(Y), .dataout(mem_out));
	ALU a1(.clk(clk), .enable(alu_enable), .op1(Y), .op2(Y1), .opc(PM[PC][7:4]), .res(alu_out));
	always @ (posedge clk) begin
		if(PC_reset) begin
			PC <= 4'b0000;
			jmp_enable <= 1'b0;
		end
	end
	always @ (posedge clk) begin
		if(mem_write & ~PC_reset)
			PM[PC] <= {instr, portin};
	end
	always @ (posedge clk) begin
		if(~mem_write & ~PC_reset) begin
			if(mem_enable)
				Y <= mem_out;
			if(alu_enable)
				Y <= alu_out;
			if(transfer_enable)
				Y1 <= Y;
			alu_enable <= 1'b0;
			mem_enable <= 1'b0;
			transfer_enable <= 1'b0;
			jmp_enable <= 1'b0;
			case(PM[PC][7:4])
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
				4'b0110: Y <= PM[PC][3:0];
				4'b0111: portout <= Y;
				4'b1000: transfer_enable <= 1'b1;
				4'b1001: jmp_enable <= 1'b1;
				4'b1010: begin
					 	mem_enable <= 1'b0;
					 	alu_enable <= 1'b0;
					 	rw <= 1'b0;
					 	PC <= 4'b0000;
					 end
			endcase
		end
	end
	always @ (negedge clk) begin
		if(~PC_reset & ~jmp_enable)
			PC <= PC + 4'b0001;
		else if(jmp_enable)
			PC <= PM[PC][3:0];
	end
endmodule
