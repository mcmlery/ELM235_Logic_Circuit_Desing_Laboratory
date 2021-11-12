module tb_lab3_g24_p1();
logic [7:0]count;
logic  [7:0] psc;
logic clk,reset,en,tick,yon,done;

lab3_g24_p1 dut0 ( .count(count), .yon(yon), .en(en), .clk(clk), .reset(reset), .psc(psc), .tick(tick), .done(done));

initial begin
en=0; reset =1;  #10;
reset =0; tick=0; #10;
count =0; #10;
done=0; #10;
en=1; 
end
always begin
clk=0; #5;
clk=1; #5;
end
always begin
yon=1; psc <= 8'b00101001; #1000;

$stop;
end
endmodule
