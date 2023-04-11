/**
 * @file MultiMux.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 07 Exercicio 00 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 19-03-2023
 */

module mux_2x1 (output s, input a, b, keySelect);
    //Definicaoo de dados locais
    wire notKey; 
    wire sa;
    wire sb;

    //Negacaoo de chave de seletora
    not NOT_S(notKey, keySelect);
    
    //Operacoes
    and AND_A(sa, a, notKey);
    and AND_B(sb, b, keySelect);

    //Retorno de Dado Selecionado
    or OR_AB(s, sa, sb); 
endmodule


module mux_4x1 (output s, input a, b, c, d, keySelect_A, keySelect_B);
    //Definicaoo de dados locais
    wire notKey_A, notKey_B; 
    wire sa, sb, sc, sd;

    //Negacaoo de chave de seletora
    not NOT_KA(notKey_A, keySelect_A);
    not NOT_KB(notKey_B, keySelect_B);

    //Operacoes
    and AND_A(sa, a, notKey_A, notKey_B);   
    and AND_B(sb, b, notKey_A, keySelect_B);
    and AND_C(sc, c, keySelect_A, notKey_B);   
    and AND_D(sd, d, keySelect_A, keySelect_B);       

    //Retorno de Dado Selecionado
    or OR_ABCD(s, sa, sb, sc, sd); 
endmodule

module mux_8x1 (output s, input a, b, c, d, e, f, g, h, keySelect_A, keySelect_B, keySelect_C);
    //Definicaoo de dados locais
    wire notKey_A, notKey_B, notKey_C; 
    wire sa, sb, sc, sd, se, sf, sg, sh;

    //Negacaoo de chave de seletora
    not NOT_KA(notKey_A, keySelect_A);
    not NOT_KB(notKey_B, keySelect_B);
    not NOT_KC(notKey_C, keySelect_C);

    //Operacoes
    and AND_A(sa, a, notKey_A, notKey_B, notKey_C);   
    and AND_B(sb, b, notKey_A, notKey_B, keySelect_C);
    and AND_C(sc, c, notKey_A, keySelect_B, notKey_C);
    and AND_D(sd, d, notKey_A, keySelect_B, keySelect_C);   
    and AND_E(se, e, keySelect_A, notKey_B, notKey_C);
    and AND_F(sf, f, keySelect_A, notKey_B, keySelect_C);
    and AND_G(sg, g, keySelect_A, keySelect_B, notKey_C);   
    and AND_H(sh, h, keySelect_A, keySelect_B, keySelect_C);

    //Retorno de Dado Selecionado
    or OR_ABCD(s, sa, sb, sc, sd, se, sf, sg, sh); 
endmodule