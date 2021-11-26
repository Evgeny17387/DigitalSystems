
module mux2_2to1(
	output logic [1:0] OUT,
	input logic SEL,
	input logic [1:0] A,
	input logic [1:0] B
);
	genvar i;
	generate
		for (i = 0; i < 2; i ++)
		begin
			mux2to1 mux_inst(.OUT(OUT[i]), .SEL(SEL), .A(A[i]), .B(B[i]));
		end
	endgenerate
endmodule

