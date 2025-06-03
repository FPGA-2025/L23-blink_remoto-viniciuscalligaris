`timescale 1ns/1ns
module tb();

reg clk, rst_n;
wire [7:0] leds;

initial begin
    $dumpfile("blink.vcd");
    $dumpvars;
    clk = 0;
    rst_n = 0;
    
    #2 rst_n = 1;
    #1000 
    $display("=== OK");
    $finish;
end

Blink #(
    .CLK_FREQ(50_000_000) // 50 MHz
) U1(
    .clk   (clk),
    .rst_n (rst_n),
    .leds   (leds)
);

always #1 clk = ~clk;

endmodule