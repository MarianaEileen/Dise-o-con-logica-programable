// Frecuencia del clk_divider 5 MHz
/*
Cmin = 100_000
T periodo = 0.02

100% = 100_000
10% = 10_000
5% = 5_000

y = mx + b

m = (10_000 - 5_000)/180 = 27.77

y = (5_000/180)(0) + b

5_000 = b

	y = (5_000/180)x + 5_000
*/

module clk_divider #(parameter FREQ = 5_000_000)(
input clk,
input rst,
output reg clk_div 
);

reg [31:0] count; // bits para 50000000

// parameter ConstantNumber = 5; // Mientras mas pequeño, mas grande la frecuencia
 
localparam CLK_FREQ = 50_000_000;
localparam ConstantNumber = CLK_FREQ/(2*FREQ);
 
always @(posedge clk or posedge rst)
	begin
	if (rst == 1)
		count <= 0;
	else if (count == ConstantNumber - 1)
		count <= 0;
	else
		count <= count + 1;
	end
	
always @(posedge clk or posedge rst) // si rst es posedge en la primera, sera siempre
/* si es otra cosa el rst,
no se va a resetear todo por igual, sera error
Si uso los botones, tiene que ser posedge.
Switches rst tiene que ser negativo.*/
	begin
		if (rst == 1)
			clk_div <= 0;
		else if (count == ConstantNumber - 1) // Si es igual al constanNumber es cuando se usa el clk_div
			clk_div <= ~clk_div;
		else
			clk_div <= clk_div; // si no, se queda igual
	end
endmodule