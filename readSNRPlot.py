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
    Converts folder name to a short label like 'T:4 (32,0)' — without APP/NAPP.
    """
    parts = folder_name.split('_')
    if len(parts) >= 9:
        return f"T:{parts[1]} ({parts[3]},{parts[5]})"
    return folder_name

def get_app_type(folder_name):
    """Returns 'APP' or 'NAPP' if matched correctly, else 'UNKNOWN'."""
    match = re.search(r'_(APP|NAPP)$', folder_name, re.IGNORECASE)
    return match.group(1).upper() if match else 'UNKNOWN'

def process_folders(base_dir='.'):
    """Processes folders, extracts SNRs, and plots by SIZE and APP/NAPP type."""
    data = []
    for folder in os.listdir(base_dir):
        if os.path.isdir(folder) and folder.startswith("TERMS_"):
            match_size = re.search(r'SIZE_(\d+)', folder)
            size_val = match_size.group(1) if match_size else 'Unknown'
            fft_file = os.path.join(base_dir, folder, 'snr_fft.txt')
            ifft_file = os.path.join(base_dir, folder, 'snr_ifft.txt')
            sin_file = os.path.join(base_dir, folder, 'snr_sin.txt')
            cos_file = os.path.join(base_dir, folder, 'snr_cos.txt')
            posit_fft, float_fft = extract_snr_values(fft_file)
            posit_ifft, float_ifft = extract_snr_values(ifft_file)
            posit_sin, float_sin = extract_snr_values(sin_file)
            posit_cos, float_cos = extract_snr_values(cos_file)
            app_type = get_app_type(folder)
            if app_type != 'UNKNOWN':
                data.append([folder, size_val, posit_fft, float_fft, posit_ifft, float_ifft, posit_sin, float_sin, posit_cos, float_cos, app_type])
    
    df = pd.DataFrame(data, columns=[
        'Configuration', 'SIZE', 'Posit_FFT', 'Float_FFT',
        'Posit_IFFT', 'Float_IFFT', 'Posit_SIN', 'Float_SIN', 
        'Posit_COS', 'Float_COS', 'Type'
    ])
    df['Label'] = df['Configuration'].apply(format_label)
    df.to_csv('snr_results.csv', index=False)

    # Now separate APP and NAPP
    for app_type in ['APP', 'NAPP']:
        type_df = df[df['Type'] == app_type]
        if type_df.empty:
            print(f"No data found for type: {app_type}")
            continue
        for size, group in type_df.groupby('SIZE'):
            plot_results(group, 'FFT', size, app_type)
            plot_results(group, 'IFFT', size, app_type)
            plot_results(group, 'SIN', size, app_type)
            plot_results(group, 'COS', size, app_type)

def plot_results(df, plot_type, size, app_type):
    """Plots SNR values for one transform (FFT/IFFT/SIN/COS), size, and APP/NAPP in a separate figure."""
    if plot_type == 'FFT':
        posit_values = df['Posit_FFT']
        float_values = df['Float_FFT']
    elif plot_type == 'IFFT':
        posit_values = df['Posit_IFFT']
        float_values = df['Float_IFFT']
    elif plot_type == 'SIN':
        posit_values = df['Posit_SIN']
        float_values = df['Float_SIN']
    elif plot_type == 'COS':
        posit_values = df['Posit_COS']
        float_values = df['Float_COS']
    
    plt.figure(figsize=(10, 5))
    plt.plot(df['Label'], posit_values, marker='o', label='Posit')
    plt.plot(df['Label'], float_values, marker='s', label='Float')
    plt.xlabel('Configuration')
    plt.ylabel('SNR (dB)')
    plt.title(f'SNR Comparison ({plot_type}) - SIZE {size} - {app_type}')
    plt.xticks(rotation=90)
    plt.legend()
    plt.grid()
    plt.tight_layout()
    filename = f'snr_{plot_type.lower()}_SIZE_{size}_{app_type}.png'
    plt.savefig(filename)
    print("Figure saved as:", filename)
    plt.close()

if __name__ == "__main__":
    process_folders()
