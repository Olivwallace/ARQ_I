/**
 * @file Guia_0404.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

 module Questao_A(output S1, input x, y, z);
    assign S1 = (x | ~y | z) & (x | ~y | ~z) & (~x | ~y |  z) & (~x | ~y | ~z);
 endmodule

 module Questao_B(output S1, input x, y, z);
    assign S1 = (x |  y |  z) & (x | ~y |  z) & (x | ~y | ~z) & (~x |  y | ~z) & (~x | ~y | ~z);
 endmodule

 module Questao_C(output S1, input x, y, w, z);
    assign S1 = (x|y|w|z) & (x|y|w|~z) & (x|y|~w|z) & (x|~y|w|z) & (x|~y|~w|z) 
                          & (~x|y|w|z) & (~x|y|~w|~z) & (~x|~y|~w|z);
 endmodule

 module Questao_D(output S1, input x, y, w, z);
    assign S1 = (x|y|w|~z) & (x|y|~w|z) & (x|~y|w|z) & (x|~y|~w|z) & (~x|y|w|z) 
                           & (~x|y|~w|z) & (~x|~y|w|z);
 endmodule

 module Questao_E(output S1, input x, y, w, z);
    assign S1 =  (x|y|w|z) & (x|y|w|~z) & (x|y|~w|z) & (x|y|~w|~z) & (x|~y|~w|~z) 
                           & (~x|y|~w|~z) & (~x|~y|~w|~z);
 endmodule