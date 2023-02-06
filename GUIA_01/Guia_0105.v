/**
 * @file Guia_0105.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 01 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-02-2023
 */

/*
 Guia_0105.v
 999999 - Xxx Yyy Zzz
*/
module Guia_0105;

    integer file_out; // Arquivo de saída
    
    // define data
    integer i, j, c = 0;
    reg [0:9][7:0] str_a = "PUC-Minas"; // char array[9]
    reg [0:7][7:0] str_b = "02-2023"; // char array[7]
    reg [0:14][7:0] str_c = "Belo Horizonte"; //char array[14]
    reg [0:6][7:0] str_d;
    reg [0:6][7:0] ascii_hex = 48'h42726173696C; // char array[3] (3x8 bits - little Endian)
    
    // actions
    initial begin : main

        file_out = $fopen("Guia0105_out.txt", "w"); // Arquivo aberto para escrita.

        $display("Guia_0105 - Tests");

        $fwrite(file_out, "Guia_0105 - Resultado\n\n");
        
        //Imprime questao a
        $display("ASCII SIMB: %s\nASCII_HEX: %h", str_a, str_a);
        $fwrite(file_out, "ASCII SIMB: %s\nASCII_HEX: %h", str_a, str_a);
        
        //Imprime questao b
        $display("ASCII SIMB: %s\nASCII_HEX: %h", str_b, str_b);
        $fwrite(file_out, "\n\nASCII SIMB: %s\nASCII_HEX: %h", str_b, str_b);

        //Imprime questao c
        $display("ASCII SIMB: %s\nASCII_BIN:", str_c);
        $fwrite(file_out, "\n\nASCII SIMB: %s\nASCII_BIN:\n", str_c);
        for(i = 0; i < 2; i++)begin
            for(j = 0; j < 7; j++)begin
                $write("| %8b ", str_c[c]);
                $fwrite(file_out, "| %8b ", str_c[c]);
                c++;
            end
            $write("|\n");
            $fwrite(file_out, "|\n");
        end

        //imprime questao d
        str_d[0] = 8'o124;
        str_d[1] = 8'o141;
        str_d[2] = 8'o162;
        str_d[3] = 8'o144;
        str_d[4] = 8'o145;
        $display("ASCII_OCT: %o %o %o %o %o\nASCII_SIMB: %s", str_d[0], str_d[1], str_d[2], str_d[3], str_d[4], str_d);
        $fwrite(file_out, "\nASCII_OCT: %o %o %o %o %o\nASCII_SIMB: %s", str_d[0], str_d[1], str_d[2], str_d[3], str_d[4], str_d);

        //imprime questao e
        $display("ASCII_HEX: %h\nASCII_SIMB: %s", ascii_hex, ascii_hex);
        $fwrite(file_out, "\n\nASCII_HEX: %h\nASCII_SIMB: %s", ascii_hex, ascii_hex);

        $fclose(file_out);
    end // main

endmodule // Guia_0105