/**
 * @file Guia_0904.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

/*
 04) Projetar e descrever em Verilog um módulo gerador de pulso (pulse) com frequência igual
quatro vezes a frequência (a quatro vezes o período)  do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0904.v.
Incluir previsão de testes e verificação da carta de tempo usando GTKWave.
*/

`include "clock.v"
`include "pulsos.v"
`include "uteis.v"

//Teste do Modulo
module Guia_0904;
    wire clock;
    wire [4: 0] count;
    clock clk(clock);
    contador COUNT(.clock(clock), .data(count));

    wire pulseA;

    pulse_4F P1(clock, pulseA);

    initial begin
        $dumpfile("Guia_0904.vcd");
        $dumpvars(1, clock, count, pulseA);

        #376 $finish;
    end
endmodule