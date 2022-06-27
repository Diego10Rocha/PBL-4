//Modulo de validacao da entradas de cedulas do sistema 
//Verificação de erro de time_out 
//entrada_nota -> valor da cedula 
//time_out -> verifica se houve erro de time_out, 1 se tiver
//state_entrada - >estado atual da maquina
//clear -> saida para limpar o cronometro
//erro_code -> codigo de erro


module validacao_entrada_cedula(
	
	input [7:0]entrada_nota,
	input atividade,
	input [2:0]erro,
	input time_out,
	input [2:0] state_entrada,
	output reg clear,
	output reg [2:0] erro_code,
	output reg [7:0]nota
);


always @(entrada_nota)
begin
//Sem atividade, atualizar contador, notificar a maquina para manter o estado
if ((atividade==0) && (state_entrada==3'b000) &&  (time_out==0) && (erro==3'b000))
begin
	clear = 1;
	nota = 8'd0;
	erro_code = erro;
	
end

//Erro de Cedula
if ((erro==3'b001) && (state_entrada ==3'b000))
begin
	clear = 0;
	nota = 8'd0;
	erro_code = erro;
end

//Erro de Time Out

if((time_out) && (erro==3'b000) && (state_entrada==3'b000) && (atividade==0))
begin
clear = 0;
nota = 8'd0;
erro_code = 3'b011;
end

//Com atividade, limpar o contador, notificar a maquina para manter o estado

if ((time_out==0) && (state_entrada==3'b000) && (erro==3'b000) && (atividade))
begin 
clear = 0;
nota = entrada_nota;
erro_code = erro;
end

end
endmodule


