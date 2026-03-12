module Password_tb;
reg clk;
reg [3:0] SW;
reg [1:0] KEY;
wire [0:6] HEX0, HEX1, HEX2, HEX3;
wire [6:0] LEDR;

Password DUT (
.clk(clk),
.SW(SW),
.KEY(KEY),
.HEX0(HEX0),
.HEX1(HEX1),
.HEX2(HEX2),
.HEX3(HEX3),
.LEDR(LEDR)
);

defparam DUT.divisor.FREQ = 25_000_000;

always 
#10 
clk = ~clk;

// tiempo de simulacion
task pulsar_confirmar;
	begin
      KEY[1] = 0;                // presionar
      #400; // mantener 
      KEY[1] = 1;                // soltar
      #400;
   end
endtask

task pulsar_reset;
	begin
      KEY[0] = 0;
      #400;
      KEY[0] = 1;
      #400;
	end
endtask

initial
	begin
      clk = 0;
      SW  = 0;
      KEY = 2'b11;
		
		#20;
		
      pulsar_reset();// RESET
		
      // Secuencia
      SW = 4'hD;
      pulsar_confirmar();

      SW = 4'hC;
      pulsar_confirmar();
		
		SW = 4'h5;
      pulsar_confirmar();
		
		pulsar_reset();
		  
		SW = 4'hD;
		pulsar_confirmar();

      SW = 4'hC;
      pulsar_confirmar();

      SW = 4'hB;
      pulsar_confirmar();

      SW = 4'hA;
      pulsar_confirmar();

      pulsar_confirmar();

      #400;

      if (LEDR[6])
      else
			$finish;
    end

endmodule
