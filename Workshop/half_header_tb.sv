
module half_header_tb;

	logic s;
	logic c;
	logic a;
	logic b;

	half_header uut(.S(s), .C(c), .A(a), .B(b));

	initial begin
	
		a = 0;
		b = 0;
	
		#10

		a = 1;
		b = 0;

		#10

		a = 0;
		b = 1;

		#10

		a = 1;
		b = 1;

	end

endmodule

