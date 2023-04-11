/**
 * @file pulsos.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Geradores Pulsos - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

//-------------------- GUIA_0901
 //Gerador de Pulso
module pulse(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #3  sgn = 1'b0;
        #3  sgn = 1'b1;
        #3  sgn = 1'b0;
    end

endmodule

//-------------------- GUIA_0902
//Gerador de Pulso A
module pulseA(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #4  sgn = 1'b0;
        #4  sgn = 1'b1;
        #4  sgn = 1'b0;
        #4  sgn = 1'b1;
        #4  sgn = 1'b0;
    end
endmodule

//Gerador de Pulso B
module pulseB(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #5  sgn = 1'b0;
    end
endmodule

//Gerador de Pulso C
module pulseC(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #15  sgn = 1'b0;
        #15  sgn = 1'b1;
    end
endmodule

//Gerador de Pulso D
module pulseD(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #20  sgn = 1'b0;
        #20  sgn = 1'b1;
        #20  sgn = 1'b0;
    end
endmodule

//-------------------- GUIA_0903
//Gerador de Pulso de 1 terco da frequencia
module pulse_1TF(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #8  sgn = 1'b0;
        #8  sgn = 1'b1;
        #8  sgn = 1'b0;
    end
endmodule

//-------------------- GUIA_0904
//Gerador de Pulso de 4 vezes a frequencia
module pulse_4F(input clock, output sgn);
    reg sgn;

    always @(clock) begin
            sgn = 1'b1;
        #6  sgn = 1'b0;
        #6  sgn = 1'b1;
        #6  sgn = 1'b0;
    end
endmodule

//-------------------- GUIA_0905
//Gerador de Pulso de 4 vezes a frequencia
module pulse_2UT(input clock, output sgn);
    reg sgn;

    always @(posedge clock) begin
        sgn = 1'b1;
        #12 sgn = 1'b1;
        #12 sgn = 1'b0; 
    end
endmodule