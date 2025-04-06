`timescale 1ns/1ps

module Digital_Clock_tb;

// Inputs
reg Clk_1sec;
reg reset;
reg [4:0] init_hours;
reg [5:0] init_minutes;
reg [5:0] init_seconds;

// Outputs
wire [5:0] seconds;
wire [5:0] minutes;
wire [4:0] hours;

// Instantiate the Unit Under Test (UUT)
Digital_Clock uut (
    .Clk_1sec(Clk_1sec),
    .reset(reset),
    .init_hours(init_hours),
    .init_minutes(init_minutes),
    .init_seconds(init_seconds),
    .seconds(seconds),
    .minutes(minutes),
    .hours(hours)
);

// Set initial time
initial begin
    init_hours = 2;     // Set to 01 (or current hour)
    init_minutes = 52;  // Set to 35 (or current minute)
    init_seconds = 0;   // Set to 00 (or current second)
end

// Clock generation (1 Hz)
initial begin
    Clk_1sec = 0;
    forever #500 Clk_1sec = ~Clk_1sec; // 1000ms period (1Hz)
end

// Test scenario
initial begin
    // Initialize inputs
    reset = 1;
    
    // Apply reset for 100ms
    #100;
    reset = 0;
    
    // Run simulation for desired time (e.g., 2 minutes)
    #120000;
    $finish;
end

// Display time with 1-second delay
initial begin
    #1000; // Wait for first second
    forever begin
        $display("%02d:%02d:%02d", hours, minutes, seconds);
        #1000; // Wait for next second
    end
end

endmodule
