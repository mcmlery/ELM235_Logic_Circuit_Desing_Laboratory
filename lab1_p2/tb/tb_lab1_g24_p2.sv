`timescale 1ns/1ps
module tb_lab1_g24_p2 ();
    logic [3:0] a, b;
    logic cin;
    logic [3:0] s;
    logic cout;
    lab1_g24_p2  dut0(.a(a), .b(b), .cin(cin), .cout(cout), .sum2(s));
    initial
    begin
        for (int c=0; c<2; c++) begin
            cin = c;
            for (int i=0; i<2**4-1; i++) begin
                for (int j=0; j<2**4-1; j++) begin
                    a = i; b = j;
                    #10;
                end
            end
        end
        $stop;
    end
endmodule