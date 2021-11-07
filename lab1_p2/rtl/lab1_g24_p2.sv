/* Hazirlayanlar:
* M.Cemal Eryigit
* Burak Kamil Ciftci
* ELM235 2021 Bahar Lab1 - Problem 2
*/
module halfadder (
input logic a ,b,
output logic sum, carry
);
assign sum=a^b;
assign carry=a&b;
endmodule
module fulladder(
input logic a,b,cin,
output logic sum,cout
);
logic s1,c1,c2;
halfadder h1 (.a(a), .b(b), .sum(s1), .carry(c1));
halfadder h2(.a(s1), .b(cin), .sum(sum), .carry(c2));
assign cout = c1 | c2;
endmodule
module lab1_g24_p2(
input logic [3:0] a,b,cin,
output logic [3:0] sum2 , cout
);
logic v1,v2,v3,v4;
fulladder du1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum2[0]),.cout(v1));
fulladder du2(.a(a[1]),.b(b[1]),.cin(v1),.sum(sum2[1]),.cout(v2));
fulladder du3(.a(a[2]),.b(b[2]),.cin(v2),.sum(sum2[2]),.cout(v3));
fulladder du4(.a(a[3]),.b(b[3]),.cin(v3),.sum(sum2[3]),.cout(cout));
endmodule
