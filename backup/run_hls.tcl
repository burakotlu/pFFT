open_project PositFFT 
open_solution test
set_top pFFT

# Add source files
add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit.hpp
add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_lib.cpp

# Add testbench file
add_files -tb C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_fft_test.cpp

# Set part (FPGA target)
#set_part xazu3teg-sfvc784-1Q-q

# Run C Simulation
csim_design

# Close project
close_project