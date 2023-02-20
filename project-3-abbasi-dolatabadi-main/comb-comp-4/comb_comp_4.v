module comb_comp_4(
		input [3:0] A,
		input [3:0] B,
		output gt,
				 eq,
				 lt
);

		wire gt_3, gt_2, gt_1, gt_0;
		wire eq_3, eq_2, eq_1, eq_0;
		wire lt_3, lt_2, lt_1, lt_0;
		
		cascadable_1bit_comparator comp_3(.lt_in(1'b0), .eq_in(1'b1), .gt_in(1'b0), .a(A[3]), .b(B[3]), .lt_out(lt_3), .eq_out(eq_3), .gt_out(gt_3));
		cascadable_1bit_comparator comp_2(.lt_in(lt_3), .eq_in(eq_3), .gt_in(gt_3), .a(A[2]), .b(B[2]), .lt_out(lt_2), .eq_out(eq_2), .gt_out(gt_2));
		cascadable_1bit_comparator comp_1(.lt_in(lt_2), .eq_in(eq_2), .gt_in(gt_2), .a(A[1]), .b(B[1]), .lt_out(lt_1), .eq_out(eq_1), .gt_out(gt_1));
		cascadable_1bit_comparator comp_0(.lt_in(lt_1), .eq_in(eq_1), .gt_in(gt_1), .a(A[0]), .b(B[0]), .lt_out(lt_0), .eq_out(eq_0), .gt_out(gt_0));
		
		assign gt = gt_0;
		assign eq = eq_0;
		assign lt = lt_0;
		
endmodule