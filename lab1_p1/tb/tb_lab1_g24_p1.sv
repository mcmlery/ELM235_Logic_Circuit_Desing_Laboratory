/* Hazirlayanlar:
* M.Cemal Eryigit
* Burak Kamil Ciftci
* ELM235 2021 Bahar Lab1 - Problem 1 Testbench
*/
`timescale 1ns/1ps
module tb_lab1_g24_p1 ();
logic A, B, C;
logic Y;
lab1_g24_p1 dut0(.A(A), .B(B), .C(C), .Y(Y));
initial begin
A=0; B=0; C=0; #10; //  wait 10 ns
A=0; B=0; C=1; #10; //  wait 10 ns
A=0; B=1; C=0; #10; //  wait 10 ns
A=0; B=1; C=1; #10; //  wait 10 ns
A=1; B=0; C=0; #10; //  wait 10 ns
A=1; B=0; C=1; #10; //  wait 10 ns
A=1; B=1; C=0; #10; //  wait 10 ns
A=1; B=1; C=1; #10; //  wait 10 ns

#20; // wait 20 ns after completion

$stop; // stop the simulation
end
endmodule