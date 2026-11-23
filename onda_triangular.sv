module onda_triangular(
    input  logic clk,
    input  logic[19:0] N,
    output logic audio_saida
	 );

logic [19:0] contador_N; /// N/256 -> 256 = 2^(8)
logic [7:0] degrau; /// 255
logic [8:0] passo; /// 512
logic [7:0]  pwm;

always_ff @(posedge clk) begin
	if(N == 20'd0) begin
		contador_N <= 20'd0;
		audio_saida <= 1'b0;
		degrau <= 8'd0;
		passo <= 9'd0;
		pwm <= 8'd0;
    end
    else begin
		pwm <= pwm + 8'd1;
		audio_saida <= (pwm < degrau);
		
		if (contador_N >= (N>>9) - 20'd1) begin
			contador_N <= 20'd0;
			passo <= passo + 9'd1;
			
			if (passo < 9'd255) begin
				degrau <= degrau + 8'd1;
			end
			else if (passo > 9'd255) begin
				degrau <= degrau - 8'd1;
			end
		end
		else begin
			contador_N <= contador_N + 20'd1;
		end
	end
end

endmodule

