module mult32x32_fast_test;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product

	localparam HALF_PERIOD = 1;
	localparam PERIOD = 2 * HALF_PERIOD;

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

		a = 32'd309518561;
		b = 32'd316276955;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;
		#PERIOD;

		a = 32'd309518561 & 32'hFFFF;
		b = 32'd316276955 & 32'hFFFF;
        start = 1'b1;
		#PERIOD;
        start = 1'b0;
		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

    end

	always #HALF_PERIOD clk=~clk;

endmodule
