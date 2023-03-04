/**
 * @file Guia_0402.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 02 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

 module Questao_A(output S1, S2, input x, y);
    assign S1 = ~x & ~(x | y);
    assign S2 = ~x & ~y;
 endmodule

 module Questao_B(output S1, S2, input x, y);
    assign S1 = (~x | ~y) | (~x & y);
    assign S2 = ~x | ~y;
 endmodule

 module Questao_C(output S1, S2, input x, y);
    assign S1 = ~(x & ~y) & (~x | y);
    assign S2 = ~x | y;
 endmodule

 module Questao_D(output S1, S2, input x, y);
    assign S1 = ~(~x & y) | ~(~x | y);
    assign S2 = (x | ~y);
 endmodule

 module Questao_E(output S1, S2, input x, y);
    assign S1 =  ~(~y | x) & (y | ~x);
    assign S2 = y & ~x;
 endmodule