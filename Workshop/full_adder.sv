
module full_adder(
	output logic S,
	output logic C_OUT,
	input logic A,
	input logic B,
	input logic C_IN
);
	logic S1;
	logic C1;
	logic C2;

	xor(S1, A, B);
	and(C1, A, B);

	xor(S, S1, C_IN);
	and(C2, C_IN, S1);

	xor(C_OUT, C2, C1);
endmodule

