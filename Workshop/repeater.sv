
module repeater(
	output logic [7:0] B,
	input logic A
);

	assign B = {8{A}};

endmodule
