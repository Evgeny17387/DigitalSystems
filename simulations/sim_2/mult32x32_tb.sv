module mult32x32_tb;

	localparam HALF_PERIOD = 1;
	localparam PERIOD = 2 * HALF_PERIOD;

    logic clk;
    logic reset;

    logic start;
    logic [31:0] a;
    logic [31:0] b;

    logic busy;
    logic product;

    mult32x32 mult32x32_dut(.clk(clk), .reset(reset), .start(start), .a(a), .b(b), .busy(busy), .product(product));

    initial begin

        clk = 1'b1;
        start = 1'b0;
		a = 32'd2;
		b = 32'd3;

        reset = 1'b1;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;
        reset = 1'b0;

        start = 1'b1;
		#PERIOD;
        start = 1'b0;

    end

	always #HALF_PERIOD clk=~clk;

endmodule
