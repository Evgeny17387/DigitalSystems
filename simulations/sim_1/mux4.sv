module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

	logic z_low;
	logic z_high;

    mux2 mux2_low(.d0(d0), .d1(d1), .sel(sel[0]), .z(z_low));
    mux2 mux2_high(.d0(d2), .d1(d3), .sel(sel[0]), .z(z_high));

    mux2 mux2_oddeven(.d0(z_low), .d1(z_high), .sel(sel[1]), .z(z));

endmodule
