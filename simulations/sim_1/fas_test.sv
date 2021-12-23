module fas_test;

	parameter tpd = 120;

    logic a;
    logic b;
    logic cin;
    logic a_ns;

    logic s;
	logic cout;

    fas fas_dut(.a(a), .b(b), .cin(cin), .a_ns(a_ns), .s(s), .cout(cout));

    initial begin

        a_ns 	= 1'b1;
        a 		= 1'b0;
        b 		= 1'b1;
        cin 	= 1'b0;
		
		#tpd;

        a_ns 	= 1'b1;
        a 		= 1'b1;
        b 		= 1'b1;
        cin 	= 1'b0;

		#tpd;

        a_ns 	= 1'b1;
        a 		= 1'b0;
        b 		= 1'b1;
        cin 	= 1'b0;

    end

endmodule
