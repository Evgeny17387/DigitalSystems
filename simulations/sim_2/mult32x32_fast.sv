module mult32x32_fast (
    input logic clk,            // Clock
    input logic reset,          // Reset
    input logic start,          // Start signal
    input logic [31:0] a,       // Input a
    input logic [31:0] b,       // Input b
    output logic busy,          // Multiplier busy indication
    output logic [63:0] product // Miltiplication product
);

logic upd_prod;
logic clr_prod;
logic a_sel;
logic b_sel;
logic [1:0] shift_sel;
logic a_msw_is_0;
logic b_msw_is_0;

mult32x32_fast_fsm mult32x32_fast_fsm_inst(.clk(clk), .reset(reset), .start(start), .busy(busy), .clr_prod(clr_prod), .upd_prod(upd_prod), .a_sel(a_sel), .b_sel(b_sel), .shift_sel(shift_sel), .a_msw_is_0(a_msw_is_0), .b_msw_is_0(b_msw_is_0));

mult32x32_fast_arith mult32x32_fast_arith_inst(.clk(clk), .reset(reset), .a(a), .b(b), .clr_prod(clr_prod), .upd_prod(upd_prod), .a_sel(a_sel), .b_sel(b_sel), .shift_sel(shift_sel), .product(product), .a_msw_is_0(a_msw_is_0), .b_msw_is_0(b_msw_is_0));

endmodule
