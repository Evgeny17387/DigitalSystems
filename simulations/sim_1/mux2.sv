// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------

    logic w1;
    logic w2;
    logic w3;
    logic w4;
    logic w5;
    logic w6;
    logic w7;

    NOT #(.Tpdlh(0), .Tpdhl(0)) g1 (.Z(w1), .A(d0));
    NOT #(.Tpdlh(0), .Tpdhl(0)) g2 (.Z(w2), .A(sel));
    NOT #(.Tpdlh(0), .Tpdhl(0)) g3 (.Z(w3), .A(d1));

    OR2 #(.Tpdlh(0), .Tpdhl(0)) g4 (.Z(w4), .A(sel), .B(g1));
    OR2 #(.Tpdlh(0), .Tpdhl(0)) g5 (.Z(w5), .A(g2), .B(g3));

    NOT #(.Tpdlh(0), .Tpdhl(0)) g6 (.Z(w6), .A(w4));
    NOT #(.Tpdlh(0), .Tpdhl(0)) g7 (.Z(w7), .A(w5));

    OR2 #(.Tpdlh(0), .Tpdhl(0)) g8 (.Z(z), .A(w6), .B(w7));

// End of your code

endmodule
