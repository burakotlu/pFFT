# Launch Vitis
launch_vitis

# Set the workspace directory (adjust to your workspace location)
#set_workspace C:\Users\Burak\Desktop\TAU\HLS\PositFFT\PositFFT

# Open the component (replace "PositFFT" with your component's name)
open_component -reset C:\Users\Burak\Desktop\hls_component -flow_target vitis

# Set the top function (entry point)
#set_top pFFT

# Add the necessary source files
#add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit.hpp
#add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_lib.cpp

# Add the testbench
#add_files -tb C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_fft_test.cpp

# Set the FPGA part (adjust the part to match your target)
#set_part xazu3teg-sfvc784-1Q-q

# Run the C simulation
#csim_design

# Optionally, close the component after simulation
#close_component
