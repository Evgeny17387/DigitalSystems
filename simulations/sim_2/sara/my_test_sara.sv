// 32X32 Multiplier test template
module mult32x32_test_sara;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product

// Put your code here
// ------------------

mult32x32 inst (.clk(clk), .reset(reset), .start(start) , .a(a) ,.b(b) , .busy(busy) , .product(product) );

    always begin
        #5 clk = ~clk;
    end    

    initial begin
        clk=1'b1;
        reset=1'b1;
		start=1'b0;
		a=32'd0;
		b=32'd0;
		repeat (4)begin 
			@(posedge clk);
		end
		reset = 1'b0;
        @(posedge clk);
		a=32'd2;
		b=32'd3;
		start=1'b1;
		@(posedge clk);	
		start=1'b0;
		@(negedge busy);
		a=32'd123;
		b=32'd456;
		start=1'b1;
		@(posedge clk);	
		start=1'b0;
		@(negedge busy);
		
		
		reset=1'b1;
		reset = 1'b0;
        @(posedge clk);
		a=32'd100000000;
		b=32'd100000000;
		start=1'b1;
		@(negedge busy);
		start=1'b0;
		@(negedge busy);

    end
// End of your code

endmodule
