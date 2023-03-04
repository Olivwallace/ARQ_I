/**
 * @file Guia_0504.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 05 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-03-2023
 */

`timescale 1ps/1ps

module G0504_Exp(output s1, input x, y);
    assign s1 = (~x & y);
endmodule

module G0504_NAND(output s1, input x, y);
    wire nand_1, nand_2;
    //NOT X
    nand NAND_1(nand_1, x, x); 
    //X' AND Y
    nand NAND_2(nand_2, nand_1, y);
    nand NAND_3(s1, nand_2, nand_2);
endmodule

module Guia_0504;
    
    // ------------------------- Dados
    reg x, y;
    wire a, b;
    G0504_Exp S1(a, x, y);
    G0504_NAND S2(b, x, y);

    // ------------------------- Incializacao
    initial begin;
        x = 1'b0; y = 1'b0;
    end
    
    // ------------------------- Principal
    initial
        begin : main
        $display("Guia_0504 - Teste");
        $display("\nS1 = (~x & y) | s2 = nand(nand(nand(x,x) , y) , nand(nand(x,x) , y) )\n");

        // projetar testes do modulo
        $display("|  x  y  | S1 | S2 |");
        $monitor("| %2b %2b  | %2b | %2b |", x, y, a, b);
        
        #1 x=0; y=0; //0
        #1 x=0; y=1; //1
        #1 x=1; y=0; //2
        #1 x=1; y=1; //3
    end
endmodule