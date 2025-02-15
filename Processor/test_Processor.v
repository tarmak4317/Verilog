module test_Processor;
        reg [0:7] sig;
        Processor uut(.sig(sig));
        initial begin
                $dumpfile("Processor.vcd");
                $dumpvars("0,test_Processor");
                sig = 8'b10010011;#10;
                sig = 8'b10100001;#10;
                sig = 8'b00010000;#10;
                sig = 8'b11001000;#10;
        end
endmodule