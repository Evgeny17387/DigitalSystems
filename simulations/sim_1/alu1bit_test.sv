module alu1bit_test;

	parameter tpd = 10;

    logic a;
    logic b;
    logic cin;
    logic [1:0] op;

    logic s;
    logic cout;

    alu1bit alu1bit_dut(.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

    initial begin

        cin = 1'b0;
	
		// NOR
		
        op = 2'b00;

        a = 1'b0;
        b = 1'b0;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b1;
		
		#tpd;

		// XOR
		
        op = 2'b01;

        a = 1'b0;
        b = 1'b0;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b1;
		
		#tpd;

		// FAS
		
        op = 2'b10;

        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b0;
        cin = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b1;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
        cin = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
        cin = 1'b1;

		#tpd;

        a = 1'b1;
        b = 1'b1;
        cin = 1'b1;

		#tpd;

        op = 2'b11;

        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b0;
        cin = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b1;
        cin = 1'b0;
		
		#tpd;

        a = 1'b0;
        b = 1'b1;
        cin = 1'b1;
		
		#tpd;

        a = 1'b1;
        b = 1'b0;
        cin = 1'b1;

		#tpd;

        a = 1'b1;
        b = 1'b1;
        cin = 1'b1;

    end

endmodule
