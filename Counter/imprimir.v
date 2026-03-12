module imprimir(
	input clk,
	input rst,
	input up_down,
	input load,
	input [6:0] data_in,
	output [0:6] D_un,
	output [0:6] D_de,
	output [0:6] D_ce,
	output [0:6] D_mi
);

wire reloj;
wire [13:0] numero;

clk_divider DIV(
	.clk(clk),
	.rst(rst),
	.clk_div(reloj)
);

Counter_0to100 CONT(
	.clk(reloj),
	.rst(rst),
	.up_down(up_down),
	.load(load),
	.data_in(data_in),
	.numero(numero)
);

BCD_4displays DISP(
	.bcd_in(numero),
	.D_un(D_un),
	.D_de(D_de),
	.D_ce(D_ce),
	.D_mi(D_mi)
);

endmodule
