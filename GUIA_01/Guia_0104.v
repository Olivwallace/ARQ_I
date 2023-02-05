/**
 * @file Guia_0104.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 01 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-02-2023
 */


module Guia0104;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída

    //--------- Tasks
    task print_groups_four; //Imprime no terminal e arquivo valor binario agrupado para conversao em base 4.
        input reg [7:0] binary;

        begin
            $display("Valor: %4b %4b (2) ==> [%b] [%b] [%b] [%b] ==> %d%d%d%d (4)", binary[7:4], binary[3:0], 
                    binary[7:6], binary[5:4], binary[3:2],  binary[1:0], binary[7:6], binary[5:4], binary[3:2],  binary[1:0]);
            
            file_out = $fopen("Guia0104_out.txt", "a");

            $fwrite(file_out, "Valor: %4b %4b (2) ==> [%b] [%b] [%b] [%b] ==> %d%d%d%d (4)\n", binary[7:4], binary[3:0], 
                    binary[7:6], binary[5:4], binary[3:2],  binary[1:0], binary[7:6], binary[5:4], binary[3:2],  binary[1:0]);
            $fclose(file_out);
        end
    endtask
    
    task print_groups_hex; //Imprime no terminal e arquivo valor binario agrupado para conversao em hexadecimal.
        input reg [7:0] binary;

        begin
            $display("Valor: %4b %4b (2) ==> [%4b] [%4b] ==> %h (16)", binary[7:4], binary[3:0], 
                    binary[7:4], binary[3:0], binary);
            
            file_out = $fopen("Guia0104_out.txt", "a");

            $fwrite(file_out, "Valor: %4b %4b (2) ==> [%4b] [%4b] ==> %h (16)\n", binary[7:4], binary[3:0], 
                    binary[7:4], binary[3:0], binary);
            $fclose(file_out);
        end
    endtask

    task print_groups_eight; //Imprime no terminal e arquivo valor binario agrupado para conversao em base 8.
        input reg [7:0] binary;

        begin
            $display("Valor: %4b %4b (2) ==> [0%2b] [%3b] [%3b] ==> %o (8)", binary[7:4], binary[3:0],
                    binary[7:6], binary[5:3], binary[2:0], binary);

            file_out = $fopen("Guia0104_out.txt", "a");

            $fwrite(file_out, "Valor: %4b %4b (2) ==> [0%2b] [%3b] [%3b] ==> %o (8)\n", binary[7:4], binary[3:0],
                    binary[7:6], binary[5:3], binary[2:0], binary);
            $fclose(file_out);
        end
    endtask
    //--------- End Tasks

    reg [7:0] file_data [(num_entradas - 1) : 0];

    initial begin : main;
        
        $display("Guia_0104 - Tests");

        $readmemb("Guia0104_in.txt", file_data, 0, 4); // Ler arquivo de entrada.
        file_out = $fopen("Guia0104_out.txt", "a"); // Arquivo aberto para escrita.
        $fwrite(file_out, "Guia_0104 - Resultado\n\n");
        $fclose(file_out);

        print_groups_four(file_data[0]);
        print_groups_eight(file_data[1]);
        print_groups_hex(file_data[2]);
        print_groups_eight(file_data[3]);
        print_groups_four(file_data[4]);
    end //main

endmodule
