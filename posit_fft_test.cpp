
#include "posit.hpp"
#include <climits>
#include <ostream>
#include <vector>
#include <random>
#include <iostream>
#include <fstream>
#include <cmath>
#include <limits>
#include <cstdint>
#include <filesystem>

// Function to load data from a txt file into a vector
std::vector<double> loadSignal(const std::string& filename) {
    std::vector<double> signal;
    std::ifstream file(filename);

    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return signal;
    }

    double sample;
    while (file >> sample) {
        signal.push_back(sample);
    }

    file.close();
    return signal;
}
void writeToFileFloat( const std::string& filename,const std::vector<float>& vec) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error opening file!" << std::endl;
        return;
    }

    for (float num : vec) {
        outFile << num << std::endl;
    }

    outFile.close();
    std::cout << "Sin written to " << filename << std::endl;
}

// Function to write a vector to a file
void writeToFile(const std::string& filename, const std::vector<double>& data) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error: Could not open file " << filename << " for writing!" << std::endl;
        return;
    }

    for (const auto& value : data) {
        outFile << value << "\n";
    }

    outFile.close();
    std::cout << "Saved " << data.size() << " values to " << filename << std::endl;
}
std::vector<double> convertPositArrayToDouble(const std::vector<ps_t>& positArray) {
    std::vector<double> doubleArray;
    doubleArray.reserve(positArray.size());
  



    for (ps_t positValue : positArray) {
        double reconstructed = posit2double(positValue);
        doubleArray.push_back(reconstructed);
    }

    return doubleArray;
}
// Converts a vector of doubles to a vector of posits
std::vector<ps_t> convertDoubleArrayToPosit(const std::vector<double>& doubleArray) {
    std::vector<ps_t> positArray;
    positArray.reserve(doubleArray.size());

    for (double value : doubleArray) {
        //std::cout<<" value: "<<value<<"recons: "<<posit2double(double2posit(value))<<std::endl;
        positArray.push_back(double2posit(value));
    }

    return positArray;
}
    // Compute SNR between original and reconstructed array
double computeSNR(const std::vector<double>& original, const std::vector<double>& reconstructed) {
    double signalPower = 0.0, noisePower = 0.0;

    for (size_t i = 0; i < original.size(); ++i) {
        signalPower += original[i] * original[i];
        double error = original[i] - reconstructed[i];
        noisePower += error * error;
    }

    if (noisePower == 0.0) return std::numeric_limits<double>::infinity(); // Perfect reconstruction

    return 10.0 * log10(signalPower / noisePower);
}

