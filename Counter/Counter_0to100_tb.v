module Counter_0to100_tb();
reg clk;
reg rst;
reg [6:0] data_in;
reg up_down;
reg load;
wire [13:0] numero;

Counter_0to100 DUT(
.clk(clk),
.rst(rst),
.data_in(data_in),
.up_down(up_down),
.load(load),
.numero(numero)
);

initial
	begin
		clk = 0;
		forever #5 clk = ~clk;
	end

initial
	begin
		// iniciales
		rst = 1;
		load = 0;
		up_down = 0;
		data_in = 0;
		#20;
		//reset
		rst = 0;
		// contador normal up
		#50;
		// down
		up_down = 1;
		#100;
		$stop;
		$finish;
	end
	
endmodule

