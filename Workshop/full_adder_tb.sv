
module full_adder_tb;

	logic s;
	logic c_out;
	logic c_in;
	logic a;
	logic b;

	full_adder uut(.S(s), .C_OUT(c_out), .A(a), .B(b), .C_IN(c_in));

	initial begin

		for (c_in = 0; c_in < 2; c_in = 1)
		begin
		
			a = 0;
			b = 0;
			#10
			$monitor("a=0x%0h, b=0x%0h, c_in=0x%0h, s=0x%0h, c_out=0x%0h", a, b, c_in, s, c_out);

			a = 1;
			b = 0;
			#10
			$monitor("a=0x%0h, b=0x%0h, c_in=0x%0h, s=0x%0h, c_out=0x%0h", a, b, c_in, s, c_out);

			a = 0;
			b = 1;
			#10
			$monitor("a=0x%0h, b=0x%0h, c_in=0x%0h, s=0x%0h, c_out=0x%0h", a, b, c_in, s, c_out);

			a = 1;
			b = 1;
			#10
			$monitor("a=0x%0h, b=0x%0h, c_in=0x%0h, s=0x%0h, c_out=0x%0h", a, b, c_in, s, c_out);
	
		end

	end

endmodule
