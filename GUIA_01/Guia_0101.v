/**
 * @file Guia_0101.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 01 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-02-2023
 */


//--------- Modulo

module Guia_0101;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos 
    integer file_out; // Arquivo de saída

    //--------- Variaveis
    reg [15:0] binary; // 16bits 0000_0000_0000_0000
    integer decimal [(num_entradas - 1):0]; //Array de decimais.

    
    initial begin : main
        
        file_out = $fopen("Guia0101_out.txt", "w"); // Arquivo aberto para escrita.
        decimal[0] = 23;
        decimal[1] = 56;
        decimal[2] = 731;
        decimal[3] = 321;
        decimal[4] = 360;


        $display("Guia_0101 - Tests");

        $fwrite(file_out, "Guia_0101 - Resultado\n\n");
        
        for(integer i = 0; i < num_entradas; i = i + 1) begin
            binary = 0; // Resetar a cada repetição o valor do binario
            
            $display("Decimal = %3d", decimal[i]);
            $display("Binario inicial = %8b", binary);
            
            binary = decimal[i];

            $display("Binario apos atribuicao = %8b", binary);
            $fwrite(file_out, "%3d --> %4b %4b %4b %4b\n", decimal[i], binary[15:12],binary[12:8], binary[7:4], binary[3:0]); // Salva o valor encontrado em arquivo de saida.
        end;
            
        $fclose(file_out);
    end; // main
endmodule
