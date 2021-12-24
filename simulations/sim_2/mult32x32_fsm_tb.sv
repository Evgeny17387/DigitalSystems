module mult32x32_fsm_tb;

	localparam HALF_PERIOD = 1;
	localparam PERIOD = 2 * HALF_PERIOD;

    logic CLK;
    logic RESET;
    logic START;
    logic BUSY;

    mult32x32_fsm mult32x32_fsm_dut(.clk(CLK), .reset(RESET), .start(START), .busy(BUSY));

    initial begin

        CLK = 1'b1;
        START = 1'b0;
		
		#HALF_PERIOD

        RESET = 1'b1;

		#HALF_PERIOD; #PERIOD; #PERIOD; #PERIOD;

//		#PERIOD; #PERIOD; #PERIOD; #PERIOD;

        RESET = 1'b0;
        START = 1'b1;
		
		#PERIOD;

        START = 1'b0;

    end

	always #HALF_PERIOD CLK=~CLK;

endmodule
