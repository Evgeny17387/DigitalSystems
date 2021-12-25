module mult32x32_fast_tb;

	localparam HALF_PERIOD = 1;
	localparam PERIOD = 2 * HALF_PERIOD;

    logic clk;
    logic reset;

    logic start;
    logic [31:0] a;
    logic [31:0] b;

    logic busy;
    logic [63:0] product;

    mult32x32_fast mult32x32_fast_dut(.clk(clk), .reset(reset), .start(start), .a(a), .b(b), .busy(busy), .product(product));

    initial begin

        clk = 1'b1;
        start = 1'b0;
		a = 32'd0;
		b = 32'd0;
        reset = 1'b1;

		#PERIOD; #PERIOD; #PERIOD; #PERIOD;
        reset = 1'b0;
		#PERIOD;

		a = 32'hFFFF;
		b = 32'hFFFF;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

		a = 32'h1FFFF;
		b = 32'hFFFF;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

		a = 32'hFFFF;
		b = 32'h1FFFF;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

		a = 32'h1FFFF;
		b = 32'h1FFFF;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

    end

	always #HALF_PERIOD clk=~clk;

endmodule
