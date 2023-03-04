/**
 * @file Guia_0302.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 03 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 23-02-2023
 */

 module Guia_0302;
    
    //--------- Arquivos
    integer file_out; // Arquivo de saída

    reg[5:0] valor_a, valor_c;
    reg[7:0] valor_b, valor_e;
    reg[11:0] valor_d;

    initial begin : main
        file_out = $fopen("Guia0302_out.txt", "w"); // Arquivo aberto para escrita.

        $display ( "Guia_0302 - Testes" );
        $fwrite(file_out, "Guia_0302 - Resultado\n\n");
        
        valor_a[5:4] = 1; valor_a[3:2] = 3; valor_a[1:0] = 2;
        valor_b = 8'h4D;
        valor_c[5:4] = 3; valor_c[3:2] = 1; valor_c[1:0] = 2;
        valor_d = 12'o0175;
        valor_e = 8'hC4; 

        //Converte valor_a para complemento de 1
        $display("Valor : %d%d%d", valor_a[5:4], valor_a[3:2], valor_a[1:0]);
        $fwrite(file_out, "Valor : %d%d%d\n", valor_a[5:4], valor_a[3:2], valor_a[1:0]);
        valor_a = ~valor_a;
        $display("Em Complemento de 1: %1b %5b", valor_a[5], valor_a[4:0]);
        $fwrite(file_out, "Em Complemento de 1: %1b %5b\n\n", valor_a[5], valor_a[4:0]);

        //Converte valor_b para complemento de 1
        $display("Valor : %h", valor_b);
        $fwrite(file_out, "Valor : %h\n", valor_b);
        valor_b = ~valor_b;
        $display("Em Complemento de 1: %1b %3b_%4b", valor_b[7], valor_b[6:4], valor_b[3:0]);
        $fwrite(file_out, "Em Complemento de 1: %1b %3b_%4b\n\n", valor_b[7], valor_b[6:4], valor_b[3:0]);

        //Converte valor_c para complemento de 2
        $display("Valor : %d%d%d", valor_c[5:4], valor_c[3:2], valor_c[1:0]);
        $fwrite(file_out, "Valor : %d%d%d\n", valor_c[5:4], valor_c[3:2], valor_c[1:0]);
        valor_c = (~valor_c + 1);
        $display("Em Complemento de 2: %1b %5b", valor_c[5], valor_c[4:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %5b\n\n", valor_c[5], valor_c[4:0]);

        //Converte valor_d para complemento de 2
        $display("Valor : %o", valor_d);
        $fwrite(file_out, "Valor : %o\n", valor_d);
        valor_d = (~valor_d + 1);
        $display("Em Complemento de 2: %1b %5b_%4b", valor_d[9], valor_d[8:4], valor_d[3:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %5b_%4b\n\n", valor_d[9], valor_d[8:4], valor_d[3:0]);

        //Converte valor_e para complemento de 2
        $display("Valor : %h", valor_e);
        $fwrite(file_out, "Valor : %h\n", valor_e);
        valor_e = (~valor_e + 1);
        $display("Em Complemento de 2: %1b %3b_%4b", valor_e[7], valor_e[6:4], valor_e[3:0]);
        $fwrite(file_out, "Em Complemento de 2: %1b %3b_%4b\n\n", valor_e[7], valor_e[6:4], valor_e[3:0]);


        $fclose(file_out);

    end //main
 endmodule