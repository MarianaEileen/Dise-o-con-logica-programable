module Counter_0to100 #(parameter CMAX=100) (
	input clk,
	input rst,
	input [6:0] data_in,
	input up_down,
	input load,
	output reg [13:0] numero
);

always @(posedge clk or posedge rst)
	begin
	// rst num es 0
		if(rst==1)
			numero <= 0;
	// cargar el dato
		else if (load==1)
			numero<=data_in;
	// contador up
		else if (up_down==1)
			begin
				if(numero==0)
					numero<=CMAX;
			// dpwn
				else
					numero<=numero-1;
			end
	// max 100
		else if(numero == CMAX)
			numero <= 0;
		else
			numero <= numero + 1;
	end
	
endmodule
