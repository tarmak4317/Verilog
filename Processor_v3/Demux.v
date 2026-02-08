module Demux(input [7:0] data_in, input [2:0] select, output reg [7:0] out0, out1, out2, out3, out4, out5, out6, out7);
        always @ (*) begin
                out0 = 8'b00000000;
                out1 = 8'b00000000;
                out2 = 8'b00000000;
                out3 = 8'b00000000;
                out4 = 8'b00000000;
                out5 = 8'b00000000;
                out6 = 8'b00000000;
                out7 = 8'b00000000;
                case(select)
                        3'b000: out0 = data_in;
                        3'b001: out1 = data_in;
                        3'b010: out2 = data_in;
                        3'b011: out3 = data_in;
                        3'b100: out4 = data_in;
                        3'b101: out5 = data_in;
                        3'b110: out6 = data_in;
                        3'b111: out7 = data_in;
                endcase
        end
endmodule
