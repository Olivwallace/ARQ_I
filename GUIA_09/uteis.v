/**
 * @file uteis.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Uteis - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

//Gerador de Trigger
module trigger(input clock, input key, output sgn);
    reg sgn;

    always @(posedge clock & key) begin
        #60 sgn = 1'b1;
        #60 sgn = 1'b0;
    end

endmodule

//Contador de ciclos de clock
module contador (input clock, output reg[4: 0] data = 4'b0);
    
    always @(negedge clock) begin
        data = data + 4'b1;
    end

endmodule