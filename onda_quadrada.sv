module onda_quadrada(
    input  logic clk,
    input  logic[19:0] N,
    output logic audio_saida
	 );

logic [19:0] contador_N;

always_ff @(posedge clk) begin
    if(N == 20'd0) begin
        contador_N <= 20'd0;
        audio_saida <= 1'b0;
    end
    else begin
        if (contador_N >= N - 1) begin
            contador_N <= 20'd0;
            audio_saida <= ~audio_saida;
        end
        else begin
            contador_N <= contador_N + 1;
        end
    end
end


endmodule