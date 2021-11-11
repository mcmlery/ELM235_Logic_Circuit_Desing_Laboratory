`timescale 1ns/1ps

module tb_lab2_g24_p2 ();

    logic clk;
    logic [31:0] a, b;
    logic [2:0] op;
    logic [31:0] s, sexp;
    logic n, z, v, c, nexp, zexp, vexp, cexp;
    logic hata;
    lab2_g24_p2  dut0(.clk(clk), .a(a), .b(b), .op(op), .out(s), .n(n), .z(z), .v(v), .c(c), .hata(hata));
    initial
    begin
        
        int fd;
        static int flagerr = 0, serr = 0, ntest = 0;
        fd = $fopen ("lab2_p2_testvector.txt", "r");
        if (fd) begin
            while (!$feof(fd)) begin
                $fscanf(fd, "%b,%b,%b,%b,%b,%b,%b,%b",a, b, op, sexp, nexp, zexp, vexp, cexp); #10;
                if (s !== sexp) begin
                    serr++; // sonuc hatalarini say
                    $display("s icin yanlis deger, op: %b, beklenen: %b, devre: %b", op, sexp, s);
                    $display("|--> a: %b, b: %b", a, b);
                end
                if ({n, z, v, c} !== {nexp, zexp, vexp, cexp}) begin
                    flagerr++; // carry hatalarini say
                    $display("nzvc icin yanlis deger, op: %b, beklenen nzvc: %b,%b,%b,%b, devre: %b,%b,%b,%b", op, nexp, zexp, vexp, cexp, n, z, v, c);
                    $display("|--a: %b, b: %b, s: %b", a, b, s);
                end
                ntest++;
            end

            $display("Simulasyon tamamlandi. %d farkli testte, toplamda %d sonuc hatasi, %d flag hatasi mevcut", ntest, serr, flagerr);
        end
        else
            $display("dosyayi acamadik");
        $fclose(fd);
        $stop;
    end
endmodule