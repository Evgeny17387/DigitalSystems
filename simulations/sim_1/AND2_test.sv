module AND2_test;

	parameter tpd = 10;

    logic a;
    logic b;

	logic z;

    AND2 AND2_dut(.a(a), .b(b), .z(z));

    initial begin

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

    end

endmodule
