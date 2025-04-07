import os
import re
import pandas as pd
import matplotlib.pyplot as plt

def extract_snr_values(file_path):
    """Extracts Posit and Float SNR values from a given file."""
    posit = None
    float_ = None
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            for line in file:
                match_posit = re.search(r'Posit:\s*([-\d\.]+)', line)
                if match_posit:
                    posit = float(match_posit.group(1))
                match_float = re.search(r'Float:\s*([-\d\.]+)', line)
                if match_float:
                    float_ = float(match_float.group(1))
    return posit, float_

def format_label(folder_name):
    """
    Reformats the folder name to a shorter label.
    Expected folder name format: TERMS_<T>_N_<N_value>_ES_<ES_value>_SIZE_<size>_<APP/NAPP>
    Example: 'TERMS_4_N_32_ES_0_SIZE_4000_APP' → 'T:4 (32,0) APP'
    """
    parts = folder_name.split('_')
    if len(parts) >= 9:
        return "T:" + parts[1] + " (" + parts[3] + "," + parts[5] + ") " + parts[8]
    return folder_name

def process_folders(base_dir='.'):
    """Processes all TERMS_ folders, extracts SNR values, and groups by SIZE."""
    data = []
    folders = os.listdir(base_dir)
    for folder in folders:
        if os.path.isdir(folder) and folder.startswith("TERMS_"):
            # Extract SIZE from folder name, e.g., SIZE_4000
            match_size = re.search(r'SIZE_(\d+)', folder)
            size_val = match_size.group(1) if match_size else 'Unknown'
            fft_file = os.path.join(base_dir, folder, 'snr_fft.txt')
            ifft_file = os.path.join(base_dir, folder, 'snr_ifft.txt')
            posit_fft, float_fft = extract_snr_values(fft_file)
            posit_ifft, float_ifft = extract_snr_values(ifft_file)
            data.append([folder, size_val, posit_fft, float_fft, posit_ifft, float_ifft])
    
    df = pd.DataFrame(data, columns=['Configuration', 'SIZE', 'Posit_FFT', 'Float_FFT', 'Posit_IFFT', 'Float_IFFT'])
    df['Label'] = df['Configuration'].apply(format_label)
    
    df.to_csv('snr_results.csv', index=False)
    
    size_groups = df.groupby('SIZE')
    for size, group in size_groups:
         plot_results(group, 'FFT', size)
         plot_results(group, 'IFFT', size)

def plot_results(df, plot_type, size):
    """Plots the SNR values for FFT or IFFT for a given SIZE group and saves the figure."""
    size_to_points = {
        '1000': '1024',
        '2000': '2048',
        '4000': '4096'
    }
    point_count = size_to_points.get(size, size)  # fallback to size if not mapped

    if plot_type == 'FFT':
        posit_values = df['Posit_FFT']
        float_values = df['Float_FFT']
    else:
        posit_values = df['Posit_IFFT']
        float_values = df['Float_IFFT']
    
    plt.figure(figsize=(10, 5))
    plt.plot(df['Label'], posit_values, marker='o', label='Posit')
    plt.plot(df['Label'], float_values, marker='s', label='Float')
    plt.xlabel('Configuration')
    plt.ylabel('SNR (dB)')
    plt.title('SNR Comparison ({}) - {}-Point'.format(plot_type, point_count))
    plt.xticks(rotation=90)
    plt.legend()
    plt.grid()
    plt.tight_layout()
    save_path = 'snr_{}_SIZE_{}.png'.format(plot_type.lower(), size)
    plt.savefig(save_path)
    print("Figure saved as:", save_path)
    plt.close()

if __name__ == "__main__":
    process_folders()
