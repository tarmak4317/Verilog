module JKC(input clk, output Q0,Q0n,Q1,Q1n,Q2,Q2n);
	wire J0,K0,J1,K1,J2,K2;
	JK FF0(.clk(clk),.JK({J0,K0}),.Q(Q0),.Qn(Q0n));
	JK FF1(.clk(clk),.JK({J1,K1}),.Q(Q1),.Qn(Q1n));
	JK FF2(.clk(clk),.JK({J2,K2}),.Q(Q2),.Qn(Q2n));
	assign J0 = (Q2 & Q0n) | (Q1 & Q0n);
	assign K0 = Q0;
	assign J1 = Q1n & Q0n;
	assign K1 = Q0 | Q1;
	assign J2 = Q1 & Q0n;
	assign K2 = Q2 & Q1;
endmodule