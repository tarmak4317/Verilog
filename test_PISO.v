module test_PISO;
    reg clk;
    reg [7:0] par_in;
    wire bit;

    // Instantiate the PISO module
    PISO uut(
        .clk(clk),
        .par_in(par_in),
        .bit(bit)
    );

    // Clock generation: toggle the clock every 5 time units
    always begin
        #5 clk = ~clk;  // Clock period = 10 time units
    end

    initial begin
        $dumpfile("PISO.vcd");
        $dumpvars(0,test_PISO);
        // Initialize signals
        clk = 0;
        par_in = 8'b10101010;  // Example parallel input data

        // Test case 1: Shift the parallel input 8 bits serially
        $display("Test case 1: Shifting parallel input 10101010 serially");
        #10;  // Wait for a few clock cycles for initial parallel input load
        
        // Watch the output bit as the parallel input is shifted out
        #10;
        $display("Bit: %b", bit); // Display shifted bit
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $display("Bit: %b", bit);
        #10;
        $finish;  // End the simulation
    end
endmodule
