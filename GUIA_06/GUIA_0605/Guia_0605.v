/**
 * @file Guia_0605.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 06 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 12-03-2023
 */

module Questao(output S1, input x, y, z);
    assign S1 = (x & ~y) | (x & ~z);
endmodule

`timescale 1ps/1ps

 module Guia_0605;
 reg x, y, z;
    wire s1;

    //Instanciamento
    Questao S (s1, x, y, z);

    //Inicializacao de Valores
    initial begin
        x = 1'b0; y = 1'b0; z = 1'b0;
    end

    //Principal
    initial begin : main
        
        
        $display("Teste Guia_0605 - Tabela Verdade De Expressao  Obtida - Mapa Veitch-Karnaugh");
        
        //Questao B;
        $display("\nExpressao(MINTERMOS): S(m)( 4, 5, 6 ) = (xy') + (xz')\n");
        
        //Monitoramento
        $display("|  x  y  z |  S  |");
        $monitor("| %2b %2b %2b | %2b  |", x, y, z, s1);

         //Sinalizacao
        #1 x=0; y=0; z=0; //0
        #1 x=0; y=0; z=1; //1
        #1 x=0; y=1; z=0; //2
        #1 x=0; y=1; z=1; //3
        #1 x=1; y=0; z=0; //4
        #1 x=1; y=0; z=1; //5
        #1 x=1; y=1; z=0; //6
        #1 x=1; y=1; z=1; //7
    end

 endmodule