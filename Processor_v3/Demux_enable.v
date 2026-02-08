module Demux_enable(input enable, input [2:0] select, output reg out0, out1, out2, out3, out4, out5, out6, out7);
        always @ (*) begin
                out0 = 1'b0;
                out1 = 1'b0;
                out2 = 1'b0;
                out3 = 1'b0;
                out4 = 1'b0;
                out5 = 1'b0;
                out6 = 1'b0;
                out7 = 1'b0;
                case(select)
                        3'b000: out0 = enable;
                        3'b001: out1 = enable;
                        3'b010: out2 = enable;
                        3'b011: out3 = enable;
                        3'b100: out4 = enable;
                        3'b101: out5 = enable;
                        3'b110: out6 = enable;
                        3'b111: out7 = enable;
                endcase
        end
endmodule
