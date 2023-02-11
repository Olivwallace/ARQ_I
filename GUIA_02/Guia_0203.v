/**
 * @file Guia_0203.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 02 Exercicio 03 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 10-02-2023
 */

 module Guia_0203;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída


    ///Tarefa para imprimir o valor de um binário convertido para quartenário.
    ///@param binario: Valor binario para ser impresso.
    task print_bin2quater;
        input reg[15:0] binario;

        begin
            file_out = $fopen("Guia_0203_out.txt", "a");

            $display("Binario: %8b.%8b | Quartenario: %d%d%d%d.%d%d%d%d", binario[15:8], binario[7:0], binario[15:14], binario[13:12], 
                    binario[11:10], binario[9:8],binario[7:6], binario[5:4], binario[3:2], binario[1:0]);

            $fwrite(file_out, "Binario: %8b.%8b | Quartenario: %d%d%d%d.%d%d%d%d\n", binario[15:8], binario[7:0], binario[15:14], 
                    binario[13:12], binario[11:10], binario[9:8],binario[7:6], binario[5:4], binario[3:2], binario[1:0]);
            $fclose(file_out);
        end
    endtask

    ///Tarefa para imprimir o valor de um binário convertido para octal.
    ///@param binario: Valor binario para ser impresso.
    task print_bin2oct;  
        input reg[15:0] binario;

        begin
            file_out = $fopen("Guia_0203_out.txt", "a");

            $display("Binario: %8b.%8b | Octal: %d%d%d.%d%d%d", binario[15:8], binario[7:0], binario[15:14], binario[13:11], 
                    binario[10:8], binario[7:5], binario[4:2], binario[1:0]);

            $fwrite(file_out, "Binario: %8b.%8b | Octal: %d%d%d.%d%d%d\n", binario[15:8], binario[7:0], binario[15:14], binario[13:11], 
                    binario[10:8], binario[7:5], binario[4:2], binario[1:0]);
            $fclose(file_out);
        end
    endtask

    ///Tarefa para imprimir o valor de um binário convertido para hexadecimal.
    ///@param binario: Valor binario para ser impresso.
    task print_bin2hex; 
        input reg[15:0] binario;

        begin
            file_out = $fopen("Guia_0203_out.txt", "a");

            $display("Binario: %8b.%8b | Hexa: 0%h.%h0", binario[15:8], binario[7:0], binario[15:8], binario[7:0]);

            $fwrite(file_out, "Binario: %8b.%8b | Hexa: 0%h.%h0\n", binario[15:8], binario[7:0], binario[15:8], binario[7:0]);
            $fclose(file_out);
        end
    endtask


    
    // Vetor de valores a ser convertidos - 5 * 16bit's
    reg[15:0] valores [(num_entradas - 1):0];
    
    initial begin : main
        
        $display("Guia_0203 - Testes");

        file_out = $fopen("Guia_0203_out.txt", "a");
        $fwrite(file_out, "\t\t--------Resultado---------\n");
        $fclose(file_out);


        //Inicialização de valores a ser convertidos.
        valores[0] = 16'b00000000_01001100; //A - 0,010011 (2) 
        valores[1] = 16'b00000000_10010100; //B - 0,100101 (2)
        valores[2] = 16'b00000000_10111000; //C - 0,101110 (2)
        valores[3] = 16'b00000001_11010100; //D - 1,110101 (2)
        valores[4] = 16'b00001101_11010000; //E - 1101,1101 (2)

        //Chamar tarefa para converter e imprimir binario convertido.
        print_bin2quater(valores[0]);
        print_bin2oct(valores[1]);
        print_bin2hex(valores[2]);
        print_bin2oct(valores[3]);
        print_bin2hex(valores[4]);

    end // main

 endmodule