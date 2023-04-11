/**
 * @file Guia_0705.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

 /*
05.) Projetar e descrever em Verilog, usando portas nativas, uma unidade lógica (LU) com o acréscimo das operações
NOT, AND, NAND, XOR, XNOR, OR, NOR, simultâneas, com apenas 1 saída, selecionável (7x1).
O nome do arquivo deverá ser Guia_0705.v.
Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
DICA: Usar um sinal extra de 3 bits para a seleção.
Sobrará uma chave de seleção, e poderá ser empregada para a negação de outro operando.
 */

`timescale 1ps/1ps
`include "MultiMux.v"

module GUIA_0705;

    // ------------------------- Dados
    reg x, y, keyA, keyB, keyC;
    wire sNOT_X, sNOT_Y, sAND, sNAND, sXOR, sXNOR, sOR, sNOR; 
    wire sMUX;

    not A(sNOT_X, x);
    not B(sNOT_Y, y);
    and C(sAND, x, y);
    nand D(sNAND, x, y);
    xor E(sXOR, x, y);
    xnor F(sXNOR, x, y);
    or G(sOR, x, y);
    nor H(sNOR, x, y);


    mux_8x1 MUX(sMUX, sNOT_Y, sNOT_X, sAND, sNAND, sXOR, sXNOR, sOR, sNOR, keyA, keyB, keyC);

    //Inicializacao de Valores
    initial begin
        x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b0; keyC=1'b0;
    end


    // ------------------------- Principal
    initial begin: main;

        $display("Guia_0704 - Teste");
        $display("USANDO 1 MUX 4x1\n(000 - NOT Y | 001 - NOT X | 010 - AND | 011 - NAND | 100 - XOR | 101 - XNOR | 110 - OR | 111 - NOR)\n");
        
        // projetar testes do modulo
        $display("|  x  y  |  KEYS A B C  |  S |");
        $monitor("| %2b %2b  |   %2b %2b %2b   | %2b |", x, y, keyA, keyB, keyC, sMUX);

        //Testes com MUX 000 - NOT Y
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b0; keyC=1'b0;
        
        //Testes com MUX 001 - NOT X
        #1 x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b0; keyC=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b0; keyC=1'b1;

        //Testes com MUX 010 - AND
        #1 x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b1; keyC=1'b0;
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b1; keyC=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b1; keyC=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b1; keyC=1'b0;

        //Testes com MUX 011 - NAND
        #1 x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b1; keyC=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b1; keyC=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b1; keyC=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b1; keyC=1'b1;

        //Testes com MUX 100 - XOR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b0; keyC=1'b0;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b0; keyC=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b0; keyC=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b0; keyC=1'b0;

        //Testes com MUX 101 - XNOR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b0; keyC=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b0; keyC=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b0; keyC=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b0; keyC=1'b1;

        //Testes com MUX 110 - OR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b1; keyC=1'b0;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b1; keyC=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b1; keyC=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b1; keyC=1'b0;

        //Testes com MUX 110 - NOR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b1; keyC=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b1; keyC=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b1; keyC=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b1; keyC=1'b1;

    end //main
endmodule
