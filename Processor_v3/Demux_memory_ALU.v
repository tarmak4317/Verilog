module Demux_memory_ALU(input [7:0] data_in, input select, output reg [7:0] out0, out1);
        always @ (*) begin
                out0 = 8'b00000000;
                out1 = 8'b00000000;
                case(select)
                        1'b0: out0 = data_in;
                        1'b1: out1 = data_in;
                endcase
        end
endmodule
