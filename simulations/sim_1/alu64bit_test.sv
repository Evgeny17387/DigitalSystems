module alu64bit_test;

	parameter tpd = 10;

    logic [63:0] a;
    logic [63:0] b;
    logic cin;
    logic [1:0] op;

    logic [63:0] s;
    logic cout;

    alu64bit alu64bit_dut(.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

    initial begin

        cin = 1'b1;
	
		// NOR
		
        op = 2'b10;

        a = 64'hffffffffffffffff;
        b = 64'b0;
		
    end

endmodule
