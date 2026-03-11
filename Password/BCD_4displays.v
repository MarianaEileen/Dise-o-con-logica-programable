module BCD_4displays(
input [15:0] bcd_in,
output [0:6] D_un, D_de, D_ce, D_mil // displays
);
wire [3:0] unidades, decenas, centenas;

assign unidades = bcd_in[3:0];
assign decenas = bcd_in[7:4];
assign centenas = bcd_in[11:8];
assign millares = bcd_in[15:12];

BCD_module un(
	.bcd_in(unidades),
	.bcd_out(D_un)
);

BCD_module de(
	.bcd_in(decenas),
	.bcd_out(D_de)
);

BCD_module ce(
	.bcd_in(centenas),
	.bcd_out(D_ce)
);

BCD_module mi(
	.bcd_in(milesimas),
	.bcd_out(D_mi)
);
endmodule