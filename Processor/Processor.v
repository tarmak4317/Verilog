module Processor(input [7:0] sig,output [3:0] r0, output [3:0] r1,output [3:0] r2, output [3:0] r3, output [3:0] r4);
        reg [3:0] registers[0:4];
        initial begin
        	registers[0] = 4'b0000;
        	registers[1] = 4'b0000;
        	registers[2] = 4'b0000;
        	registers[3] = 4'b0000;
        	registers[4] = 4'b0000;
        end
        reg enable;
        assign r0 = registers[0];
        assign r1 = registers[1];
        assign r2 = registers[2];
        assign r3 = registers[3];
        assign r4 = registers[4];
        wire [3:0] alu_out;
        ALU ALU1(.enable(enable),.op(sig[3:2]),.n1(registers[3]),.n2(registers[0]),.out(alu_out));
        always @ (sig) begin
                enable = 1'b0;
                case(sig[1:0])
                        2'b00: registers[0] = registers[sig[3:2]];
                        2'b01: registers[sig[3:2]] = registers[0];
                        2'b10: registers[sig[3:2]] = sig[7:4];
                        2'b11: begin
                              	 registers[3] = registers[0];
                              	 registers[0] = registers[sig[5:4]];
                              	 enable = 1'b1;#10;
                              	 registers[0] = alu_out;
                               end
                endcase
        end
endmodule
