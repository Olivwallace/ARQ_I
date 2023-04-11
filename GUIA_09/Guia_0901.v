/**
 * @file Guia_0901.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

 /*
 01)  Projetar e descrever em Verilog módulos geradores de pulso (pulse) e gatilho (trigger).
O nome do arquivo deverá ser Guia_0901.v. Incluir previsão de testes e verificação da carta de tempo usando GTKWave.
*/

`include "clock.v"
`include "pulsos.v"
`include "uteis.v"

//Teste do Modulo
module Guia_0901;
    wire clock;
    wire [4: 0] count;
    clock clk(clock);
    contador COUNT(.clock(clock), .data(count));


    reg key;
    wire pulse1, trigger1;

    pulse P1(clock, pulse1);
    trigger T1(clock, key, trigger1);

    initial begin
        key = 1'b0;
    end

    initial begin
        $dumpfile("Guia_0901.vcd");
        $dumpvars(1, clock, count, pulse1, key, trigger1);

        #060 key = 1'b1;
        #120 key = 1'b0;
        #180 key = 1'b1;
        #240 key = 1'b0;
        #300 key = 1'b1;
        #360 key = 1'b0;
        #376 $finish;
    end
endmodule
