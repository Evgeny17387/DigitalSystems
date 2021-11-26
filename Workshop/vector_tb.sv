
module vector_tb;

	logic [1:0] a;
	logic [1:0] b;

	vector uut(.B(b), .A(a));

	initial begin
	
		a = {1'b0, 1'b0};
	
		#10

		a = {1'b0, 1'b1};

		#10

		a = {1'b1, 1'b0};

		#10

		a = {1'b1, 1'b1};

	end

endmodule
