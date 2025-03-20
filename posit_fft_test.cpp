
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
int main() {
    std::cout<<posit2double(POSIT_2PI)<<std::endl;
    
    std::string inputFile = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/output.txt";  // Input file with the time-domain signal
    std::string dOutputFileReal = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/double_fft_real.txt";
    std::string dOutputFileImag = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/double_fft_imag.txt";
    std::string fOutputFileReal = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/float_fft_real.txt";
    std::string fOutputFileImag = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/float_fft_imag.txt";
    std::string pOutputFileReal = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_fft_real.txt";
    std::string pOutputFileImag = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/posit_fft_imag.txt";

    std::string ifftOutputFile = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/ifft_output.txt";

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
    writeToFile(pOutputFileReal, RC_real);
    writeToFile(pOutputFileImag, RC_imag);    
    writeToFile(dOutputFileReal, d_fftResult.real);
    writeToFile(dOutputFileImag, d_fftResult.imag);
    writeToFileFloat(dOutputFileReal, f_fftResult.real);
    writeToFileFloat(dOutputFileImag, f_fftResult.imag);
    // Compute SNRs
    double snrPosit = computeSNR(d_fftResult.real, RC_real);
    double snrFloat = computeSNRFloat(d_fftResult.real, f_fftResult.real);


    // Print results
    std::cout<<"----------------SNR RESULTS-------------------------"<<std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;



 /*   std::cout << "Computing IFFT...\n";
    std::vector<double> reconstructedSignal = dIFFT(fftResult);

    std::cout << "Writing IFFT results to file...\n";
    writeToFile(ifftOutputFile, reconstructedSignal);

    std::cout << "Processing complete.\n";
    */
    return 0;
}