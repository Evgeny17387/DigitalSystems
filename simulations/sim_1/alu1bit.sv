module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

	parameter B = 0;
	parameter C = 0;
	parameter D = 0;
	parameter E = 0;
	parameter F = 0;
	parameter G = 0;

	// parameter B = 10;
	// parameter C = 9;
	// parameter D = 5;
	// parameter E = 1;
	// parameter F = 8;
	// parameter G = 5;

	logic w_or_1;
	logic w_or_1_not;
	logic w_xor_1;
	logic w_not_1;
	logic w_s;

	OR2 #(.Tpdlh(D), .Tpdhl(E)) or_1(.Z(w_or_1), .A(a), .B(b));
	NOT #(.Tpdlh(B), .Tpdhl(C)) not_1(.Z(w_or_1_not), .A(w_or_1));

    XOR2 #(.Tpdlh(F), .Tpdhl(G)) xor_1(.Z(w_xor_1), .A(a), .B(b));

	NOT #(.Tpdlh(B), .Tpdhl(C)) not_2(.Z(w_not_1), .A(op[0]));
    fas fas_dut(.a(a), .b(b), .cin(cin), .a_ns(w_not_1), .s(w_s), .cout(cout));

    mux4 mux4_dut(.d0(w_or_1_not), .d1(w_xor_1), .d2(w_s), .d3(w_s), .sel(op), .z(s));

endmodule
