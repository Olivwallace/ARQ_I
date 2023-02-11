/**
 * @file Guia_0201.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 02 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 10-02-2023
 */


 module Guia_0201;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída


    ///Tarefa para imprimir o valor de um binário convertido para decimal.
    ///@param valorBinario: Valor binario para ser impresso.
    task printf_Bin2Dec;
        input reg[15:0] valorBinario;
        real valor;
        real power2;

        begin
            valor = 0;
            power2 = 2**8; // Inicializa com 256 (inteiro maximo)

            //Abre arquivo de saida
            file_out = $fopen("Guia_0201_out.txt", "a");
            
            //Realiza conversão da parte inteira 8bits e fracionaria 8bits;
            for(integer i = 15; i >= 0; i--)begin   
                power2 = power2/2.0;

                if(valorBinario[i] == 1)begin
                    valor = valor + power2;
                end
            end

            //Escreve no terminal
            $display("Binario: %15b | Decimal: %f", valorBinario, valor);

            //Escreve em arquivo
            $fwrite(file_out, "Binario: %15b | Decimal: %f\n", valorBinario, valor);
            $fclose(file_out);
        end

    endtask

    
    // Vetor de valores a ser convertidos - 5 * 16bit's
    reg [15:0] valores [(num_entradas - 1):0];
    
    initial begin : main
        
        $display("Guia_0201 - Testes");

        file_out = $fopen("Guia_0201_out.txt", "a");
        $fwrite(file_out, "\t\t--------Resultado---------\n");
        $fclose(file_out);


        //Inicialização de valores a ser convertidos.
        valores[0] = 16'bxxxxxxxx_01011000; //A - 0,01011 
        valores[1] = 16'bxxxxxxxx_10101000; //B - 0,10101
        valores[2] = 16'bxxxxxxxx_11011000; //C - 0,11011
        valores[3] = 16'bxxxxxxx1_10001000; //D - 1,10001
        valores[4] = 16'bxxxxxx11_10010000; //E - 11,10010

        //Chamar tarefa para converter e imprimir binario convertido.
        for(integer i = 0; i < num_entradas; i++)begin
            printf_Bin2Dec(valores[i]);
        end

    end // main

 endmodule