/**
 * @file Guia_0404_A.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

`timescale 1ps/1ps
 `include "Guia_0404.v"

 module Guia_0404_A;
    reg x, y, z;
    wire s1;

    //Instanciamento
    Questao_A A (s1, x, y, z);

    //Inicializacao de Valores
    initial begin
        x = 1'b0; y = 1'b0; z = 1'b0;
    end

    //Principal
    initial begin : main
        
        
        $display("Teste Guia_0404 - Expressao Booleana - A");
        
        //Questao A;
        $display("\na) F (X,Y,Z) = P(M) ( 2, 3, 6, 7 ) \n");
        
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