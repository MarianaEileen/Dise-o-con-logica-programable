module PWM_tb();

reg clk;
reg reset;
reg [7:0] SW;
wire PWM;
wire [0:6] HEX0, HEX1, HEX2;

PWM DUT(
	.clk(clk),
	.reset(reset),
	.SW(SW),
	.PWM(PWM),
	.HEX0(HEX0), 
	.HEX1(HEX1), 
	.HEX2(HEX2)
);

always
#5
clk= ~clk;

initial
	begin
		clk=0;
		reset=0;
		SW=0;
		
		#10;
		
		reset=1;
		#10;
		reset=0;
		#10;
// angulos
		SW=180;
		#10;
		SW=90;
		#10;
		SW=64;
		#10;
		
		reset=1;
		#10;
		reset=0;
		#10;
		
		$stop;
		$finish;
	end


endmodule
