
`timescale 1ns / 1ps

module stack_tb;

	// Inputs
	reg Clk;
	reg RstN;
	reg [3:0] Data_In;
	reg Push;
	reg Pop;

	// Outputs
	wire [3:0] Data_Out;
	wire Full;
	wire Empty;

	// Instantiate the Unit Under Test (UUT)
	stack uut (
		.Data_Out(Data_Out), 
		.Full(Full), 
		.Empty(Empty), 
		.Clk(Clk), 
		.RstN(RstN), 
		.Data_In(Data_In), 
		.Push(Push), 
		.Pop(Pop)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		RstN = 0;
		Data_In = 0;
		Push = 0;
		Pop = 0;
		// Reset
		#2
        RstN = 1;
		#10
		// Add stimulus here

		// should not return anything
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;


		#2 Data_In = 1;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 2;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 3;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 4;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 5;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 6;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 7;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 8;
		Push = 1;
		#2 Push = 0;

		//stack is full so nothing will be added
		#2 Data_In = 9;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 10;
		Push = 1;
		#2 Push = 0;
		#2 Data_In = 11;
		Push = 1; 
		#2 Push = 0;
		#2 Data_In = 12;
		Push = 1; 
		#2 Push = 0;
		#2 Data_In = 13;
		Push = 1; 
		#2 Push = 0;
		#2 Data_In = 14;
		Push = 1; 
		#2 Push = 0;
		#2 Data_In = 15;
		Push = 1; 
		#2 Push = 0;
		
		// it will return 8, 7, 6,...,1
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;
		
		// stack is empty so it will not return anything
		#2 Pop = 1;
		#2 Pop = 0;
		#2 Pop = 1;
		#2 Pop = 0;

		#2 Data_In = 5;
		Push = 1; 
		#2 Push = 0;
		#2 Data_In = 5;
		Push = 1; 
		#2 Push = 0;

		#2 Pop = 1;
		#2 Pop = 0;

		#2 Data_In = 7;
		Push = 1; 
		#2 Push = 0;

		#2 Pop = 1;
		#2 Pop = 0;

		#2 Pop = 1;
		#2 Pop = 0;

		
		
	end

	always #1 Clk = ~Clk;
      
endmodule

