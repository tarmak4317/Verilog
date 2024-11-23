`timescale 1ns / 1ps
module test_half_adder;
reg a;
reg b;
wire sum;
wire carry;
half_adder uutman( .a(a), .b(b), .sum(sum), .carry(carry) );
initial begin
$monitor("When time = %t , a = %b, b = %b => sum = %b, carry = %b", $time, a, b, sum, carry);
a = 0; b = 0; #10;
a = 0; b = 1; #10;
a = 1; b = 0; #10;
a = 1; b = 1; #10;
$finish;
end
endmodule