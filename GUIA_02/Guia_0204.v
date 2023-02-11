/**
 * @file Guia_0204.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 02 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 10-02-2023
 */

 module Guia_0204;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída


    ///Tarefa para imprimir o valor de um quartenário convertido para binário.
    ///@param binario: Valor binario para ser impresso.
    task print_quater2bin;
        input reg[15:0] binario;

        begin
            file_out = $fopen("Guia_0204_out.txt", "a");

            $display("Quartenario: %d%d%d%d.%d%d%d%d | Binario: %8b.%8b", binario[15:14], binario[13:12], binario[11:10], 
                    binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0], binario[15:8], binario[7:0]);

            $fwrite(file_out, "Quartenario: %d%d%d%d.%d%d%d%d | Binario: %8b.%8b\n", binario[15:14], binario[13:12], binario[11:10], 
                    binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0], binario[15:8], binario[7:0]);
            $fclose(file_out);
        end
    endtask

    ///Tarefa para imprimir o valor de um hexadecimal convertido para quartenário.
    ///@param binario: Valor binario para ser impresso.
    task print_hex2quater;
        input reg[15:0] binario;

        begin
            file_out = $fopen("Guia_0204_out.txt", "a");

            $display("Hexa: %h.%h | Quartenario: %d%d.%d%d%d%d%d%d", binario[15:12], binario[11:0],binario[15:14], binario[13:12], 
                        binario[11:10], binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0]);

            $fwrite(file_out, "Hexa: %8h.%8h | Quartenario: %d%d.%d%d%d%d%d%d\n", binario[15:12], binario[11:0],binario[15:14], binario[13:12], 
                        binario[11:10], binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0]);
            $fclose(file_out);
        end
    endtask

    ///Tarefa para imprimir o valor de um octal convertido para binário.
    ///@param binario: Valor binario para ser impresso.
    task print_oct2bin;
        input reg[15:0] binario;
        begin
            file_out = $fopen("Guia_0204_out.txt", "a");

            $display("Octal: %o.%o | Binario: %7b.%9b", binario[15:9], binario[8:0], binario[15:9], binario[8:0]);

            $fwrite(file_out, "Octal: %o.%o | Binario: %7b.%9b\n", binario[15:9], binario[8:0], binario[15:9], binario[8:0]);
            $fclose(file_out);
        end
    endtask

    ///Tarefa para imprimir o valor de um octal convertido para quartenário.
    ///@param binario: Valor binario para ser impresso.
    task print_oct2quater;
        input reg[15:0] binario;
        begin
            file_out = $fopen("Guia_0204_out.txt", "a");

            $display("Octal: %o.%o | Quartenario: 0%d%d.%d%d%d%d%d", binario[15:12], binario[11:0], binario [15:14], binario[13:12], 
                        binario[11:10], binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0]);

            $fwrite(file_out, "Octal: %o.%o | Quartenario: 0%d%d.%d%d%d%d%d\n", binario[15:12], binario[11:0], binario [15:14], binario[13:12], 
                        binario[11:10], binario[9:8], binario[7:6], binario[5:4], binario[3:2], binario[1:0]);
            $fclose(file_out);
        end
    endtask

    
    // Valores a ser convertidos - 16bit's
    reg[15:0] valor_a ,valor_b, valor_c, valor_d, valor_e;

    initial begin : main
        
        $display("Guia_0204 - Testes");

        file_out = $fopen("Guia_0204_out.txt", "a");
        $fwrite(file_out, "\t\t--------Resultado---------\n");
        $fclose(file_out);


        //Inicialização de valores a ser convertidos.
        valor_a[15:0] = 0; valor_a[7:6] = 1; valor_a[5:4] = 3; valor_a[3:2] = 2; //A - 0,132 (4)
        valor_b = 16'h02C9;                                                      //B - 0,2C9 (16)
        valor_c = 16'o0763;                                                      //C - 0,763 (8)
        valor_d = 16'o073210;                                                    //D - 7,321 (8)
        valor_e = 16'hAC64;                                                      //E - A,C64 (16)

        //Chamar tarefa para converter e imprimir binario convertido.
        print_quater2bin(valor_a);
        print_hex2quater(valor_b);
        print_oct2bin(valor_c);
        print_oct2quater(valor_d);
        print_hex2quater(valor_e);

    end // main

 endmodule