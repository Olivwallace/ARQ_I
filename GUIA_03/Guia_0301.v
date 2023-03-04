/**
 * @file Guia_0301.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 03 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 23-02-2023
 */

 module Guia_0301;
 
    //--------- Arquivos
    integer file_out; // Arquivo de saída

    reg[5:0] valor_a, valor_c;
    reg[6:0] valor_d;
    reg[7:0] valor_b, valor_e;

    initial begin : main
        file_out = $fopen("Guia0301_out.txt", "w"); // Arquivo aberto para escrita.
        
        $display ( "Guia_0301 - Testes" );
        $fwrite(file_out, "Guia_0301 - Resultado\n\n");

        valor_a = 6'b001011;
        valor_b = 8'b00001110;
        valor_c = 6'b101011;
        valor_d = 7'b0101101;
        valor_e = 8'b00111001;

        //Converte valor_a para complemento de 1
        $display("Valor : %1b %5b", valor_a[5], valor_a[4:0]);
        $fwrite(file_out, "Valor : %1b %5b\n", valor_a[5], valor_a[4:0]);
        valor_a = ~valor_a;
        $display("Em Complemento de 1: %1b %5b", valor_a[5], valor_a[4:0]);
        $fwrite(file_out, "Em Complemento de 1: %1b %5b\n\n", valor_a[5], valor_a[4:0]);

        //Converte valor_b para complemento de 1
        $display("Valor : %1b %3b_%4b", valor_b[7], valor_b[6:4], valor_b[3:0]);
        $fwrite(file_out, "Valor : %1b %3b_%4b\n", valor_b[7], valor_b[6:4], valor_b[3:0]);
        valor_b = ~valor_b;
        $display("Em Complemento de 1: %1b %3b_%4b", valor_b[7], valor_b[6:4], valor_b[3:0]);
        $fwrite(file_out, "Em Complemento de 1: %1b %3b_%4b\n\n", valor_b[7], valor_b[6:4], valor_b[3:0]);
        
        //Converte valor_c para complemento de 2
        $display("Valor : %1b %5b", valor_c[5], valor_c[4:0]);
        $fwrite(file_out, "Valor : %1b %5b\n", valor_c[5], valor_c[4:0]);
        valor_c = (~valor_c + 1);
        $display("Em Complemento de 2: %1b %5b", valor_c[5], valor_c[4:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %5b\n\n", valor_c[5], valor_c[4:0]);

        //Converte valor_d para complemento de 2
        $display("Valor : %1b %2b_%4b", valor_d[6], valor_d[5:4], valor_d[3:0]);
        $fwrite(file_out, "Valor : %1b %2b_%4b\n", valor_d[6], valor_d[5:4], valor_d[3:0]);
        valor_d = (~valor_d + 1);
        $display("Em Complemento de 2: %1b %2b_%4b", valor_d[6], valor_d[5:4], valor_d[3:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %2b_%4b\n\n", valor_d[6], valor_d[5:4], valor_d[3:0]);

        //Converte valor_e para complemento de 2
        $display("Valor : %1b %3b_%4b", valor_e[7], valor_e[6:4], valor_e[3:0]);
        $fwrite(file_out, "Valor : %1b %3b_%4b\n", valor_e[7], valor_e[6:4], valor_e[3:0]);
        valor_e = (~valor_e + 1);
        $display("Em Complemento de 2: %1b %3b_%4b", valor_e[7], valor_e[6:4], valor_e[3:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %3b_%4b\n\n", valor_e[7], valor_e[6:4], valor_e[3:0]);


        $fclose(file_out);

    end //main

 endmodule