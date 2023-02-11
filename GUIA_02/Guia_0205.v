/**
 * @file Guia_0205.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 02 Exercicio 05 - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 10-02-2023
 */

 module Guia_0205;

    //--------- Constantes 
    parameter num_entradas = 5; // Constante literal referente ao numero de entradas.

    //--------- Arquivos
    integer file_out; // Arquivo de saída


    ///Tarefa para imprimir uma operação de soma entre dois valores binários.
    ///@param a: Operando um.
    ///@param b: Operando dois.
    task soma;
        input reg[15:0] a;
        input reg[15:0] b;
        reg[15:0] res;

        begin
            //Abre arquivo de saida
            file_out = $fopen("Guia_0205_out.txt", "a");

            res = a + b;

            //Escreve no terminal
            $display("  %4b_%4b.%4b_%4b\n+ %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);

            //Escreve em arquivo
            $fwrite(file_out, "  %4b_%4b.%4b_%4b\n+ %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);
            $fclose(file_out);
        end

    endtask

    ///Tarefa para imprimir uma operação de subtração entre dois valores binários.
    ///@param a: Operando um.
    ///@param b: Operando dois.
    task sub;
        input reg[15:0] a;
        input reg[15:0] b;
        reg[15:0] res;

        begin
            //Abre arquivo de saida
            file_out = $fopen("Guia_0205_out.txt", "a");

            res = a - b;

            //Escreve no terminal
            $display("  %4b_%4b.%4b_%4b\n- %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);

            //Escreve em arquivo
            $fwrite(file_out, "  %4b_%4b.%4b_%4b\n- %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);
            $fclose(file_out);
        end

    endtask

    ///Tarefa para imprimir uma operação de multiplicação entre dois valores binários.
    ///@param a: Operando um.
    ///@param b: Operando dois.
    task mult;
        input reg[15:0] a;
        input reg[15:0] b;
        reg[15:0] res;

        begin
            //Abre arquivo de saida
            file_out = $fopen("Guia_0205_out.txt", "a");

            res = a * b;

            //Escreve no terminal
            $display("  %4b_%4b.%4b_%4b\n* %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);

            //Escreve em arquivo
            $fwrite(file_out, "  %4b_%4b.%4b_%4b\n* %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);
            $fclose(file_out);
        end

    endtask

    ///Tarefa para imprimir uma operação de divisão entre dois valores binários.
    ///@param a: Operando um.
    ///@param b: Operando dois.
    task div;
        input reg[15:0] a;
        input reg[15:0] b;
        reg[15:0] res;

        begin
            //Abre arquivo de saida
            file_out = $fopen("Guia_0205_out.txt", "a");

            res = a / b;

            //Escreve no terminal
            $display("  %4b_%4b.%4b_%4b\n/ %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);

            //Escreve em arquivo
            $fwrite(file_out, "  %4b_%4b.%4b_%4b\n/ %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);
            $fclose(file_out);
        end

    endtask

    ///Tarefa para imprimir uma operação de modulo entre dois valores binários.
    ///@param a: Operando um.
    ///@param b: Operando dois.
    task mod;
        input reg[15:0] a;
        input reg[15:0] b;
        reg[15:0] res;

        begin
            //Abre arquivo de saida
            file_out = $fopen("Guia_0205_out.txt", "a");

            res = a % b;

            //Escreve no terminal
            $display("  %4b_%4b.%4b_%4b\n%% %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);

            //Escreve em arquivo
            $fwrite(file_out, "  %4b_%4b.%4b_%4b\n%% %4b_%4b.%4b_%4b \n----------------------\n  %4b_%4b.%4b_%4b\n\n", a[15:12], a[11:8], 
                a[7:4], a[3:0], b[15:12], b[11:8], b[7:4], b[3:0], res[15:12], res[11:8], res[7:4], res[3:0]);
            $fclose(file_out);
        end

    endtask

    
    // Vetor de valores a ser convertidos - 5 * 16bit's
    reg[15:0] valor_a, valor_b;
    
    initial begin : main
        
        $display("Guia_0205 - Testes");

        file_out = $fopen("Guia_0205_out.txt", "a");
        $fwrite(file_out, "\t\t--------Resultado---------\n");
        $fclose(file_out);

        //Questão A
        valor_a = 16'b00000101_01000000;
        valor_b = 16'b00000011_01100000;
        soma(valor_a, valor_b);

        //Questão B
        valor_a = 16'b00001001_01100000;
        valor_b = 16'b00000010_11000000;
        sub(valor_a, valor_b);

        //Questão C
        valor_a = 16'b00000100_10100000;
        valor_b = 16'b00000011_01000000;
        mult(valor_a, valor_b);

        //Questão D
        valor_a = 16'b00010110_11000000;
        valor_b = 16'b00000010_00100000;
        div(valor_a, valor_b);

        //Questão E
        valor_a = 16'b01101011_00000000;
        valor_b = 16'b00001011_00000000;
        mod(valor_a, valor_b);

    end // main

 endmodule