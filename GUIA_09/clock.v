/**
 * @file clock.v
 * @author 784778 - Wallace Freitas Oliveira (https://github.com/Olivwallace)
 * @brief Guia 09 Gerador Clock - Arquitetura de Computadores I (PUC-Minas 1°/2023)
 * @date 02-04-2023
 */

 //Gerador de Clock
module clock(output clk);
    
    reg clk;
    
    initial begin
        clk = 1'b0;    
    end

    always begin
        #12 clk = ~clk;
    end

endmodule