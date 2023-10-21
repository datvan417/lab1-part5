# lab1-part5

Consider the circuit shown in Figure 7. It uses a two-bit wide 4-to-1 multiplexer to enable the selection of four
characters that are displayed on a 7-segment display. Using the 7-segment decoder from Part IV this circuit can
display the characters d, E, 0, 1, 2, or ‘blank’ depending on your DE-series board. The character codes are set
according to Table 2 by using the switches SW7−0, and a specific character is selected for display by setting the
switches SW9−8.
An outline of the Verilog code that represents this circuit is provided in Figure 8. Note that we have used the
circuits from Parts III and IV as subcircuits in this code. You are to extend the code in Figure 8 so that it uses four
7-segment displays rather than just one. You will need to use four instances of each of the subcircuits. The purpose
of your circuit is to display any word on the four 7-segment displays that is composed of the characters in Table 2,
and be able to rotate this word in a circular fashion across the displays when the switches SW9−8 are toggled.
As an example, if the displayed word is dE10, then your circuit should produce the output patterns illustrated in
Table 3.

    SW9−8 Characters
      00 d E 1 0
      01 E 1 0 d
      10 1 0 d E
      11 0 d E 1
    Table 3: Rotating the word dE10 on four displays

Perform the following steps.
1. Create a new Quartus project for your circuit.
2. Include your Verilog module in the Quartus project. Connect the switches SW9−8 to the select inputs of each
of the four instances of the two-bit wide 4-to-1 multiplexers. Also connect SW7−0 to each instance of the
multiplexers as required to produce the patterns of characters shown in Table 2. Connect the SW switches
to the red lights LEDR, and connect the outputs of the four multiplexers to the 7-segment displays HEX3,
HEX2, HEX1, and HEX0.
3. Include the required pin assignments for your DE-series board for all switches, LEDs, and 7-segment displays. Compile the project.
4. Download the compiled circuit into the FPGA chip. Test the functionality of the circuit by setting the proper
character codes on the switches SW7−0 and then toggling SW9−8 to observe the rotation of the characters.
