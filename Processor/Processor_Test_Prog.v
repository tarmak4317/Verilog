module Processor_Test_Prog;
	reg [3:0] portin;
	reg [3:0] instr;
	reg mem_write;
	reg PC_reset;
	wire [3:0] portout;
	reg clk;
	initial begin
		clk = 1'b1;
		forever #5 clk = ~clk;
	end
	Control_Prog uut(.clk(clk), .mem_write(mem_write), .PC_reset(PC_reset), .portin(portin), .instr(instr), .portout(portout));
	initial begin
		$dumpfile("Processor.vcd");
		$dumpvars(0,uut);
		PC_reset = 1'b1;#10;
		PC_reset = 1'b0;
		mem_write = 1'b1;portin = 4'b0011;instr = 4'b0110;#10;
		mem_write = 1'b1;portin = 4'b0000;instr = 4'b0100;#10;
		mem_write = 1'b1;portin = 4'b0011;instr = 4'b0110;#10;
		mem_write = 1'b1;portin = 4'b0001;instr = 4'b0100;#10;
		mem_write = 1'b1;portin = 4'b0000;instr = 4'b0101;#10;
		mem_write = 1'b1;portin = 4'b0000;instr = 4'b1000;#10;
		mem_write = 1'b1;portin = 4'b0001;instr = 4'b0101;#10;
		mem_write = 1'b1;portin = 4'b0000;instr = 4'b0000;#10;
		mem_write = 1'b1;portin = 4'b0000;instr = 4'b0111;#10;
		mem_write = 1'b1;portin = 4'b1001;instr = 4'b1001;#10;
		PC_reset = 1'b1;mem_write = 1'b0;#10;
		PC_reset = 1'b0;
		#200;
		$stop;
	end
endmodule
