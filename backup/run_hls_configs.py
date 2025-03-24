import os
import subprocess

# Path to the header file where TERMS, N, and ES are defined
header_file = "C:\Users\Burak\Desktop\TAU\HLS\PositFFT\PositFFT/posit.hpp"
tcl_script = "C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/run_hls.tcl"  # Path to your TCL script

# List of (N, ES) pairs to test
N_ES_combinations = [(32, 0), (32, 1), (32, 2), (28, 0), (28, 1), (28, 2), (24, 0), (24, 1)]
TERMS_values = [2, 3, 4]

def modify_header(terms, n, es):
    """Modifies posit.hpp to update TERMS, N, and ES values."""
    if not os.path.exists(header_file):
        print("Error: The header file {} does not exist.".format(header_file))
        return

    with open(header_file, "r") as file:
        lines = file.readlines()
    
    with open(header_file, "w") as file:
        for line in lines:
            if line.startswith("#define TERMS"):
                file.write("#define TERMS {}\n".format(terms))
            elif line.startswith("#define N"):
                file.write("#define N {}\n".format(n))
            elif line.startswith("#define ES"):
                file.write("#define ES {}\n".format(es))
            else:
                file.write(line)

def run_vitis_hls():
    """Runs Vitis HLS with the configuration file."""
    if not os.path.exists(tcl_script):
        print("Error: TCL script {} does not exist.".format(tcl_script))
        return
    
    command = "vitis-run --mode hls --tcl {}".format(tcl_script)
    print("Executing: {}".format(command))
    os.system(command)

# Iterate over all (TERMS, N, ES) configurations
for terms in TERMS_values:
    for n, es in N_ES_combinations:
        print("Running HLS for: TERMS={}, N={}, ES={}".format(terms, n, es))
        modify_header(terms, n, es)
        run_vitis_hls()