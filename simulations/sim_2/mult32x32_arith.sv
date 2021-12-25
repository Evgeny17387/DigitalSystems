module mult32x32_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic a_sel,           // Select one 2-byte word from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [1:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic [63:0] product  // Miltiplication product
);


logic [15:0] a_after_select;
logic [15:0] b_after_select;
logic [31:0] result_after_multiplexer;
logic [63:0] result_after_shifter;
logic [63:0] result_after_adder;
logic [63:0] result;
logic [63:0] product_register;

assign product = product_register;

always_ff @(posedge clk, posedge reset)
begin
    if (reset)
	begin
		product_register <= 63'b0;
	end
    else
	begin
		product_register <= result;
	end
end

always_comb
begin
	result = 2'b0;
	a_after_select = a[15:0];
	b_after_select = b[15:0];
	result_after_shifter = 0;

	if (a_sel)
	begin
		a_after_select = a[31:16];
	end
	if (b_sel)
	begin
		b_after_select = b[31:16];
	end

	result_after_multiplexer = a_after_select * b_after_select;

	if (shift_sel == 2'b00)
	begin
		result_after_shifter = result_after_multiplexer;
	end
	else if (shift_sel == 2'b01)
	begin
		result_after_shifter = result_after_multiplexer << 16;
	end
	else if (shift_sel == 2'b10)
	begin
		result_after_shifter = result_after_multiplexer << 32;
	end

	result_after_adder = result_after_shifter + product_register;

	if (upd_prod)
	begin
		result = result_after_adder;
	end
	else if (!clr_prod)
	begin
		result = product_register;
	end
end

endmodule
