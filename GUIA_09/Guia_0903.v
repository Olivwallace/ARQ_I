/**
 * @file Guia_0903.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Exercicio 03 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

/*
 03) Projetar e descrever em Verilog um módulo gerador de pulso (pulse) com frequência igual
um terço da frequência (um terço do período) do gerador do Guia_0900.v.
O nome do arquivo deverá ser Guia_0903.v. Incluir previsão de testes e verificação da
carta de tempo usando GTKWave.
*/

`include "clock.v"
`include "pulsos.v"
`include "uteis.v"

//Teste do Modulo
module Guia_0903;
    wire clock;
    wire [4: 0] count;
    clock clk(clock);
    contador COUNT(.clock(clock), .data(count));

    wire pulseA;

    pulse_1TF P1(clock, pulseA);

    initial begin
        $dumpfile("Guia_0903.vcd");
        $dumpvars(1, clock, count, pulseA);


        #376 $finish;
    end
endmodule