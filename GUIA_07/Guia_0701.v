/**
 * @file Guia_0701.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

/*
01.) Projetar e descrever em Verilog, usando portas nativas, inicialmente, uma unidade lógica (LU) com operações AND e NAND, com duas saídas 
independentes (paralelas, 2 respostas),  para variáveis de entrada com 01 com bit cada. Acrescentar a separação que permita apenas uma saída 
selecionável (1 resposta), segundo escolha feita por uma chave de seleção. O nome do arquivo deverá ser Guia_0701.v, e poderá seguir o modelo 
descrito abaixo.

Incluir previsão de testes.
Simular o módulo no Logisim e apresentar layout do circuito e subcircuitos.
DICA: Usar para o sinal extra para a seleção (0-NAND;1-AND).
*/

`timescale 1ps/1ps
`include "MultiMux.v"

module GUIA_0701;

    // ------------------------- Dados
    reg x, y, key;
    wire sAND, sNAND, sMUX;

    and A(sAND, x, y);
    nand B(sNAND, x, y);
    mux_2x1 MUX(sMUX, sAND, sNAND, key);


    //Inicializacao de Valores
    initial begin
        x=1'b0; y=1'b0; key=1'b0;
    end


    // ------------------------- Principal
    initial begin: main;

        $display("Guia_0701 - Teste");
        $display("MUX 2x1 (0 - AND | 1 - NAND)\n");

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
