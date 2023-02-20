module seq_comp(
		input clk,
				reset,
				A,
				B,
		output gt,
				 eq,
				 lt
);

		wire D_ff1, D_ff2;
		wire Q_ff1, Q_ff2;
		wire Q_prim_ff1, Q_prim_ff2;
		wire S_ff1, R_ff1, temp_1_ff1, temp_4_ff1;
		wire S_ff2, R_ff2, temp_1_ff2, temp_4_ff2;
		
		//First DFF data flow using SR design
		assign temp_1_ff1 = ~(S_ff1 & temp_4_ff1);
		assign S_ff1 = ~(temp_1_ff1 & clk & reset);
		assign R_ff1 = ~(S_ff1 & clk & temp_4_ff1);
		assign temp_4_ff1 = ~(R_ff1 & D_ff1 & reset);
		assign Q_ff1 = ~(S_ff1 & Q_prim_ff1);
		assign Q_prim_ff1 = ~(Q_ff1 & R_ff1 & reset);
		
		//Second DFF data flow using SR design
		assign temp_1_ff2 = ~(S_ff2 & temp_4_ff2);
		assign S_ff2 = ~(temp_1_ff2 & clk & reset);
		assign R_ff2 = ~(S_ff2 & clk & temp_4_ff2);
		assign temp_4_ff2 = ~(R_ff2 & D_ff2 & reset);
		assign Q_ff2 = ~(S_ff2 & Q_prim_ff2);
		assign Q_prim_ff2 = ~(Q_ff2 & R_ff2 & reset);
		
		// input functions of Dffs
		assign D_ff1 = (A & ~B) | (Q_ff1 & (A | ~B));
		assign D_ff2 = (~A & B) | (Q_ff2 & (~A | B));
		
		//assigning serial outputs according to defined states
		assign eq = ~D_ff2 & ~D_ff1;
		assign gt = ~D_ff2 & D_ff1;
		assign lt = D_ff2 & ~D_ff1;

endmodule
