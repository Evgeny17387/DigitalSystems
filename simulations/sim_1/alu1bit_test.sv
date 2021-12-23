module alu1bit_test;

	parameter tpd = 120;

    logic a;
    logic b;
    logic cin;
    logic [1:0] op;

    logic s;
    logic cout;

    alu1bit alu1bit_dut(.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

    initial begin

		op 	= 2'b11;
		a 	= 1'b0;
		b 	= 1'b0;
		cin = 1'b0;
	
		#tpd;

		op 	= 2'b11;
		a 	= 1'b0;
		b 	= 1'b1;
		cin = 1'b0;
		
		#tpd;

		op 	= 2'b11;
		a 	= 1'b0;
		b 	= 1'b0;
		cin = 1'b0;

    end

endmodule
