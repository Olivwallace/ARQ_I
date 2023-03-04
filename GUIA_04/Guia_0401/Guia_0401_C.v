/**
 * @file Guia_0401_C.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

`timescale 1ps/1ps
 `include "Guia_0401.v"

 module Guia_0401_C;
    reg x, y, z;
    wire s1;

    //Instanciamento
    QuestaoC QUESTAOC (s1, x, y, z);

    //Inicializacao de Valores
    initial begin
        x = 1'b0; y = 1'b0; z = 1'b0;
    end

    //Principal
    initial begin : main
        
        
        $display("Teste Guia_0401 - Expressao Booleana - C");
        
        //Questao C;
        $display("\nc) ( x' . y )' . z = S\n");
        
        //Monitoramento
        $display(" x  y  z |  S");
        $monitor("%2b %2b %2b | %2b", x, y, z, s1);


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