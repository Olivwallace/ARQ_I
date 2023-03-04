/**
 * @file Guia_0303.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 03 Exercicio 03 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 23-02-2023
 */

 module Guia_0303;
    
    //--------- Arquivos
    integer file_out; // Arquivo de saída

    reg[4:0] valor_a;
    reg[5:0] valor_b, valor_c;
    reg[6:0] valor_d, valor_e;

    initial begin : main
        file_out = $fopen("Guia0303_out.txt", "w"); // Arquivo aberto para escrita.
        
        $display ( "Guia_0303 - Testes" );
        $fwrite(file_out, "Guia_0303 - Resultado\n\n");

        valor_a = 5'b10111;
        valor_b = 6'b110001;
        valor_c = 6'b110111;
        valor_d = 7'b1010011;
        valor_e = 7'b1011001;

        //Obtem valor_a positivo em base 10
        $display("Valor : %1b %4b", valor_a[4], valor_a[3:0]);
        $fwrite(file_out, "Valor : %1b %4b\n", valor_a[4], valor_a[3:0]);
        valor_a = (~valor_a + 1);
        $display("Valor Positivo em Decimal: %d", valor_a);
        $fwrite(file_out, "Valor Positivo em Decimal: %d\n\n", valor_a);

        //Obtem valor_b positivo em base 10
        $display("Valor : %1b %5b", valor_b[5], valor_b[4:0]);
        $fwrite(file_out, "Valor : %1b %5b\n", valor_b[5], valor_b[4:0]);
        valor_b = (~valor_b + 1);
        $display("Valor Positivo em Decimal: %d", valor_b);
        $fwrite(file_out, "Valor Positivo em Decimal: %d\n\n", valor_b);

        //Obtem valor_c positivo em base 2
        $display("Valor : %1b %5b", valor_c[5], valor_c[4:0]);
        $fwrite(file_out, "Valor : %1b %5b\n", valor_c[5], valor_c[4:0]);
        valor_c = (~valor_c + 1);
        $display("Valor Positivo em Binario: %1b %5b", valor_c[5], valor_c[4:0]);
        $fwrite(file_out, "Valor Positivo em Binario: %1b %5b\n\n", valor_c[5], valor_c[4:0]);

        //Obtem valor_d positivo em base 2
        $display("Valor : %1b %2b_%4b", valor_d[6], valor_d[5:4], valor_d[3:0]);
        $fwrite(file_out, "Valor : %1b %2b_%4b\n", valor_d[6], valor_d[5:4], valor_d[3:0]);
        valor_d = (~valor_d + 1);
        $display("Valor Positivo em Binario: %1b %2b_%4b", valor_d[6], valor_d[5:4], valor_d[3:0]);
        $fwrite(file_out, "Valor Positivo em Binario: %1b %2b_%4b\n\n", valor_d[6], valor_d[5:4], valor_d[3:0]);

        //Obtem valor_e positivo em base 16
        $display("Valor : %1b %2b_%4b", valor_e[6], valor_e[5:4], valor_e[3:0]);
        $fwrite(file_out, "Valor : %1b %2b_%4b\n", valor_e[6], valor_e[5:4], valor_e[3:0]);
        valor_e = (~valor_e + 1);
        $display("Valor Positivo em Hexa: %h", valor_e);
        $fwrite(file_out, "Valor Positivo em Hexa: %h\n\n", valor_e);

        $fclose(file_out);

    end //main

 endmodule