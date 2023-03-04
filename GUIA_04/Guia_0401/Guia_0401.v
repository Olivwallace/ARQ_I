/**
 * @file Guia_0401.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 04 Exercicio 01 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 03-03-2023
 */

 module QuestaoA(output S, input x, y, z);
    assign S = ~x & ~( ~y | z);
 endmodule

 module QuestaoB(output S, input x, y, z);
    assign S = ~( x | ~y) & ~z;
 endmodule

 module QuestaoC(output S, input x, y, z);
    assign S = ~( ~x & y) & z;
 endmodule

 module QuestaoD(output S, input x, y, z);
    assign S = (x & ~y) & ~z;
 endmodule

 module QuestaoE(output S, input x, y, z);
    assign S = (~x | ~y) & (~y | ~z);
 endmodule