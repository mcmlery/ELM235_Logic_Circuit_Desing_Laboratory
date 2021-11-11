
module lab2_g24_p2 (
input logic [31:0] a, b,
input logic [ 2:0] op,
output logic [31:0] out,
output logic n, z, v, c,
output logic hata
);
assign n = (out[31]);
assign z = (out == 32'b0) ;
assign c = {~c, out} == (a + b);
assign v =(~(a[31]^b[31])^out[31]^c) ;
always_comb
begin

case(op)
3'b000:
out = a+b;
3'b001:
out = a-b;
3'b100:
out = a >> b;
3'b010:
out = a ^ b;
3'b101:
out = a << b;
3'b110:
out= a >>> b;
3'b011:
out = a | b;
3'b111:
out = a & b;
default:
hata=out?0:1;
endcase
end
endmodule