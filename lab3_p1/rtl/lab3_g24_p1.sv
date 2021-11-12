
module lab3_g24_p1(
    input logic clk, reset, en, yon,
    input logic [7:0]psc,
    output logic tick


);
	 logic  done;
logic  [7:0] count;
logic  [7:0] cnt;

always_ff @ (posedge clk )
begin
if(!yon) 
    begin
     if(en)
         begin
            if(psc==count)
                begin
                    tick<=1;
                end
            else
                begin
                    count<=count+1'b1;
                    tick<=0;
                end
         end     
        else if(!reset)
                count <= 8'b00000000;
    end    
else if(yon) 

begin
    
    if(en==1)
    begin
        if(done==0)
        begin
           // cnt<=psc;
            done<=1;
        end
        if(done==1 )
           // cnt=cnt-1'b1; 
        if(cnt==0 && done==1)
        begin
            tick<=1;
            done<=0;
        end
    end
            else if (!reset)
                cnt<=8'b00000000;


end
end
endmodule

