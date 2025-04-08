import os
import numpy as np
import matplotlib.pyplot as plt

def read_values(file_path):
    """Reads a file containing double values, assuming one value per line."""
    try:
        if not os.path.exists(file_path):
            print("Warning: File {} not found.".format(file_path))
            return None
        with open(file_path, 'r') as f:
            return np.array([float(line.strip()) for line in f if line.strip()])
    except ValueError as e:
        print("Error reading {}: Invalid data format ({})".format(file_path, e))
    except Exception as e:
        print("Error reading {}: ({})".format(file_path, e))
    return None

def plot_sin_cos_files_for_folder(folder):
    """Plots sin and cos files (in_* and sin_* vs cos_*) separately in one plot each."""
    # Define sin and cos related files
    sin_files = [
        "inSinCos_double.txt", "inSinCos_float.txt", "inSinCos_posit.txt",
        "sin_double.txt", "sin_float.txt", "sin_posit.txt"
    ]
    cos_files = [
        "inSinCos_double.txt", "inSinCos_float.txt", "inSinCos_posit.txt",
        "cos_double.txt", "cos_float.txt", "cos_posit.txt"
    ]

    # Filter out files that exist in the folder
    sin_valid_files = [file for file in sin_files if os.path.exists(os.path.join(folder, file))]
    cos_valid_files = [file for file in cos_files if os.path.exists(os.path.join(folder, file))]

    if not sin_valid_files:
        print("No valid sin files found in {}.".format(folder))
    else:
        # Plot sin-related files
        num_files = len(sin_valid_files)
        fig, axes = plt.subplots(num_files, 1, figsize=(10, 3 * num_files), sharex=True)
        if num_files == 1:
            axes = [axes]  # Ensure axes is iterable

        for ax, file in zip(axes, sin_valid_files):
            file_path = os.path.join(folder, file)
            values = read_values(file_path)
            if values is not None:
                ax.plot(values, label=file)
                ax.legend()
            ax.set_title(file)
            ax.grid()

        plt.xlabel("Index")
        plt.tight_layout()
        output_path = os.path.join(folder, "sin_plots.png")
        plt.savefig(output_path)
        print("Sin plot saved as {}".format(output_path))
        plt.close()

    if not cos_valid_files:
        print("No valid cos files found in {}.".format(folder))
    else:
        # Plot cos-related files
        num_files = len(cos_valid_files)
        fig, axes = plt.subplots(num_files, 1, figsize=(10, 3 * num_files), sharex=True)
        if num_files == 1:
            axes = [axes]  # Ensure axes is iterable

        for ax, file in zip(axes, cos_valid_files):
            file_path = os.path.join(folder, file)
            values = read_values(file_path)
            if values is not None:
                ax.plot(values, label=file)
                ax.legend()
            ax.set_title(file)
            ax.grid()

        plt.xlabel("Index")
        plt.tight_layout()
        output_path = os.path.join(folder, "cos_plots.png")
        plt.savefig(output_path)
        print("Cos plot saved as {}".format(output_path))
        plt.close()

def main():
    base_directory = os.getcwd()  # Change this to your base directory if needed

    # Folders to process (filtering for ones starting with 'TERMS')
    folders = [folder for folder in os.listdir(base_directory) if folder.startswith('TERMS') and os.path.isdir(os.path.join(base_directory, folder))]

    if not folders:
        print("No folders matching the pattern 'TERMS' found.")
        return

    for folder in folders:
        folder_path = os.path.join(base_directory, folder)
        print("Processing folder: {}".format(folder_path))

        # Process the sin and cos files
        plot_sin_cos_files_for_folder(folder_path)

if __name__ == "__main__":
    main()
