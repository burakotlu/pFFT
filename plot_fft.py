import os
import numpy as np
import matplotlib.pyplot as plt

def read_values(file_path):
    """Reads a file containing double values, assuming one value per line."""
    try:
        if not os.path.exists(file_path):
            print("Warning: File {} not found." % file_path)
            return None
        with open(file_path, 'r') as f:
            return np.array([float(line.strip()) for line in f if line.strip()])
    except ValueError as e:
        print("Error reading {}: Invalid data format (%s)" % (file_path, e))
    except Exception as e:
        print("Error reading {}: %s" % (file_path, e))
    return None

def plot_files_for_folder(folder, files):
    """Plots and saves graphs for a given folder."""
    num_files = len(files)
    fig, axes = plt.subplots(num_files, 1, figsize=(10, 3 * num_files), sharex=True)

    if num_files == 1:
        axes = [axes]  # Ensure axes is iterable

    for ax, file in zip(axes, files):
        file_path = os.path.join(folder, file)
        values = read_values(file_path)
        if values is not None:
            ax.plot(values, label=file)
            ax.legend()
        ax.set_title(file)
        ax.grid()

    plt.xlabel("Index")
    plt.tight_layout()
    output_path = os.path.join(folder, "fft_ifft_separate_comparison.png")
    plt.savefig(output_path)
    print("Plot saved as %s" % output_path)
    plt.close()

def main():
    base_directory = os.getcwd()  # Change this to your base directory if needed

    # Folders to process (filtering for ones starting with 'TERMS')
    folders = [folder for folder in os.listdir(base_directory) if folder.startswith('TERMS') and os.path.isdir(os.path.join(base_directory, folder))]

    files = [
        "double_fft_real.txt", "float_fft_real.txt", "posit_fft_real.txt",
        "float_fft_imag.txt", "double_fft_imag.txt", "posit_fft_imag.txt",
        "signal.txt", "double_ifft_output.txt", "float_ifft_output.txt",
        "posit_ifft_output.txt"
    ]

    if not folders:
        print("No folders matching the pattern 'TERMS' found.")
        return

    for folder in folders:
        folder_path = os.path.join(base_directory, folder)
        print("Processing folder: %s" % folder_path)
        valid_files = [file for file in files if os.path.exists(os.path.join(folder_path, file))]
        if valid_files:
            plot_files_for_folder(folder_path, valid_files)
        else:
            print("No valid files found in %s." % folder_path)

if __name__ == "__main__":
    main()