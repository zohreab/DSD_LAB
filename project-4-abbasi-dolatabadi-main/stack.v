
`timescale 1ns / 1ps

module stack(Data_Out, Full, Empty, Clk, RstN, Data_In, Push, Pop);
    parameter DEPTH = 8;
    parameter WIDTH = 4;

    output reg Empty, Full;
    output reg [WIDTH - 1:0] Data_Out;
   

    input [WIDTH - 1:0] Data_In;
    input Clk, RstN, Push, Pop;

    integer ptr;
    reg [WIDTH - 1:0] data [0:DEPTH - 1];

    always @(posedge Clk or negedge RstN) begin

        if(!RstN) begin
            ptr <= 0;
            Full <= 0;
            Empty <= 0;
            Data_Out <= {WIDTH{1'bz}};
        end
        else begin
            Data_Out <= {WIDTH{1'bz}};
            if(Push && !Full) begin
                Empty <= 1;
                Full <= (ptr === DEPTH - 1) ? 1 : 0;

                data[ptr] <= Data_In;
                ptr <= ptr + 1;
            end
            else if(Pop && Empty) begin
                Full <= 0;
                Empty <= ptr === 1 ? 0 : 1; 
                Data_Out <= data[ptr - 1];

                ptr <= ptr - 1;
            end

        end
    end

endmodule
