`timescale 1ns/1ns
module tb_switches_to_4seg();
	reg		[9:0] i_switch;
	wire	[0:6] o_HEX0, o_HEX1, o_HEX2, o_HEX3;
	wire	[9:0] o_LEDR;
	
	switches_to_4seg DUT(
	.i_switch(i_switch),
	.o_LEDR(o_LEDR),
	.o_HEX0(o_HEX0),
	.o_HEX1(o_HEX1),
	.o_HEX2(o_HEX2),
	.o_HEX3(o_HEX3)
	);
	
	initial begin
		$monitor($time, "i_switch = %b, o_HEX0 = %b, o_HEX1 = %b, o_HEX2 = %b, o_HEX3 = %b", i_switch, o_HEX0, o_HEX1, o_HEX2, o_HEX3);
			i_switch = 10'b0000111111; 
		#20 i_switch = 10'b0111011111; 
		#20 i_switch = 10'b1011111011; 
		#20 i_switch = 10'b1100000011; 
		#20 $stop;
	end
endmodule