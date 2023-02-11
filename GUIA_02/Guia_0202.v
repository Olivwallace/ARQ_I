/**
 * @file Guia_0202.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 02 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 10-02-2023
 */

 module Guia_0202;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída


    ///Tarefa para imprimir o valor de um decimal convertido para binário.
    ///@param valor: Valor decimal para ser impresso.
    task printf_Dec2Bin;
        input real valor;
        real copiaValor, power2;
        reg[15:0] valorBinario;

        begin
            power2 = 2**7;
            copiaValor = valor;
            valorBinario = 0;

            //Abre arquivo de saida
            file_out = $fopen("Guia_0202_out.txt", "a");
            
            //Realiza conversão da parte inteira 8bits e fracionaria 8bits;
            for(integer i = 15; i > 0; i--)begin   
                if(valor - power2 >= 0)begin
                    valorBinario[i] = 1;
                    valor = valor - power2;
                end else begin
                    valorBinario[i] = 0;
                end
                power2 /= 2.0;
            end

            //Escreve no terminal
            $display("Decimal: %f | Binario: %8b.%8b", copiaValor, valorBinario[15:8],valorBinario[7:0]);

            //Escreve em arquivo
            $fwrite(file_out, "Decimal: %f | Binario: %8b.%8b\n", copiaValor, valorBinario[15:8],valorBinario[7:0]);
            $fclose(file_out);
        end

    endtask

    
    // Vetor de valores a ser convertidos - 5 * 16bit's
    real valores [(num_entradas - 1):0];
    
    initial begin : main
        
        $display("Guia_0202 - Testes");

        file_out = $fopen("Guia_0202_out.txt", "a");
        $fwrite(file_out, "\t\t--------Resultado---------\n");
        $fclose(file_out);


        //Inicialização de valores a ser convertidos.
        valores[0] = 00.25000; //A - 0,2500 
        valores[1] = 00.37500; //B - 0,37500
        valores[2] = 02.87500; //C - 2,87500
        valores[3] = 03.03125; //D - 3,03125
        valores[4] = 11.62500; //E - 11,62500

        //Chamar tarefa para converter e imprimir binario convertido.
        for(integer i = 0; i < num_entradas; i++)begin
            printf_Dec2Bin(valores[i]);
        end

    end // main

 endmodule