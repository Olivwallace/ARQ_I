/**
 * @file Guia_0103.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 01 Exercicio 03 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-02-2023
 */

 module Guia0103;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos 
    integer file_out; // Arquivo de saída

    //--------- Tasks
    task print_dec2four; //Imprime na tela e em arquivo a conversao de um numero 'n' em base 4 com 8bits
        input integer decimal;
        reg [7:0] binary;

        begin
            file_out = $fopen("Guia0103_out.txt", "a");

            binary = decimal;
            $display("Valor: %4d (10) --> %d%d%d%d (4)", decimal, binary[7:6], binary[5:4], binary[3:2], binary[1:0]);

            $fwrite(file_out, "Valor: %4d (10) --> %d%d%d%d (4)\n", decimal, binary[7:6], binary[5:4], binary[3:2], binary[1:0]);
            $fclose(file_out);
        end
    endtask

    task print_dec2eight;  //Imprime na tela e em arquivo a conversao de um numero 'n' em base 8 com 16bits
        input integer decimal;
        reg [15:0] binary;

        begin
            file_out = $fopen("Guia0103_out.txt", "a");

            binary = decimal;
            $display("Valor: %4d (10) --> %o (8)", decimal, binary);

            $fwrite(file_out, "Valor: %4d (10) --> %o (8)\n", decimal, binary);
            $fclose(file_out);
        end
    endtask

    task print_dec2hex; //Imprime na tela e em arquivo a conversao de um numero 'n' em base 16 com 16bits
        input integer decimal;
        reg [15:0] binary;

        begin
            file_out = $fopen("Guia0103_out.txt", "a");
            
            binary = decimal;
            $display("Valor: %4d (10) --> %h (16)", decimal, binary);

            $fwrite(file_out, "Valor: %4d (10) --> %h (16)\n", decimal, binary);
            $fclose(file_out);
        end

    endtask
    //--------- End Tasks


    integer decimal [(num_entradas - 1):0]; //Array de decimais.

    initial begin : main
        $display("Guia_0103 - Tests");
        
        file_out = $fopen("Guia0103_out.txt", "w");
        $fwrite(file_out, "Guia_0103 - Resultado\n\n");
        $fclose(file_out);
        
        decimal[0] = 67;
        decimal[1] = 59;
        decimal[2] = 78;
        decimal[3] = 157;
        decimal[4] = 718;
        

        print_dec2four(decimal[0]);
        print_dec2eight(decimal[1]);
        print_dec2hex(decimal[2]);
        print_dec2hex(decimal[3]);
        print_dec2hex(decimal[4]);
    end
 endmodule
