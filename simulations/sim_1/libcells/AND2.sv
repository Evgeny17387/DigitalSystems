module AND2 (
    input logic a,
    input logic b,
    output logic z
);

	parameter B = 0;
	parameter C = 0;
	parameter D = 0;
	parameter E = 0;

	// parameter B = 10;
	// parameter C = 9;
	// parameter D = 5;
	// parameter E = 1;

	logic w_a_not;
	logic w_b_not;

	logic w_xor_1;

	NOT #(B, C) not_a(.A(a), .Z(w_a_not));
	NOT #(B, C) not_b(.A(b), .Z(w_b_not));

    OR2 #(D, E) xor_1(.A(w_a_not), .B(w_b_not), .Z(w_xor_1));

	NOT #(B, C) not_xor_1(.A(w_xor_1), .Z(z));

endmodule
