`timescale 1ns/1ps

module tb_mux;
    logic [5:0] count;
    logic [31:0] muxOut;
    logic [31:0] a, b, c, d;

    mux dut(.f(muxOut), .a(a), .b(b), .c(c), .d(d), .sel(count[1:0]));

    initial begin
        $monitor($time, " | a = %h | b = %h | c = %h | d = %h | sel = %b | muxOut = %h", 
                 a, b, c, d, count[1:0], muxOut);

        for (count = 0; count != 6'b010000; count++) begin
            a = (count + 1) * 32'h1111_1111;
            b = (count + 1) * 32'h2222_2222;
            c = (count + 1) * 32'h3333_3333;
            d = (count + 1) * 32'h4444_4444;
            #10;
        end

        #10 $stop;
    end

endmodule: tb_mux