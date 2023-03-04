/**
 * @file Guia_0405.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

 module Questao_A(output SoP, Pos, input x, y);
    assign SoP = (~x & y) | (x & y);
    assign Pos = (x | y) & (~x | y);
 endmodule

 module Questao_B(output SoP, Pos, input x, y);
    assign SoP = (~x & ~y) | (~x & y) | (x & y);
    assign Pos = ~x | y;
 endmodule

 module Questao_C(output SoP, Pos, input x, y, z);
    assign SoP = (~x & ~y & ~z) | (~x & y & z) | (x & ~y & ~z) | (x & ~y & z) | (x & y & z);
    assign Pos = (x | y | ~z) & (x | ~y | z) & (~x | ~y | z);
 endmodule

 module Questao_D(output SoP, Pos, input x, y, z);
    assign SoP = (~x & ~y & ~z) | (~x & y & ~z) | (~x & y & z) | (x & ~y & z);
    assign Pos = (x | y | ~z) & (~x | y | z) & (~x | ~y | z) & (~x | ~y | ~z);
 endmodule

 module Questao_E(output SoP, Pos, input x, y, z);
    assign SoP = (~x & ~y & ~w & ~z) | (~x & ~y & ~w & z) | (~x & ~y & w & z) | 
                    (~x & y & ~w & z) | (~x & y & w & z) | (x & ~y & ~w & ~z) | 
                    (x & ~y & ~w &  z) | (x & ~y & w & ~z) | (x & y & w & ~z) | (~x & y & w & z);
    assign Pos = (x | y | ~w | z) & (x | ~y | w | z) & (x | ~y | ~w | z) & (~x | y | ~w | ~z) & (~x | ~y | w | z) & (~x | ~y | w | ~z);
 endmodule

