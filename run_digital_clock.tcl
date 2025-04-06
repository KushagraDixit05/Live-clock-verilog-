# Reset simulation
restart -f

# Run initial reset
run 1000 ns

# Run with 1-second real-time delay between outputs
for {set i 0} {$i < 100} {incr i} {
    # Run for one second of simulation time
    run 1000 ns
    
    # Pause for one second of real time
    after 1000
}

