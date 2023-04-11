/**
 * @file Guia_0703.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 03 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

/*
 03.) Projetar e descrever em Verilog, usando portas nativas, uma unidade lógica (LU) com o acréscimo das operações AND e NAND, 
com uma saída só para ambas, para variáveis de entrada com 01 bit cada,  além de OR e NOR na mesma situação. Os resultados de 
cada grupo serão selecionados por uma primeira chave (2x1); para selecionar uma porta em cada grupo, e outra chave (2x1) que 
selecionará entre o grupo (AND,NAND) ou o grupo (OR,NOR). O nome do arquivo deverá ser Guia_0703.v.
Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
DICA: Usar para um sinal para a seleção (0-portas NAND/NOR ; 1-AND/OR).
Usar para outro sinal para a seleção (0-grupo NAND/AND ; 1-NOR/OR).
*/

`timescale 1ps/1ps
`include "MultiMux.v"

module GUIA_0703;

    // ------------------------- Dados
    reg x, y, keyA, keyB;
    wire sOR, sNOR, sAND, sNAND; 
    wire sMUX1, sMUX2, sMUX_S;

    or A(sOR, x, y);
    nor B(sNOR, x, y);
    and C(sAND, x, y);
    nand D(sNAND, x, y);

    mux_2x1 MUX0(sMUX1, sNAND, sNOR, keyB);
    mux_2x1 MUX1(sMUX2, sAND, sOR, keyB);
    mux_2x1 MUX2(sMUX_S, sMUX1, sMUX2, keyA);

    //Inicializacao de Valores
    initial begin
        x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b0;
    end


    // ------------------------- Principal
    initial begin: main;

        $display("Guia_0703 - Teste");
        $display("USANDO 3 MUX 2x1, (0 - (0 - NAND | 1 - NOR) | 1 - (0 - AND | 1- OR))\n");

        // projetar testes do modulo
        $display("|  x  y  |  KEYS A B |  S |");
        $monitor("| %2b %2b  |   %2b %2b   | %2b |", x, y, keyA, keyB, sMUX_S);

        //Testes com MUX 00 - 
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b0;

        //Teste com MUX 01 - 
        #1 x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b1;

        //Teste com MUX 10 - 
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b0;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b0;

        //Teste com MUX 11 - 
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b1;
    end //main
endmodule 