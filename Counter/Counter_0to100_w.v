module Counter_0to100_w(
	input  [9:0] SW,
	input        MAX10_CLK1_50,
	output [0:6] HEX0,
	output [0:6] HEX1,
	output [0:6] HEX2,
	output [0:6] HEX3
);

wire [0:6] D_un, D_de, D_ce, D_mil;

imprimir TOP(
	.clk(MAX10_CLK1_50),
	.rst(SW[0]),
	.up_down(SW[1]),
	.load(SW[2]),
	.data_in(SW[9:3]),
	.D_un(D_un),
	.D_de(D_de),
	.D_ce(D_ce),
	.D_mi(D_mi)
);

// concatenacion al orden del display fisico
assign HEX0 = {1'b1, D_un};
assign HEX1 = {1'b1, D_de};
assign HEX2 = {1'b1, D_ce};
assign HEX3 = {1'b1, D_mi};

endmodule
