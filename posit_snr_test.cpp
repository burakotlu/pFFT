#include "posit.hpp"
#include <climits>
#include <vector>
#include <random>
#include <iostream>
#include <fstream>
#include <cmath>
#include <limits>
#include <cstdint>



// Generates a random array of doubles and writes it to a file
std::vector<double> generateRandomDoubleArray(size_t size, double minValue, double maxValue, unsigned seed, const std::string& filename) {
    std::vector<double> arr(size);
    std::mt19937 engine(seed);
    std::uniform_real_distribution<double> distribution(minValue, maxValue);
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (size_t i = 0; i < size; ++i) {
        arr[i] = distribution(engine);
        outFile << arr[i] << std::endl;  // Write to file
    }

    outFile.close();
    return arr;
}

// Converts a vector of doubles to a vector of posits
std::vector<ps_t> convertDoubleArrayToPosit(const std::vector<double>& doubleArray) {
    std::vector<ps_t> positArray;
    positArray.reserve(doubleArray.size());

    for (double value : doubleArray) {
        positArray.push_back(double2posit(value));
    }

    return positArray;
}

// Converts a vector of posits back to a vector of doubles and writes to a file
std::vector<double> convertPositArrayToDouble(const std::vector<ps_t>& positArray, const std::string& filename) {
    std::vector<double> doubleArray;
    doubleArray.reserve(positArray.size());
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (ps_t positValue : positArray) {
        double reconstructed = posit2double(positValue);
        doubleArray.push_back(reconstructed);
        outFile << reconstructed << std::endl;  // Write to file
    }

    outFile.close();
    return doubleArray;
}

// Converts a double array to float and writes to a file
std::vector<float> convertDoubleArrayToFloat(const std::vector<double>& doubleArray, const std::string& filename) {
    std::vector<float> floatArray;
    floatArray.reserve(doubleArray.size());
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (double value : doubleArray) {
        float converted = static_cast<float>(value);
        floatArray.push_back(converted);
        outFile << converted << std::endl;  // Write to file
    }

    outFile.close();
    return floatArray;
}

// Converts a double array to half-precision (FP16) and writes to a file
std::vector<uint16_t> convertDoubleArrayToHalf(const std::vector<double>& doubleArray, const std::string& filename) {
    std::vector<uint16_t> halfArray;
    halfArray.reserve(doubleArray.size());
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (double value : doubleArray) {
        uint16_t halfValue = static_cast<uint16_t>(value); // Simulated FP16 (Use real FP16 conversion if available)
        halfArray.push_back(halfValue);
        outFile << halfValue << std::endl;  // Write to file
    }

    outFile.close();
    return halfArray;
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

// Compute SNR between original double array and half array
double computeSNRHalf(const std::vector<double>& original, const std::vector<uint16_t>& converted) {
    double signalPower = 0.0, noisePower = 0.0;

    for (size_t i = 0; i < original.size(); ++i) {
        signalPower += original[i] * original[i];
        double error = original[i] - static_cast<double>(converted[i]); // Simulated FP16 behavior
        noisePower += error * error;
    }

    if (noisePower == 0.0) return std::numeric_limits<double>::infinity(); // Perfect reconstruction

    return 10.0 * log10(signalPower / noisePower);
}
bool isLog2Exact(double n){
    double res = std::log2(n);
    return std::floor(res) == res;    
}
int main() {
    size_t size = 100;  
    double minValue = -2.0, maxValue = 2.0;
    unsigned seed = 42;  

    

    // Generate and save random double array
    std::vector<double> randomArray = generateRandomDoubleArray(size, minValue, maxValue, seed, "random_array.txt");

    //std::cout<<posit2double(double2posit(randomArray.back()))<<std::endl;
    // Convert to posit array
    //std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);

    // Convert back to double and save
    //std::vector<double> reconstructedArray = convertPositArrayToDouble(positArray, "reconstructed_array.txt");

    // Convert to float and save
    //std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "float_array.txt");

    // Convert to half and save
    //std::vector<uint16_t> halfArray = convertDoubleArrayToHalf(randomArray, "half_array.txt");

    // Compute SNRs
    //double snrPosit = computeSNR(randomArray, reconstructedArray);
    //double snrFloat = computeSNRFloat(randomArray, floatArray);
    //double snrHalf = computeSNRHalf(randomArray, halfArray);

    // Print results
    //std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    //std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
    //std::cout << "SNR (Half Conversion): " << snrHalf << " dB" << std::endl;
    //std::cout << "Data saved to 'random_array.txt', 'reconstructed_array.txt', 'float_array.txt'" << std::endl;

    return 0;
}
