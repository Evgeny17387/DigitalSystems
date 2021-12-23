module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

	// parameter B = 0;
	// parameter C = 0;
	// parameter D = 0;
	// parameter E = 0;
	// parameter F = 0;
	// parameter G = 0;

	parameter B = 10;
	parameter C = 10;
	parameter D = 5;
	parameter E = 5;
	parameter F = 8;
	parameter G = 8;

    logic w_xor_1;

    logic w_and_1;
    logic w_or_1;
    logic w_and_2;
    logic w_or_2;
    logic w_or_2_not;
    logic w_or_3;
    logic w_and_3;

	// S

    XOR2 #(.Tpdlh(F), .Tpdhl(G)) xor_1(.Z(w_xor_1), .A(a), .B(b));
    XOR2 #(.Tpdlh(F), .Tpdhl(G)) xor_2(.Z(s), .A(w_xor_1), .B(cin));

	// C_OUT

    AND2 #(.B(B), .C(C), .D(D), .E(E)) and_1(.z(w_and_1), .a(cin), .b(b));
    OR2 #(.Tpdlh(D), .Tpdhl(E)) or_1(.Z(w_or_1), .A(cin), .B(b));
    AND2 #(.B(B), .C(C), .D(D), .E(E)) and_2(.z(w_and_2), .a(a), .b(a_ns));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) or_2(.Z(w_or_2), .A(a), .B(a_ns));
    NOT #(.Tpdlh(B), .Tpdhl(C)) not_2(.Z(w_or_2_not), .A(w_or_2));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) or_3(.Z(w_or_3), .A(w_and_2), .B(w_or_2_not));

    AND2 #(.B(B), .C(C), .D(D), .E(E)) and_3(.z(w_and_3), .a(w_or_1), .b(w_or_3));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) or_4(.Z(cout), .A(w_and_1), .B(w_and_3));

endmodule

module AND2 (
    input logic a,
    input logic b,
    output logic z
);

	parameter B = 10;
	parameter C = 10;
	parameter D = 5;
	parameter E = 5;

	logic w_a_not;
	logic w_b_not;

	logic w_xor_1;

	NOT #(B, C) not_a(.A(a), .Z(w_a_not));
	NOT #(B, C) not_b(.A(b), .Z(w_b_not));

    OR2 #(D, E) xor_1(.A(w_a_not), .B(w_b_not), .Z(w_xor_1));

	NOT #(B, C) not_xor_1(.A(w_xor_1), .Z(z));

endmodule
