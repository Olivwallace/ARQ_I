/**
 * @file Guia_0501.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 05 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-03-2023
 */

`timescale 1ps/1ps

module G0501_Exp(output s1, input x, y);
    assign s1 = (~x & ~y);
endmodule

module G0501_NOR(output s1, input x, y);
    nor GATE(s1, x, y);
endmodule

module Guia_0501;
    
    // ------------------------- Dados
    reg x, y;
    wire a, b;
    G0501_Exp S1(a, x, y);
    G0501_NOR S2(b, x, y);

    // ------------------------- Incializacao
    initial begin;
        x = 1'b0; y = 1'b0;
    end
    
    // ------------------------- Principal
    initial
        begin : main
        $display("Guia_0501 - Teste");
        $display("\nS1 = (~x & ~y) | s2 = nor(x,y)\n");

        // projetar testes do modulo
        $display("|  x  y  | S1 | S2 |");
        $monitor("| %2b %2b  | %2b | %2b |", x, y, a, b);
        
        #1 x=0; y=0; //0
        #1 x=0; y=1; //1
        #1 x=1; y=0; //2
        #1 x=1; y=1; //3
    end
endmodule
