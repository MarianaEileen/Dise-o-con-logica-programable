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

always #5 clk = ~clk;

initial
	begin
		// iniciales
		clk=0;
		rst=0;
		up_down=0;
		load=0;
		data_in=0;

		rst = 1;
		#5;
		rst = 0;
		
		#1100;
// reset
		rst=1;
		#50;
		rst=0;
		
		#500;
		
// up_down
		up_down=1;
		#1100;
		up_down=0;
		
		#500;
		
// load
		load=1;
		#50;
		
		data_in=20;
		#50;
// load desactivado
		load=0;
		
		#1000;
		
		load=1;
		#50;

		data_in=40;
		#50;
		
// up_down
		up_down=1;
		#50;
//reset
		rst=1;
		#50;
		rst=0;
		
		#50;
		load=0;
		#1000;
		
		$stop;
		$finish;
	end
	
endmodule

