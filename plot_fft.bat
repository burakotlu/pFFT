@echo off
:: Change directory to the folder where the batch file is located
cd /d "%~dp0"

:: Run the Python script (assuming it's in the same folder)
python plot_fft.py

:: Pause to see the output before the window closes
pause