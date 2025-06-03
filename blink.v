module Blink #(
    parameter CLK_FREQ = 25_000_000 
) (
    input wire clk,
    input wire rst_n,
    output reg [7:0] leds
);

localparam ONE_SECOND  = CLK_FREQ * 9 / 10;
localparam HALF_SECOND = CLK_FREQ * 2 / 10;

reg [31:0] counter;
reg state_on; 

always @(posedge clk) begin
    if (!rst_n) begin
        counter <= 0;
        leds <= 8'b00000000;
        state_on <= 1'b1; 
    end else begin
        counter <= counter + 1;

        if (state_on && counter >= ONE_SECOND) begin
            counter <= 0;
            state_on <= 0;
            leds[0] <= 0;  
        end else if (!state_on && counter >= HALF_SECOND) begin
            counter <= 0;
            state_on <= 1;
            leds[0] <= 1; 
        end
    end
end  
endmodule
