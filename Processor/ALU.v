module ALU(input enable, input [0:1] op, input [0:3] n1, input [0:3] n2, output reg [3:0] out);
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