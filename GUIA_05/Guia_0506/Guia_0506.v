/**
 * @file Guia_0506.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 05 Exercicio 06 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 04-03-2023
 */

`timescale 1ps/1ps

module G0506_Exp(output s1, input x, y);
    xor XOR_XY(s1, x, y);
endmodule

module G0506_NAND(output s1, input x, y);
    wire nand_0, nand_1, nand_2; 
    //X nand Y
    nand NAND_0(nand_0, x, y); 
    
    //X or Y
    nand NAND_1(nand_1, x, nand_0);
    nand NAND_2(nand_2, nand_0, y);

    //X and Y
    nand NAND_3(s1, nand_1, nand_2);    
endmodule

module Guia_0506;
    
    // ------------------------- Dados
    reg x, y;
    wire a, b;
    G0506_Exp S1(a, x, y);
    G0506_NAND S2(b, x, y);

    // ------------------------- Incializacao
    initial begin;
        x = 1'b0; y = 1'b0;
    end
    
    // ------------------------- Principal
    initial
        begin : main
        $display("Guia_0506 - Teste");
        $display("\nS1 = (x & y) | s2 = nand(nand(x,nand(x,y)),nand(nand(x,y), y))\n");

        // projetar testes do modulo
        $display("|  x  y  | S1 | S2 |");
        $monitor("| %2b %2b  | %2b | %2b |", x, y, a, b);
        
        #1 x=0; y=0; //0
        #1 x=0; y=1; //1
        #1 x=1; y=0; //2
        #1 x=1; y=1; //3
    end
endmodule