module sumatoria_w(
input MAX10_CLK1_50, //
input [9:0] SW, //
input [1:0] KEY, //
// displays
output [0:6] HEX0,
output [0:6] HEX1,
output [0:6] HEX2,
output [0:6] HEX3,
// LED
output [9:0] LEDR
);
wire [9:0] sum;

wire [0:6] D_un;
wire [0:6] D_de;
wire [0:6] D_ce;
wire [0:6] D_mi;

imprimir TOP(
.clk(MAX10_CLK1_50),
.numero(SW[9:0]),
.start(~KEY[0]),
.sum(LEDR[9:0]),
.terminado(),
.D_un(D_un),
.D_de(D_de),
.D_ce(D_ce),
.D_mi(D_mi)
);

assign LEDR = sum;

// concatenacion al display fisico
assign HEX0 = {1'b1, D_un};
assign HEX1 = {1'b1, D_de};
assign HEX2 = {1'b1, D_ce};
assign HEX3 = {1'b1, D_mi};

endmodule


