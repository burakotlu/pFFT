# Set workspace and project name
set workspace "C:/Users/Burak/Desktop/TAU/HLS/PositFFT"
set project_name "PositFFT"

# Change to workspace
cd $workspace

# Run CSIM for the existing project
vitis -mode csim -project $project_name -log csim_log.txt
