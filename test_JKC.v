module test_JKC;
    reg clk;
    wire Q0, Q0n, Q1, Q1n, Q2, Q2n;

    // Clock initialization
    initial begin
        clk = 0;  // Initializing clock
    end

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Instantiating the JKC counter (UUT)
    JKC uut (
        .clk(clk),
        .Q0(Q0), .Q0n(Q0n),
        .Q1(Q1), .Q1n(Q1n),
        .Q2(Q2), .Q2n(Q2n)
    );

    // Simulation setup and waveform generation
    initial begin
        $dumpfile("JKC.vcd");
        $dumpvars(0, test_JKC);
        $monitor("At time:%t, Count: %b%b%b", $time, Q2, Q1, Q0);
        
        // Run the simulation for 500 time units
        #500;
        $finish;  // End simulation after 500 time units
    end
endmodule
