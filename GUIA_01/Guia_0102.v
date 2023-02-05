/**
 * @file Guia_0102.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 01 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-02-2023
 */


//--------- Modulo

module Guia_0102;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_in; // Arquivo de entrada
    integer file_out; // Arquivo de saída

    //--------- Variaveis
    reg [7:0] binary [(num_entradas - 1):0]; // Array de 5 elementos de 8bits 0000_0000
    integer decimal; //Array de decimais.

    
    initial begin : main
        
        $readmemb("Guia0102_in.txt", binary); // Ler arquivo de entrada.
        file_out = $fopen("Guia0102_out.txt", "w"); // Arquivo aberto para escrita.


        $display("Guia_0102 - Tests");

        $fwrite(file_out, "Guia_0102 - Resultado\n\n");
        
        for(integer i = 0; i < num_entradas; i = i + 1) begin
            decimal = 0; // Resetar a cada repetição o valor do binario
            
            $display("Valor em binario = %4b %4b", binary[i][7:4], binary[i][3:0]);
            
            decimal = binary[i];
            
            $display("Valor em decimal = %4d", decimal);

            $fwrite(file_out, "%4b %4b --> %d\n", binary[i][7:4], binary[i][3:0], decimal); // Salva o valor encontrado em arquivo de saida.
        end;
            
        $fclose(file_in);
        $fclose(file_out);
    end; // main
endmodule
