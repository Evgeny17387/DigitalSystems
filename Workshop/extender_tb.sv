
module extender_tb;

	logic [7:0] a;
	logic [7:0] u;
	logic [7:0] s;

	extender uut(.U(u), .S(s), .A(a));

	initial begin

		a = 4'b0001;

		#10

		a = 4'b0010;

		#10

		a = 4'b0100;

		#10

		a = 4'b1000;


	end

endmodule

