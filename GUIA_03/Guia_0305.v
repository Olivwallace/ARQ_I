/**
 * @file Guia_0305.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 03 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 23-02-2023
 */

 module Guia_0305;
    
   //--------- Arquivos
   integer file_out; // Arquivo de saída

   task imprimeOperacaoByte;
   input reg[7:0] a, b;
   reg[7:0] res;

   begin
      res = a - b;

      file_out = $fopen("Guia0305_out.txt", "a");

      $display("Operacao:\n  %4b_%4b \n- %4b_%4b\n-----------\n  %4b_%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], res[7:4], res[3:0]);
      $fwrite(file_out, "Operacao:\n  %4b_%4b \n- %4b_%4b\n-----------\n  %4b_%4b\n", a[7:4], a[3:0], b[7:4], b[3:0], 
            res[7:4], res[3:0]);
      
      b =  (~b + 1);
      
      $display("Equivale:\n  %1b %3b_%4b \n+ %1b %3b_%4b\n------------\n  %1b %3b_%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], b[3:0], 
         res[7], res[6:4], res[3:0]);
      $fwrite(file_out, "\nEquivale:\n  %1b %3b_%4b \n+ %1b %3b_%4b\n------------\n  %1b %3b_%4b\n\n", a[7], a[6:4], a[3:0], b[7], b[6:4], 
         b[3:0], res[7], res[6:4], res[3:0]);

      $fclose(file_out);
   end
   endtask

   reg[7:0] a, b;

   initial begin : main
      file_out = $fopen("Guia0305_out.txt", "w"); // Arquivo aberto para escrita.

      $display ( "Guia_0305 - Testes" );
      $fwrite(file_out, "Guia_0305 - Resultado\n\n");
      $fclose(file_out);

      //Operacao a) 101101(2) – 1110(2) = x(2)
      a = 8'b101101; b = 8'b1110;
      imprimeOperacaoByte(a,b);
      //Fim Operacao A;

      //Operacao b) 101,1101(2) – 2,7(8) = x(2)
      a = 8'b1011101; b = 8'o27;
      imprimeOperacaoByte(a,b);
      //Fim Operacao B;

      //Operacao c) 132(4) – E(16) = x(2)
      a[7:6] = 0; a[5:4] = 1; a[3:2] = 3; a[1:0] = 2; b = 8'hE;
      imprimeOperacaoByte(a,b);
      //Fim Operacao C;

      //Operacao d) DA(16 ) – 1001001(2) = x(2)
      a = 8'hDA; b = 8'b1001001;
      imprimeOperacaoByte(a,b);
      //Fim Operacao D;

      //Operacao e) 40(10) – 2A(16) = x(2)
      a = 40; b = 8'h2A;
      imprimeOperacaoByte(a,b);
      //Fim Operacao E;

   end //main

 endmodule