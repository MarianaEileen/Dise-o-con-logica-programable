module clk_divider #(parameter FREQ = 1)(
input clk,
input rst,
output reg clk_div
);
reg [31:0] count; // bits para 50000000
wire [31:0] contador;

// parameter ConstantNumber = 5; // Mientras mas pequeño, mas grande la frecuencia
 
parameter CLK_FREQ = 50_000_000;
parameter ConstantNumber = CLK_FREQ/(2*FREQ);
 
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
			clk_div <= clk_div; // Si no, se queda igual
	end
endmodule