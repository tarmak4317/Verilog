module Processor_Test;
	reg [3:0] portin;
	reg [3:0] instr;
	wire [3:0] portout;
	reg clk;
	initial begin
		clk = 1'b1;
		forever #5 clk = ~clk;
	end
	Control uut(.clk(clk), .portin(portin), .instr(instr), .portout(portout));
	initial begin
		$dumpfile("Processor.vcd");
		$dumpvars(0,uut);
		portin = 4'b0000;instr = 4'b1001;#10;
		portin = 4'b0011;instr = 4'b0110;#10;
		portin = 4'b0000;instr = 4'b0100;#10;
		portin = 4'b0011;instr = 4'b0110;#10;
		portin = 4'b0001;instr = 4'b0100;#10;
		portin = 4'b0000;instr = 4'b0101;#10;
		portin = 4'b0000;instr = 4'b1000;#10;
		portin = 4'b0001;instr = 4'b0101;#10;
		portin = 4'b0000;instr = 4'b0000;#10;
		portin = 4'b0000;instr = 4'b0111;#10;
		#20;
		$stop;
	end
endmodule
