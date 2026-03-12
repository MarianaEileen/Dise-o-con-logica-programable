module sumatoria(
	input clk,
	input [7:0] numero, // num de entrada SW
	input start, // señal calcular sumatoria KEY
	output reg [9:0] sum, // sumatoria
	output reg terminado
);

reg [7:0] n; // numero en q va

always @(posedge clk)
	begin
		if(start)
			begin
				n <= numero;
				sum <= 0;
				terminado <= 0;
			end
		else if(n >= 0)
			begin
				sum <= sum + n;
				n <= n -1;
			end
		else
			begin
				terminado <= 1;
			end
	end
	
endmodule


