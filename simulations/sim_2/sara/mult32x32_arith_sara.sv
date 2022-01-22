// 32X32 Multiplier arithmetic unit template
module mult32x32_arith_sara (
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

// Put your code here
// ------------------
logic [15:0]a_mux2_out;
logic [15:0]b_mux2_out;
logic [31:0]mult_out;
logic [63:0]sh0_out;
logic [63:0]sh16_out;
logic [63:0]sh32_out;
logic [63:0]partial_result;
//logic [63:0]adder_out;
//logic [63:0]prod_out;


always_comb begin
//a_mux2->1
	if(a_sel==2'b1)
	begin
	a_mux2_out=a[31:16];
	end
	else 	
	begin
	a_mux2_out=a[15:0];
	end
end

always_comb begin
//b_mux2->1
	if(b_sel==2'b1)
	begin
	b_mux2_out=b[31:16];
	end
	else begin
	b_mux2_out=b[15:0];
	end
end

always_comb begin
//16X16 multiplier
	mult_out=a_mux2_out*b_mux2_out;
	end
always_comb begin
	//shifters
	sh0_out=mult_out<<0;
	sh16_out=mult_out<<16;
	sh32_out=mult_out<<32;
end


always_comb begin
	//default
	if (shift_sel==2'b11)
	begin
	partial_result=64'd0;
	end
	else if (shift_sel==2'b01)
	begin
	partial_result=sh16_out;
	end
	else if (shift_sel==2'b10)
	begin
	partial_result=sh32_out;
	end
	else
	begin
	partial_result=sh0_out;
	end
end


 always_ff @(posedge clk, posedge reset)begin
            if (reset == 1'b1) 
			begin
            product <= 64'd0;
            end
			
			else begin
			
				if (clr_prod == 1'b1)
					begin
					product <= 64'd0;
					end
				
				else if (upd_prod == 1'b1) 
					begin
					product <= product + partial_result;
					end
			end
	end

// End of your code

endmodule