// Compute SNR between original double array and float array
double computeSNRFloat(const std::vector<double>& original, const std::vector<float>& converted) {
    double signalPower = 0.0, noisePower = 0.0;

    for (size_t i = 0; i < original.size(); ++i) {
        signalPower += original[i] * original[i];
        double error = original[i] - static_cast<double>(converted[i]);
        noisePower += error * error;
    }

    if (noisePower == 0.0) return std::numeric_limits<double>::infinity(); // Perfect reconstruction

    return 10.0 * log10(signalPower / noisePower);
}
// Converts a double array to float and writes to a file
std::vector<float> convertDoubleArrayToFloat(const std::vector<double>& doubleArray) {
    std::vector<float> floatArray;
    floatArray.reserve(doubleArray.size());


    for (double value : doubleArray) {
        float converted = static_cast<float>(value);
        floatArray.push_back(converted);

    }

    return floatArray;
}
fFFTResult convertToFFFTResult(const dFFTResult& dfftResult) {
    fFFTResult ffftResult;

    // Convert real part
    for (size_t i = 0; i < IN_SIZE; ++i) {
        ffftResult.real[i] = static_cast<float>(dfftResult.real[i]);
    }

    // Convert imaginary part
    for (size_t i = 0; i < IN_SIZE; ++i) {
        ffftResult.imag[i] = static_cast<float>(dfftResult.imag[i]);
    }

    return ffftResult;
}
pFFTResult convertToPFFTResult(const dFFTResult& dfftResult) {
    pFFTResult pfftResult;

    // Convert real part using the helper function
    pfftResult.real = convertDoubleArrayToPosit(dfftResult.real);

    // Convert imaginary part using the helper function
    pfftResult.imag = convertDoubleArrayToPosit(dfftResult.imag);

    return pfftResult;
}
int main() {
    //std::cout<<posit2double(POSIT_2PI)<<std::endl;
    std::cout<<"ONE: "<<posit2double(ONE)<<std::endl;
    std::string appr_suffix = (APPR_TAILOR == 1) ? "_APP" : "_NAPP";

    // Construct the base path
    std::string basePath = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/TERMS_" 
                            + std::to_string(TERMS) + "_N_" + std::to_string(N) 
                            + "_ES_" + std::to_string(ES)
                            + "_SIZE_" + std::to_string(IN_SIZE) + appr_suffix;
    std::string inputFile = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/output_" +std::to_string(IN_SIZE)+".txt";  // Input file with the time-domain signal
    std::string signalFile = basePath +"/signal.txt";  // Input file with the time-domain signal
    std::string dOutputFileReal = basePath + "/double_fft_real.txt";
    std::string dOutputFileImag = basePath + "/double_fft_imag.txt";
    std::string fOutputFileReal = basePath + "/float_fft_real.txt";
    std::string fOutputFileImag = basePath + "/float_fft_imag.txt";
    std::string pOutputFileReal = basePath + "/posit_fft_real.txt";
    std::string pOutputFileImag = basePath + "/posit_fft_imag.txt";
    std::string snrFFTOut = basePath + "/snr_fft.txt";
    std::string difftOutputFile = basePath+"/double_ifft_output.txt";
    std::string fifftOutputFile = basePath+"/float_ifft_output.txt";
    std::string pifftOutputFile = basePath+"/posit_ifft_output.txt";
    std::string snrIFFTOut = basePath + "/snr_ifft.txt";
    std::cout<<"Before Load"<<std::endl;
    // Step 1: Load the signal from the txt file
    std::vector<double> signal = loadSignal(inputFile);
    if (signal.empty()) {
        return 1;  // Exit if the signal is empty
    }
    std::cout<<"After Load"<<std::endl;
    // Step 2: Perform FFT calculation
    std::cout<<"Calculating double results..."<<std::endl;
    dFFTResult d_fftResult = dFFT(signal);
    std::cout<<"Calculating float results..."<<std::endl;
    std::vector<float> f_signal = convertDoubleArrayToFloat(signal);
    fFFTResult f_fftResult = fFFT(f_signal); 
    std::cout<<"Calculating posit results..."<<std::endl;
    
    pFFTResult pfftResult = pFFT(convertDoubleArrayToPosit(signal));
    std::vector<double> RC_real = convertPositArrayToDouble(pfftResult.real);
    std::vector<double> RC_imag = convertPositArrayToDouble(pfftResult.imag);
    std::cout<<"Writing results in files..."<<std::endl;
    // Write to files
    writeToFile(signalFile, signal);
    writeToFile(pOutputFileReal, RC_real);
    writeToFile(pOutputFileImag, RC_imag);    
    writeToFile(dOutputFileReal, d_fftResult.real);
    writeToFile(dOutputFileImag, d_fftResult.imag);
    writeToFileFloat(fOutputFileReal, f_fftResult.real);
    writeToFileFloat(fOutputFileImag, f_fftResult.imag);
    // Compute SNRs
    double snrPosit = computeSNR(d_fftResult.real, RC_real);
    double snrFloat = computeSNRFloat(d_fftResult.real, f_fftResult.real);


    // Print results
    std::cout<<"----------------SNR RESULTS FFT-------------------------"<<std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
    std::ofstream outFileFFT(snrFFTOut);
    outFileFFT << "Posit: " << snrPosit << std::endl;
    outFileFFT << "Float: " << snrFloat << std::endl;
    outFileFFT.close();

    std::cout << "Computing double IFFT...\n";
    std::vector<double> d_reconstructedSignal = dIFFT(d_fftResult);

    std::cout << "Writing IFFT results to file...\n";
    writeToFile(difftOutputFile, d_reconstructedSignal);
    std::cout << "Computing float IFFT...\n";
    fFFTResult f_ifft_in = convertToFFFTResult(d_fftResult);
    std::vector<float> f_reconstructedSignal = fIFFT(f_ifft_in);
    writeToFileFloat(fifftOutputFile, f_reconstructedSignal);
    std::cout << "Computing float IFFT...\n";
    pFFTResult p_ifft_in = convertToPFFTResult(d_fftResult);
    std::vector<ps_t> p_reconstructedSignal = pIFFT(p_ifft_in);
    std::vector<double> RC_result = convertPositArrayToDouble(p_reconstructedSignal);
 
    writeToFile(pifftOutputFile, RC_result);
        // Compute SNRs
    snrPosit = computeSNR(d_reconstructedSignal, RC_result);
    snrFloat = computeSNRFloat(d_reconstructedSignal, f_reconstructedSignal);

    std::cout<<"----------------SNR RESULTS IFFT-------------------------"<<std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
    std::ofstream outFileIFFT(snrIFFTOut);
    outFileIFFT << "Posit: " << snrPosit << std::endl;
    outFileIFFT << "Float: " << snrFloat << std::endl;
	std::cout<<"----------------SNR RESULTS IFFT WRT ORIG-------------------------"<<std::endl;
	// Compute SNRs
    snrPosit = computeSNR(signal, RC_result);
    snrFloat = computeSNRFloat(signal, f_reconstructedSignal);
	double snrDouble = computeSNR(signal, d_reconstructedSignal);
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
	std::cout << "SNR (Double Conversion): " << snrDouble << " dB" << std::endl;
    outFileIFFT << "-------------WRT ORIG-------------------------"<< std::endl;
    outFileIFFT << "Posit: " << snrPosit << std::endl;
    outFileIFFT << "Float: " << snrFloat << std::endl;
    outFileIFFT.close();
    std::cout << "Processing complete.\n";
    
    return 0;
}