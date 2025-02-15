module ALU(input enable, input [1:0] op, input [3:0] n1, input [3:0] n2, output reg [3:0] out);
        always @ (enable) begin
                if (enable) begin
                        case(op)
                                2'b00: out = n1 + n2;
                                2'b01: out = n1 - n2;
                                2'b10: out = n1 * n2;
                                2'b11: out = n1 / n2;
                        endcase
                end
        end
endmodule
