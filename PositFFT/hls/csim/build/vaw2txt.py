import wave
import numpy as np

def read_wav_and_write_txt(wav_filename, txt_filename, num_samples=32768):
    with wave.open(wav_filename, 'rb') as wav_file:
        num_channels = wav_file.getnchannels()
        sample_width = wav_file.getsampwidth()
        sample_rate = wav_file.getframerate()
        num_frames = wav_file.getnframes()
        
        print(f"Channels: {num_channels}, Sample Width: {sample_width}, Sample Rate: {sample_rate}, Total Frames: {num_frames}")
        
        if num_channels != 1:
            raise ValueError("Only single-channel WAV files are supported.")
        
        raw_data = wav_file.readframes(num_samples)
        data = np.frombuffer(raw_data, dtype=np.int16)  # Assuming 16-bit WAV
        
        np.savetxt(txt_filename, data, fmt='%d')
        print(f"Saved {len(data)} samples to {txt_filename}")

if __name__ == "__main__":
    read_wav_and_write_txt("input.wav", "output.txt")
