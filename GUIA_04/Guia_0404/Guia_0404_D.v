/**
 * @file Guia_0404_D.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

`timescale 1ps/1ps
 `include "Guia_0404.v"

 module Guia_0404_D;
 reg x, y, w, z;
    wire s1;

    //Instanciamento
    Questao_D D (s1, x, y, w, z);

    //Inicializacao de Valores
    initial begin
        x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;
    end

    //Principal
    initial begin : main
        
        
        $display("Teste Guia_0404 - Expressao Booleana - D");
        
        //Questao D;
        $display("\nd) F (X,Y,W,Z) = P(M) ( 1, 2, 4, 6, 8, 10, 12 ) \n");
        
        //Monitoramento
        $display("|  x  y  w  z |  S  |");
        $monitor("| %2b %2b %2b %2b | %2b  |", x, y, w, z, s1);

         //Sinalizacao
        #1 x=0; y=0; w=0; z=0; //0
        #1 x=0; y=0; w=0; z=1; //1
        #1 x=0; y=0; w=1; z=0; //2
        #1 x=0; y=0; w=1; z=1; //3
        #1 x=0; y=1; w=0; z=0; //4
        #1 x=0; y=1; w=0; z=1; //5
        #1 x=0; y=1; w=1; z=0; //6
        #1 x=0; y=1; w=1; z=1; //7
        #1 x=1; y=0; w=0; z=0; //8
        #1 x=1; y=0; w=0; z=1; //9
        #1 x=1; y=0; w=1; z=0; //A
        #1 x=1; y=0; w=1; z=1; //B
        #1 x=1; y=1; w=0; z=0; //C
        #1 x=1; y=1; w=0; z=1; //D
        #1 x=1; y=1; w=1; z=0; //E
        #1 x=1; y=1; w=1; z=1; //F
    end

 endmodule