/**
 * @file Guia_0702.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

 /*
 02.) Projetar e descrever em Verilog, usando portas nativas, uma unidade lógica (LU) com operações OR e NOR, com uma saída 
 selecionável (1 resposta), para variáveis de entrada com 01 bit cada. O nome do arquivo deverá ser Guia_0702.v.

Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
DICA: Usar para o sinal extra para a seleção (0-NOR;1-OR).
*/

`timescale 1ps/1ps
`include "MultiMux.v"

module GUIA_0702;

    // ------------------------- Dados
    reg x, y, key;
    wire sOR, sNOR, sMUX;

    or A(sOR, x, y);
    nor B(sNOR, x, y);
    mux_2x1 MUX(sMUX, sOR, sNOR, key);


    //Inicializacao de Valores
    initial begin
        x=1'b0; y=1'b0; key=1'b0;
    end


    // ------------------------- Principal
    initial begin: main;

        $display("Guia_0702 - Teste");
        $display("MUX 2x1 (0 - OR | 1 - NOR)\n");

        // projetar testes do modulo
        $display("|  x  y  | KEY |  S |");
        $monitor("| %2b %2b  | %2b  | %2b |", x, y, key, sMUX);

        //Testes com MUX 0 - AND
        #1 x=1'b0; y=1'b1; key=1'b0;
        #1 x=1'b1; y=1'b0; key=1'b0;
        #1 x=1'b1; y=1'b1; key=1'b0;

        //Testes com MUX 1 - NAND
        #1 x=1'b0; y=1'b0; key=1'b1;
        #1 x=1'b0; y=1'b1; key=1'b1;
        #1 x=1'b1; y=1'b0; key=1'b1;
        #1 x=1'b1; y=1'b1; key=1'b1;
    end //main
endmodule 
