import os

def create_output_folder(terms, n, es, appr_tailor, in_size):
    appr_suffix = "APP" if appr_tailor == 1 else "NAPP"
    

    folder_path = "C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/TERMS_{0}_N_{1}_ES_{2}_SIZE_{3}_{4}".format(
        terms, n, es, in_size, appr_suffix)
    
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
        print("Created folder: {}".format(folder_path))
    else:
        print("Folder already exists: {}".format(folder_path))
    
    return folder_path

def modify_header(header_file, terms, n, es, appr_tailor, in_size):
    """Modifies posit.hpp to update TERMS, N, ES, IN_SIZE, and APPR_TAILOR values."""
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
            elif line.startswith("#define IN_SIZE"):
                file.write("#define IN_SIZE {}\n".format(in_size))  # Setting IN_SIZE parametric
            elif line.startswith("#define APPR_TAILOR"):
                file.write("#define APPR_TAILOR {}\n".format(appr_tailor))
            else:
                file.write(line)

def run_vitis_hls():
    """Runs Vitis HLS with the required setup."""
    vitis_commands = """
open_project PositFFT
open_solution test
set_top pFFT
add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit.hpp
add_files C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_lib.cpp
add_files -tb C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_fft_test.cpp
csim_design
close_project
"""
    tcl_script_path = "run_hls_commands.tcl"
    
    with open(tcl_script_path, "w") as tcl_file:
        tcl_file.write(vitis_commands)
    
    command = "vitis-run --mode hls --tcl {}".format(tcl_script_path)
    print("Executing: {}".format(command))
    os.system(command)
    
    os.remove(tcl_script_path)  

if __name__ == "__main__":
    header_file = "C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit.hpp"
    N_ES_combinations = [(32, 0), (32, 1), (32, 2), (28, 0), (28, 1), (28, 2), (24, 0), (24, 1)]
    TERMS_values = [2, 3, 4]
    IN_SIZE_values = [10]  
    
    for terms in TERMS_values:
        for n, es in N_ES_combinations:
            for appr_tailor in [0, 1]:  
                for in_size in IN_SIZE_values:  
                    print("Running for IN_SIZE={}, APPR_TAILOR={}".format(in_size, appr_tailor))
                    print("Running HLS for: TERMS={}, N={}, ES={}, APPR_TAILOR={}, IN_SIZE={}".format(terms, n, es, appr_tailor, in_size))
                    
                    # Create the output folder before running
                    output_folder = create_output_folder(terms, n, es, appr_tailor, in_size)
                    
                    modify_header(header_file, terms, n, es, appr_tailor, in_size)
                    run_vitis_hls()
