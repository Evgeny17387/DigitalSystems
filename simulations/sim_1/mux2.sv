module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

	// parameter B = 0;
	// parameter C = 0;
	// parameter D = 0;
	// parameter E = 0;

	parameter B = 10;
	parameter C = 9;
	parameter D = 5;
	parameter E = 1;

    logic w1;
    logic w2;
    logic w3;
    logic w4;
    logic w5;
    logic w6;
    logic w7;

    NOT #(.Tpdlh(B), .Tpdhl(C)) g1(.Z(w1), .A(d0));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g2(.Z(w2), .A(sel));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g3(.Z(w3), .A(d1));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) g4(.Z(w4), .A(sel), .B(w1));
    OR2 #(.Tpdlh(D), .Tpdhl(E)) g5(.Z(w5), .A(w2), .B(w3));

    NOT #(.Tpdlh(B), .Tpdhl(C)) g6(.Z(w6), .A(w4));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g7(.Z(w7), .A(w5));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) g8(.Z(z), .A(w6), .B(w7));

endmodule
