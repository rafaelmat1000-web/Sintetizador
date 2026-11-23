module sintetizador (
    input  logic clk,
    input  logic [3:0] notas,
    input  logic trocar_notas, 
    output logic [3:0] ledr,
    output logic audio_saida,
	 input logic seletor_onda
);

    logic [19:0] N_Fio;
	 logic som_onda_triangular;
	 logic som_onda_quadrada;

    assign ledr = ~notas;

    seletor_frequencia u_seletor (
        .clk          (clk),
        .notas        (notas),
        .trocar_notas (trocar_notas),
        .N            (N_Fio)
    );

    onda_quadrada u_gerador_quad (
        .clk         (clk),
        .N           (N_Fio),
        .audio_saida (som_onda_quadrada)
    );
	 
	 onda_triangular u_gerador_triang (
			.clk         (clk),
			.N           (N_Fio),
		   .audio_saida (som_onda_triangular)
	 );
	 
assign audio_saida = seletor_onda ? som_onda_triangular : som_onda_quadrada;

endmodule
