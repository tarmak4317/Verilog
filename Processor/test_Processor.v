module test_Processor;
        reg [7:0] sig;
        wire [3:0] r0;
        wire [3:0] r1;
        wire [3:0] r2;
        wire [3:0] r3;
        wire [3:0] r4;
        Processor uut(.sig(sig),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4));
        initial begin
                $dumpfile("Processor.vcd");
                $dumpvars(0,test_Processor);
                sig = 8'b10010011;#10;
                sig = 8'b10100001;#10;
                sig = 8'b00010000;#10;
                sig = 8'b11001000;#10;
        end
endmodule
