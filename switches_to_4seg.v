module switches_to_4seg(i_switch, o_LEDR, o_HEX0, o_HEX1, o_HEX2, o_HEX3);
	input [9:0] i_switch;
	output [9:0] o_LEDR;
	output [0:6] o_HEX0, o_HEX1, o_HEX2, o_HEX3;
	
	wire [1:0] M0, temp1, temp2, temp3;
	
	switches_to_LED L0(
	.i_switch(i_switch),
	.o_LEDR(o_LEDR)
	);
	
	mux_2bit_4to1 U0(
	.S(i_switch[9:8]), 
	.U(i_switch[7:6]), 
	.V(i_switch[5:4]), 
	.W(i_switch[3:2]), 
	.X(i_switch[1:0]),
	.M(M0)
	);
	
	char_7seg H0(
	.C(M0), 
	.Display(o_HEX0)
	);
	
	assign temp1 = M0 + 1'b1;
	
	char_7seg H1(
	.C(temp1), 
	.Display(o_HEX1)
	);
	
	assign temp2 = temp1 + 1'b1;
	
	char_7seg H2(
	.C(temp2), 
	.Display(o_HEX2)
	);
	
	assign temp3 = temp2 + 1'b1;
	
	char_7seg H3(
	.C(temp3), 
	.Display(o_HEX3)
	);
	
endmodule

module mux_2bit_4to1(S, U, V, W, X, M);
	input [1:0] S, U, V, W, X;
	output [1:0] M;
	wire [3:0] temp;
	
	assign temp[0] = (~S[0] & U[0]) | (S[0] & V[0]);
	assign temp[1] = (~S[0] & U[1]) | (S[0] & V[1]);
	assign temp[2] = (~S[0] & W[0]) | (S[0] & X[0]);
	assign temp[3] = (~S[0] & W[1]) | (S[0] & X[1]);
	
	assign M[0] = (~S[1] & temp[0]) | (S[1] & temp[2]);
	assign M[1] = (~S[1] & temp[1]) | (S[1] & temp[3]);
endmodule

module char_7seg(C, Display);
	input[1:0] C;
	output [0:6] Display;
		assign Display = (C == 2'b00) ? 7'b0100001:
						 (C == 2'b01) ? 7'b0000110:
						 (C == 2'b10) ? 7'b1001111:
										7'b0000001;
	
endmodule

module switches_to_LED(i_switch, o_LEDR);
	input [9:0] i_switch;
	output [9:0] o_LEDR;
		assign o_LEDR = i_switch;
endmodule