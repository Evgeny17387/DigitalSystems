module mux2_tb;

	parameter tpd = 40;

    logic D0;
    logic D1;
    logic SEL;
    logic Z;

    mux2 mux2_dut(.d0(D0), .d1(D1), .sel(SEL), .z(Z));

    initial begin

        D0 = 1'b0;
        D1 = 1'b0;
        SEL = 1'b0;
		
		#tpd;

        D0 = 1'b1;
        D1 = 1'b0;
        SEL = 1'b0;

		#tpd;

        D0 = 1'b0;
        D1 = 1'b1;
        SEL = 1'b0;

		#tpd;

        D0 = 1'b1;
        D1 = 1'b1;
        SEL = 1'b0;

		#tpd;

        D0 = 1'b0;
        D1 = 1'b0;
        SEL = 1'b1;
		
		#tpd;

        D0 = 1'b1;
        D1 = 1'b0;
        SEL = 1'b1;

		#tpd;

        D0 = 1'b0;
        D1 = 1'b1;
        SEL = 1'b1;

		#tpd;

        D0 = 1'b1;
        D1 = 1'b1;
        SEL = 1'b1;

    end

endmodule
