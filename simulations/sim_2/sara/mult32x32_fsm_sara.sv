// 32X32 Multiplier FSM
module mult32x32_fsm_sara (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    output logic busy,            // Multiplier busy indication
    output logic a_sel,           // Select one 2-byte word from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [1:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

// Put your code here
// ------------------
typedef enum {idle_state,A1B1_state,A1B2_state,A2B1_state,A2B2_state} sm_state;

sm_state current_state, next_state;

always_ff @(posedge clk, posedge reset) begin
		if (reset == 1'b1) begin
			current_state <= idle_state;
		end
		else begin
			current_state <= next_state;
		end
	end
	
	
always_comb
begin
//default assignments
	next_state = current_state;
    busy=1'b1;
	upd_prod= 1'b1;     
    clr_prod=  1'b0;
	
    a_sel=1'b0;
    b_sel=1'b0;
    shift_sel=2'b00;
 
	case (current_state)
	
		idle_state: begin
		if (reset==1'b1)
			begin
			//is ok?
			busy=1'b0;
			upd_prod= 1'b0;     
			clr_prod=  1'b1;
			a_sel=1'b0;
			b_sel=1'b0;
			shift_sel=2'b11;
			next_state=idle_state;
			end
			else if (start==1'b0)
			begin
			busy=1'b0;
			clr_prod=1'b0;
			upd_prod=1'b0;     
			a_sel=1'b0;
			b_sel=1'b0;
			shift_sel=2'b00;
			next_state=idle_state;
			end
			else 
			begin
			busy=1'b0;
			clr_prod=1'b1;
			upd_prod=1'b1;     
			a_sel=1'b0;
			b_sel=1'b0;
			shift_sel=2'b00;
			next_state=A1B1_state;

			end
			
		end	
			A1B1_state: begin
			busy=1'b1;
			clr_prod=1'b0;
			upd_prod=1'b1;     
			a_sel=1'b0;
			b_sel=1'b0;
			shift_sel=2'b00;
			next_state=A1B2_state;
			
			end
			
			A1B2_state: begin
			busy=1'b1;
			clr_prod=  1'b0;
			upd_prod= 1'b1;     
			a_sel=1'b0;
			b_sel=1'b1;
			shift_sel=2'b01;
			next_state=A2B1_state;
			end
			
			A2B1_state: begin
			busy=1'b1;
			clr_prod=  1'b0;
			upd_prod= 1'b1;     
			a_sel=1'b1;
			b_sel=1'b0;
			shift_sel=2'b01;
			next_state=A2B2_state;
			end
			
			
			A2B2_state: begin
			begin
			busy=1'b1;
			clr_prod=  1'b0;
			upd_prod= 1'b1;     
			a_sel=1'b1;
			b_sel=1'b1;
			shift_sel=2'b10;
			next_state=idle_state;
			end
		end
	endcase	
end
// End of your code

endmodule
