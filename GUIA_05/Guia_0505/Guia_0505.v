/**
 * @file Guia_0505.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 05 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-03-2023
 */

`timescale 1ps/1ps

module G0505_Exp(output s1, input x, y);
    xnor XNOR_XY(s1, x, y);
endmodule

module G0505_NOR(output s1, input x, y);
    wire nor_0, nor_1, nor_2;
    //X nor Y
    nor NOR_0(nor_0, x, y);
    
    //X and Y
    nor NOR_1(nor_1, x, nor_0);
    nor NOR_2(nor_2, nor_0, y);

    //NOT(X and Y)
    nor NOR_3(s1, nor_1, nor_2);
endmodule

module Guia_0505;
    
    // ------------------------- Dados
    reg x, y;
    wire a, b;
    G0505_Exp S1(a, x, y);
    G0505_NOR S2(b, x, y);

    // ------------------------- Incializacao
    initial begin;
        x = 1'b0; y = 1'b0;
    end
    
    // ------------------------- Principal
    initial
        begin : main
        $display("Guia_0503 - Teste");
        $display("\nS1 = ~(x & y) | s2 = nor(nor(x, nor(x,y)), nor(nor(x,y), y))\n");

        // projetar testes do modulo
        $display("|  x  y  | S1 | S2 |");
        $monitor("| %2b %2b  | %2b | %2b |", x, y, a, b);
        
        #1 x=0; y=0; //0
        #1 x=0; y=1; //1
        #1 x=1; y=0; //2
        #1 x=1; y=1; //3
    end
endmodule