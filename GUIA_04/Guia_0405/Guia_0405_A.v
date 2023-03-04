/**
 * @file Guia_0405_A.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

`timescale 1ps/1ps
 `include "Guia_0405.v"

 module Guia_0405_A;
    reg x, y;
    wire s1, s2;

    //Instanciamento
    Questao_A A (s1, s2, x, y);

    //Inicializacao de Valores
    initial begin
        x = 1'b0; y = 1'b0;
    end

    //Principal
    initial begin : main
        
        
        $display("Teste Guia_0405 - Expressao Booleana - A");

        //Monitoramento
        $display("|  x  y |  (SoP) |  (PoS) |");
        $monitor("| %2b %2b |   %2b   |   %2b   |", x, y, s1, s2);

        //Sinalizacao
        #1 x=0; y=0; //0
        #1 x=0; y=1; //1
        #1 x=1; y=0; //2
        #1 x=1; y=1; //3
    end

 endmodule