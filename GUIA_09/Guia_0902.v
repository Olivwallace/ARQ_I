/**
 * @file Guia_0902.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

/*
 02)  Projetar e descrever em Verilog módulos geradores de pulso (pulse) com períodos diferentes.
O nome do arquivo deverá ser Guia_0902.v.
Incluir previsão de testes e verificação da carta de tempo usando GTKWave.
*/

`include "clock.v"
`include "pulsos.v"
`include "uteis.v"

//Teste do Modulo
module Guia_0902;
    wire clock;
    wire [4: 0] count;
    clock clk(clock);
    contador COUNT(.clock(clock), .data(count));

    wire pulseA, pulseB, pulseC, pulseD;

    pulseA P1(clock, pulseA);
    pulseB P2(clock, pulseB);
    pulseC P3(clock, pulseC);
    pulseD P4(clock, pulseD);

    initial begin
        $dumpfile("Guia_0902.vcd");
        $dumpvars(1, clock, count, pulseA, pulseB, pulseC, pulseD);

        #376 $finish;
    end
endmodule