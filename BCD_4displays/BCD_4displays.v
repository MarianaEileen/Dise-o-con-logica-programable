module BCD_4displays #(parameter N_in = 10, N_out = 7)(
input[N_in-1:0] bcd_in,
output [0:N_out-1] D_un, D_de, D_ce, D_mi // displays
);
wire [3:0] unidades, decenas, centenas, millares;

assign unidades = bcd_in%10;
assign decenas = (bcd_in/10)%10;
assign centenas = (bcd_in/100)%10;
assign millares = (bcd_in/1000)%10;

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

BCD_module mi (
	.bcd_in(millares),
	.bcd_out(D_mi)
);

endmodule