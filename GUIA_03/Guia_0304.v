/**
 * @file Guia_0304.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 03 Exercicio 04 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 23-02-2023
 */

 module Guia_0304;
    
   //--------- Arquivos
   integer file_out; // Arquivo de saída

   reg[7:0] a, b, res;
   reg[11:0] a12, b12, res12;

   initial begin : main
      file_out = $fopen("Guia0304_out.txt", "w"); // Arquivo aberto para escrita.

      $display ( "Guia_0304 - Testes" );
      $fwrite(file_out, "Guia_0304 - Resultado\n\n");
      
      //Operacao a) 11100(2) - 1101(2) = x(2)
      a = 8'b11100; b = 8'b1101; res = a - b;
      
      $display("Operacao:\n  %4b_%4b \n- %4b_%4b\n-----------\n  %4b_%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], res[7:4], res[3:0]);
      $fwrite(file_out, "Operacao:\n  %4b_%4b \n- %4b_%4b\n-----------\n  %4b_%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], 
            res[7:4], res[3:0]);
      
      b =  (~b + 1);
      
      $display("Equivale:\n  %1b %3b_%4b \n+ %1b %3b_%4b\n------------\n  %1b %3b_%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      $fwrite(file_out, "Equivale:\n  %1b %3b_%4b \n+ %1b %3b_%4b\n------------\n  %1b %3b_%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      //Fim ------------- Operacao a


      //Operacao b) 101,0011(2) - 10,01(2) = x(2)
      a = 8'b01010011; b = 8'b00100100; res = a - b;

      $display("Operacao:\n  %4b,%4b \n- %4b,%4b\n-----------\n  %4b,%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], res[7:4], res[3:0]);
      $fwrite(file_out, "Operacao:\n  %4b,%4b \n- %4b,%4b\n-----------\n  %4b,%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], 
            res[7:4], res[3:0]);
      
      b =  (~b + 1);
      
      $display("Equivale:\n  %1b %3b,%4b \n+ %1b %3b,%4b\n------------\n  %1b %3b,%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      $fwrite(file_out, "Equivale:\n  %1b %3b,%4b \n+ %1b %3b,%4b\n------------\n  %1b %3b,%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      //Fim ------------- Operacao b


      //Operacao c) 213(4) - 123(4) = x (4)
      a[7:6] = 0; a[5:4] = 2; a[3:2] = 1; a[1:0] = 3; b[7:6] = 0; b[5:4] = 1; b[3:2] = 2; b[1:0] = 3; res = a - b; 
      
      $display("Operacao:\n  %d%d%d%d \n- %d%d%d%d\n------\n  %d%d%d%d\n", a[7:6], a[5:4], a[3:2], a[1:0], b[7:6], b[5:4], b[3:2], b[1:0],
         res[7:6], res[5:4], res[3:2], res[1:0]);
      $fwrite(file_out, "Operacao:\n  %d%d%d%d \n- %d%d%d%d\n------\n  %d%d%d%d\n", a[7:6], a[5:4], a[3:2], a[1:0], b[7:6], b[5:4], b[3:2], 
         b[1:0], res[7:6], res[5:4], res[3:2], res[1:0]);

      b =  (~b + 1);
      
      $display("Equivale:\n  %1b %3b,%4b \n+ %1b %3b,%4b\n------------\n  %1b %3b,%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      $fwrite(file_out, "Equivale:\n  %1b %3b,%4b \n+ %1b %3b,%4b\n------------\n  %1b %3b,%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
            res[7], res[6:4], res[3:0]);
      //Fim ------------- Operacao c


      //Operacao d) 213(8) - 123(8) = x (8)
      a12 = 12'o213; b12 = 12'o123; res12 = a12 - b12;

      $display("Operacao:\n  %o \n- %o\n------\n  %o\n", a12, b12, res12);
      $fwrite(file_out, "Operacao:\n  %o \n- %o\n------\n  %o\n", a12, b12, res12);

      b12 = (~b12 + 1);

      $display("Equivale:\n  %1b %3b_%4b_%4b \n+ %1b %3b_%4b_%4b\n------------\n  %1b %3b_%4b_%4b\n", a12[11], a12[10:8], a12[7:4], a12[3:0], 
         b12[11], b12[10:8], b12[7:4], b12[3:0], res12[11], res12[10:8], res12[7:4], res12[3:0]);
      $fwrite(file_out, "Equivale:\n  %1b %3b_%4b_%4b \n+ %1b %3b_%4b_%4b\n------------\n  %1b %3b_%4b_%4b\n\n", a12[11], a12[10:8], a12[7:4], 
         a12[3:0], b12[11], b12[10:8], b12[7:4], b12[3:0], res12[11], res12[10:8], res12[7:4], res12[3:0]);
      //Fim ------------- Operacao d


      //Operacao e) 9E1(16) - A1F(16) = x(16)
      a12 = 12'h9E1; b12 = 12'hA1F; res12 = a12 - b12;
      $display("Operacao:\n  %h \n- %h\n-----------\n  %h", a12, b12, res12);
      $fwrite(file_out, "Operacao:\n  %h \n- %h\n-----------\n  %h\n", a12, b12, res12);
      
      b12 = (~b12 + 1);

      $display("Equivale:\n  %1b %3b_%4b_%4b \n+ %1b %3b_%4b_%4b\n------------\n  %1b %3b_%4b_%4b\n", a12[11], a12[10:8], a12[7:4], a12[3:0], 
         b12[11], b12[10:8], b12[7:4], b12[3:0], res12[11], res12[10:8], res12[7:4], res12[3:0]);
      $fwrite(file_out, "Equivale:\n  %1b %3b_%4b_%4b \n+ %1b %3b_%4b_%4b\n------------\n  %1b %3b_%4b_%4b", a12[11], a12[10:8], a12[7:4], 
         a12[3:0], b12[11], b12[10:8], b12[7:4], b12[3:0], res12[11], res12[10:8], res12[7:4], res12[3:0]);
      //Fim ------------- Operacao e


      $fclose(file_out);

   end //main

 endmodule