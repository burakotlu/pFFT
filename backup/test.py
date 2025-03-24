import subprocess
import os

# Path to your Vitis executable and your workspace or component
vitis_run_path = r"C:/Xilinx/Vitis/2024.2/bin/vitis"

# Path to the directory containing your workspace/component
workspace_dir = r"C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT"

# Function to launch Vitis with vitis-run
def launch_vitis():
    # Ensure the workspace directory exists
    if not os.path.exists(workspace_dir):
        print("Error: The workspace directory {} does not exist.".format(workspace_dir))
        return

    # Build the command
    command = [vitis_run_path, '--mode', 'hls', '--tcl', 'run_hls.tcl']
    
    try:
        # Run the command
        subprocess.call(command, cwd=workspace_dir)
    except Exception as e:
        print("Error: {}".format(e))

if __name__ == "__main__":
    launch_vitis()
