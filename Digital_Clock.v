module Digital_Clock(
    input Clk_1sec,      // Clock with 1 Hz frequency
    input reset,         // Active high reset
    input [4:0] init_hours,    // Initial hours value
    input [5:0] init_minutes,  // Initial minutes value
    input [5:0] init_seconds,  // Initial seconds value
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours
);

// Clock logic
always @(posedge Clk_1sec or posedge reset) begin
    if (reset == 1'b1) begin
        // Reset to initial time values
        seconds <= init_seconds;
        minutes <= init_minutes;
        hours <= init_hours;
    end
    else begin
        // Increment seconds
        seconds <= seconds + 1;
        
        // Check if seconds reached 60
        if (seconds == 59) begin
            seconds <= 0;
            minutes <= minutes + 1;
            
            // Check if minutes reached 60
            if (minutes == 59) begin
                minutes <= 0;
                hours <= hours + 1;
                
                // Check if hours reached 24
                if (hours == 23) begin
                    hours <= 0;
                end
            end
        end
    end
end

endmodule
