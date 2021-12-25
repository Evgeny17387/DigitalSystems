module mult32x32_fast_fsm (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    input logic a_msw_is_0,       // Indicates MSW of operand A is 0
    input logic b_msw_is_0,       // Indicates MSW of operand B is 0
    output logic busy,            // Multiplier busy indication
    output logic a_sel,           // Select one 2-byte word from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [1:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

typedef enum {state_idle, state_1, state_2, state_3, state_4} state_type;

state_type state_current, state_next;

always_ff @(posedge clk, posedge reset)
begin
    if (reset)
	begin
		state_current <= state_idle;
	end
    else
	begin
		state_current <= state_next;
	end
end

always_comb
begin
	busy = 1'b1;
	upd_prod = 1'b1;
	clr_prod = 1'b0;
	state_next = state_current;
	a_sel = 1'b0;
	b_sel = 1'b0;
	shift_sel = 2'b0;

    case (state_current)
        state_idle:
		begin
			if (start)
			begin
				clr_prod = 1'b1;
				state_next = state_1;
			end
			else
			begin
				state_next = state_idle;
			end
			busy = 1'b0;
			upd_prod = 1'b0;
		end
        state_1:
		begin
			state_next = state_2;
		end
        state_2:
		begin
			state_next = state_3;
			a_sel = 1'b1;
			shift_sel = 2'b01;
		end
        state_3:
		begin
			state_next = state_4;
			b_sel = 1'b1;
			shift_sel = 2'b01;
		end
        state_4:
		begin
			state_next = state_idle;
			a_sel = 1'b1;
			b_sel = 1'b1;
			shift_sel = 2'b10;
		end
    endcase
end

endmodule
