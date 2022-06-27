//Modulo de cedulas entradas -- Decodificador de cedula
//entrada_nota -> Valor inserido de cedula 
//state_entrada ->Estado Atual
//valor_saida -> Saida do valor de cédulas correspondentes
//erro_code - > Proximo estado
//ok -> Confirmação de cedula

module entrada_cedula(
	
	input ok,
	input [2:0] state_entrada,
	output reg atividade,
	input [2:0]entrada_nota,
	output reg [7:0]valor_saida,
	output reg [2:0] erro_code
);

parameter zero =3'b000, dois=3'b001, cinco =3'b010, dez=3'b011, vinte = 3'b100, cinquenta = 3'b101, cem =3'b110, duzentos = 3'b111;

always @(entrada_nota, ok)
begin
	if ((state_entrada == 3'b000) && (ok))
		begin 
			case(entrada_nota)
				zero:
					begin
					valor_saida = 8'b00000000;
					erro_code = 3'b000;
					atividade =1;
					end
				dois:
					begin
					valor_saida = 8'b00000010;
					erro_code = 3'b000;
					atividade=1;
					end
				cinco:
					begin
					valor_saida = 8'b00000101;
					erro_code = 3'b000;
					atividade=1;
					end

				dez:
					begin
					valor_saida = 8'b00001010;
					erro_code=3'b000;
					atividade=1;
					end
				
				vinte:
					begin
					valor_saida = 8'b00010100;
					erro_code = 3'b001;
					atividade=1;
					end

				cinquenta:
					begin
					valor_saida= 8'b00110010;
					erro_code = 3'b001;
					atividade=1;
					end
				
				cem:
				begin
					valor_saida=8'b01100100;
					erro_code = 3'b001;
					atividade=1;
				 end
				duzentos:
				begin
						 valor_saida=8'b11001000;
						 erro_code = 3'b001;
						 atividade=1;
				end
				default:
				begin
					valor_saida = 8'b00000000;
					erro_code = 3'b001;
					atividade=1;
				end
					
				endcase
		end
		
	if ((state_entrada == 3'b000) && (!ok))
		begin 
			case(entrada_nota)
				zero:
					begin
					valor_saida = 8'b00000000;
					erro_code = 3'b000;
					atividade =0;
					end
				dois:
					begin
					valor_saida = 8'b00000010;
					erro_code = 3'b000;
					atividade=1;
					end
				cinco:
					begin
					valor_saida = 8'b00000101;
					erro_code = 3'b000;
					atividade=1;
					end

				dez:
					begin
					valor_saida = 8'b00001010;
					erro_code=3'b000;
					atividade=1;
					end
				
				vinte:
					begin
					valor_saida = 8'b00010100;
					erro_code = 3'b001;
					atividade=1;
					end

				cinquenta:
					begin
					valor_saida= 8'b00110010;
					erro_code = 3'b001;
					atividade=1;
					end
				
				cem:
				begin
					valor_saida=8'b01100100;
					erro_code = 3'b001;
					atividade=1;
				 end
				duzentos:
				begin
						 valor_saida=8'b11001000;
						 erro_code = 3'b001;
						 atividade=1;
				end
				default:
				begin
					valor_saida = 8'b00000000;
					erro_code = 3'b001;
					atividade=0;
				end
					
				endcase
	end	

else
		begin
			valor_saida=8'b00000000;
			erro_code = 3'b000;
			atividade=1;
		end
end

endmodule
