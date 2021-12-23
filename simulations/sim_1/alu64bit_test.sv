module alu64bit_test;

	parameter tpd = 2500;

    logic [63:0] a;
    logic [63:0] b;
    logic cin;
    logic [1:0] op;

    logic [63:0] s;
    logic cout;

    alu64bit alu64bit_dut(.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

    initial begin

		op = 2'b10;
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'h0;
		cin = 1'b0;

		#tpd;

		op = 2'b10;
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'h0;
		cin = 1'b1;

		#tpd;

		op = 2'b10;
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 64'h0;
		cin = 1'b0;
		
    end

endmodule

// 0xFFFFFFFFFFFFFFFF
