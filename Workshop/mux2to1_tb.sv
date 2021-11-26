
module mux2to1_tb;

	logic sel;
	logic a;
	logic b;
	logic out;

	mux2to1 uut(.SEL(sel), .A(a), .B(b), .OUT(out));

	initial begin

		sel = 0;
		a = 0;
		b = 0;

		#10

		sel = 0;
		a = 1;
		b = 0;

		#10

		sel = 0;
		a = 0;
		b = 1;

		#10

		sel = 0;
		a = 1;
		b = 1;

		#10

		sel = 1;
		a = 0;
		b = 0;

		#10

		sel = 1;
		a = 1;
		b = 0;

		#10

		sel = 1;
		a = 0;
		b = 1;

		#10

		sel = 1;
		a = 1;
		b = 1;
	end

endmodule
