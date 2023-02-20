module cascadable_1bit_comparator(
		input lt_in,
				eq_in,
				gt_in,
				a,
				b,
		output lt_out,
				 eq_out,
				 gt_out
);

		assign lt_out = lt_in | (eq_in & ~a & b);
		assign eq_out = eq_in & (a ~^ b);
		assign gt_out = gt_in | (eq_in & a & ~b);
		
endmodule