module mux
(
    output logic [31:0] f,
    input  logic [31:0] a, b, c, d,
    input  logic [1:0]  sel
);
    logic [1:0]  n_sel;
    logic [31:0] f1, f2, f3, f4;
    logic sel0_and_sel1, nsel0_and_sel1, sel0_and_nsel1, nsel0_and_nsel1;

    not g_n0(n_sel[0], sel[0]);
    not g_n1(n_sel[1], sel[1]);

    and g_s0(nsel0_and_nsel1, n_sel[1], n_sel[0]); // sel == 00
    and g_s1(sel0_and_nsel1,  n_sel[1], sel[0]);   // sel == 01
    and g_s2(nsel0_and_sel1,   sel[1],  n_sel[0]); // sel == 10
    and g_s3(sel0_and_sel1,    sel[1],  sel[0]);   // sel == 11

    and g1[31:0](f1, a, nsel0_and_nsel1);
    and g2[31:0](f2, b, sel0_and_nsel1);
    and g3[31:0](f3, c, nsel0_and_sel1);
    and g4[31:0](f4, d, sel0_and_sel1);

    or  g_out[31:0](f, f1, f2, f3, f4);

endmodule