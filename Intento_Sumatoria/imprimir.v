module imprimir(
input clk,
input rst,
input [7:0] numero,
input start,
output [9:0] sum,
output terminado,
output [0:6] D_un,
output [0:6] D_de,
output [0:6] D_ce,
output [0:6] D_mi
);

wire reloj;

clk_divider DIV(
	.clk(clk),
	.rst(rst),
	.clk_div(reloj)
);

sumatoria SUM(
	.clk(clk),
	.numero(numero),
	.start(start),
	.sum(sum),
	.terminado(terminado)
);

BCD_4displays DISP(
	.bcd_in(numero),
	.D_un(D_un),
	.D_de(D_de),
	.D_ce(D_ce),
	.D_mi(D_mi)
);

endmodule

