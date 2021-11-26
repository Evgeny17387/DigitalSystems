
module half_header(
	output logic S,
	output logic C,
	input logic A,
	input logic B	
);

	xor(S, A, B);
	and(C, A, B);

endmodule

