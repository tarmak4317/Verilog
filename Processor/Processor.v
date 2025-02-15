module Processor(input [0:7] sig);
        reg [4:0] registers[0:3];
        reg enable;
        ALU ALU1(.enable(enable),.op(sig[2:3]),.n1(registers[3]),.n2(registers[0]),.out(registers[0]));
        always @ (sig) begin
                enable = 1'b0;
                case(sig[0:1])
                        2'b00: registers[0] = registers[sig[2:3]];
                        2'b01: registers[sig[2:3]] = registers[0];
                        2'b10: registers[sig[2:3]] = sig[4:7];
                        2'b11: registers[3] = registers[0];
                               registers[0] = registers[sig[4:5]];
                               enable = 1'b1;
                endcase
        end
endmodule