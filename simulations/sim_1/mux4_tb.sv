module mux4_tb;

	parameter tpd = 60;

    logic d0;
    logic d1;
    logic d2;
    logic d3;

    logic [1:0] sel;

    logic z;

    mux4 mux4_dut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .z(z));

    initial begin

        sel = 2'b11;

        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b1;
        d2 = 1'b0;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b1;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b1;
        d2 = 1'b0;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b0;
        d2 = 1'b1;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b1;
        d2 = 1'b1;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b1;
        d2 = 1'b0;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b1;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b1;
        d2 = 1'b1;
        d3 = 1'b0;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b1;
        d2 = 1'b0;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b0;
        d2 = 1'b1;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b0;
        d1 = 1'b1;
        d2 = 1'b1;
        d3 = 1'b1;
		
		#tpd;

        d0 = 1'b1;
        d1 = 1'b1;
        d2 = 1'b1;
        d3 = 1'b1;
		
		#tpd;

    end

endmodule
