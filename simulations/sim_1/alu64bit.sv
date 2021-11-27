module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

	logic [62:0] connector;
	
	genvar i;
	generate
		
		for (i = 0; i <= 63; i++) begin
		
			if (i == 0) begin

				alu1bit alu1bit_inst(.a(a[i]), .b(b[i]), .cin(cin), .op(op), .s(s[i]), .cout(connector[i]));

			end

			else if (i == 63) begin

				alu1bit alu1bit_inst(.a(a[i]), .b(b[i]), .cin(connector[i-1]), .op(op), .s(s[i]), .cout(cout));

			end
			
			else begin

				alu1bit alu1bit_inst(.a(a[i]), .b(b[i]), .cin(connector[i-1]), .op(op), .s(s[i]), .cout(connector[i]));

			end
		
		end
	
	endgenerate


endmodule
