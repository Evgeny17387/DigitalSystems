
module mux2_2to2_tb;

	logic sel;
	logic [1:0] a;
	logic [1:0] b;
	logic [1:0] out;

	mux2_2to1 uut(.OUT(out), .SEL(sel), .A(a), .B(b));

	initial begin

		sel = 0;
		a = 2'b00;
		b = 2'b00;

		#10

		sel = 0;
		a = 2'b01;
		b = 2'b00;

		#10

		sel = 0;
		a = 2'b10;
		b = 2'b00;

		#10

		sel = 0;
		a = 2'b11;
		b = 2'b00;

	end

endmodule

