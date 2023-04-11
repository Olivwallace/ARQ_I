/**
 * @file Guia_0704.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

 /*
 04.) Projetar e descrever em Verilog, usando portas nativas, uma unidade lógica (LU) com o acréscimo das operações
XOR e XNOR, , com uma saída só para ambas, para variáveis de entrada com 01 bit cada,  além de OR E NOR; na mesma 
situação. Os resultados de cada grupo serão selecionáveis  entre o grupo (XOR, XNOR) ou o grupo (OR, NOR), seleção (4x1).
O nome do arquivo deverá ser Guia_0704.v.
Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
DICA: Usar para o sinal extra de 2 bits para a seleção (00-XNOR; 01-XOR;10-NOR; 11-OR).
 */

`timescale 1ps/1ps
`include "MultiMux.v"

module GUIA_0704;

    // ------------------------- Dados
    reg x, y, keyA, keyB;
    wire sXOR, sXNOR, sOR, sNOR; 
    wire sMUX;

    xor A(sXOR, x, y);
    xnor B(sXNOR, x, y);
    or C(sOR, x, y);
    nor D(sNOR, x, y);

    mux_4x1 MUX(sMUX, sXOR, sXNOR, sOR, sNOR, keyA, keyB);

    //Inicializacao de Valores
    initial begin
        x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b0;
    end


    // ------------------------- Principal
    initial begin: main;

        $display("Guia_0704 - Teste");
        $display("USANDO 1 MUX 4x1, (00 - XOR | 01 - XNOR | 10 - OR | 11 - NOR)\n");

        // projetar testes do modulo
        $display("|  x  y  |  KEYS A B C |  S |");
        $monitor("| %2b %2b  |   %2b %2b   | %2b |", x, y, keyA, keyB, sMUX);

        //Testes com MUX 00 - XOR
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b0;

        //Teste com MUX 01 - XNOR
        #1 x=1'b0; y=1'b0; keyA=1'b0; keyB=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b0; keyB=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b0; keyB=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b0; keyB=1'b1;

        //Teste com MUX 10 - OR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b0;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b0;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b0;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b0;

        //Teste com MUX 11 - NOR
        #1 x=1'b0; y=1'b0; keyA=1'b1; keyB=1'b1;
        #1 x=1'b0; y=1'b1; keyA=1'b1; keyB=1'b1;
        #1 x=1'b1; y=1'b0; keyA=1'b1; keyB=1'b1;
        #1 x=1'b1; y=1'b1; keyA=1'b1; keyB=1'b1;
    end //main
endmodule
