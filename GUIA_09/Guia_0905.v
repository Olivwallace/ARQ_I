/**
 * @file Guia_0905.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

/*
05) Projetar e descrever em Verilog um módulo gerador de pulso (pulse) com marcação igual
a 2 unidades de tempo, sincronizado com a borda de subida do gerador do Guia_09001.v.
O nome do arquivo deverá ser Guia_0905.v.
Incluir previsão de testes e verificação da carta de tempo usando GTKWave.
DICA: Usar always @(posedge clk).

*/

`include "clock.v"
`include "pulsos.v"
`include "uteis.v"

//Teste do Modulo
module Guia_0905;
    wire clock;
    wire [4: 0] count;
    clock clk(clock);
    contador COUNT(.clock(clock), .data(count));

    wire pulseA;
    pulse_2UT P1(clock, pulseA);

    initial begin
        $dumpfile("Guia_0905.vcd");
        $dumpvars(1, clock, count, pulseA);

        #376 $finish;
    end
endmodule