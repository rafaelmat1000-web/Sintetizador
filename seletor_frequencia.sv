module seletor_frequencia(
input logic [3:0] notas,
input logic clk,
input logic trocar_notas,
output logic [3:0]  ledr,
output logic [19:0] N
);

wire nota_0_pressionada = ~notas[0];
wire nota_1_pressionada = ~notas[1];
wire nota_2_pressionada = ~notas[2];
wire nota_3_pressionada = ~notas[3];

assign ledr[0] = nota_0_pressionada;
assign ledr[1] = nota_1_pressionada;
assign ledr[2] = nota_2_pressionada;
assign ledr[3] = nota_3_pressionada;

// Fórmula: N = 50.000.000 / (2 * freq_nota) 
// N representa a quantidade de vezes que o clock ficou no 1 ou no 0 no intervalo de tempo de 50MHz

always_comb begin
	if(!(trocar_notas)) begin
			if(nota_0_pressionada) begin
				N = 20'd56818; //Lá (440Hz)
			end
			else if (nota_1_pressionada) begin
				N = 20'd63776; //Sol (392Hz)
			end
			else if (nota_2_pressionada) begin
				N = 20'd75843; //Mi (330Hz)
			end
			else if (nota_3_pressionada) begin
				N = 20'd95554; //Dó (261 Hz)
			end
			else begin
				N = 20'd0; //Sem som
			end
		end
	else begin
			if(nota_0_pressionada) begin
				N = 20'd43654; //Lá (440Hz)
			end
			else if (nota_1_pressionada) begin
				N = 20'd85132; //Ré(294Hz)
			end
			else if (nota_2_pressionada) begin
				N = 20'd71586; //Fá (349Hz)
			end
			else if (nota_3_pressionada) begin
				N = 20'd50619; //Sí (494 Hz)
			end
			else begin
				N = 20'd0; //Sem som
			end
		end
end
		
endmodule 
