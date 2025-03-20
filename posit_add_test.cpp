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

void writeToFile(const std::vector<double>& vec, const std::string& filename) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error opening file!" << std::endl;
        return;
    }

    for (double num : vec) {
        outFile << num << std::endl;
    }

    outFile.close();
    std::cout << "Sum written to " << filename << std::endl;
}

void writeToFileFloat(const std::vector<float>& vec, const std::string& filename) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error opening file!" << std::endl;
        return;
    }

    for (float num : vec) {
        outFile << num << std::endl;
    }

    outFile.close();
    std::cout << "Sum written to " << filename << std::endl;
}
std::vector<double> addVectors(const std::vector<double>& a, const std::vector<double>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] + b[i];
    }
    return result;
}
std::vector<float> addVectorsFloat(const std::vector<float>& a, const std::vector<float>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] + b[i];
    }
    return result;
}
std::vector<ps_t> addVectorsPosit(const std::vector<ps_t>& a, const std::vector<ps_t>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positAdd(a[i] , b[i]);
    }
    return result;
}
// Generates a random array of doubles and writes it to a file
std::vector<double> generateRandomDoubleArray(size_t size, double min, double max,double dRange, unsigned seed, const std::string& filename) {
    std::vector<double> arr(size);
    std::mt19937 engine(seed);
    std::uniform_real_distribution<double> distribution(min*dRange, max*dRange);
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (size_t i = 0; i < size; ++i) {
        arr[i] = distribution(engine)/dRange;
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
    size_t size = 10000;  
    double minValue = -2.0, maxValue = 2.0;
    unsigned seed = 42;  
    unsigned seed2 = 41;
    double dRange= 1000000;
  /*  std::cout<<isLog2Exact(0.25)<<std::endl;
    std::cout<<posit2double(double2posit(0.15))<<std::endl;
    std::cout<<posit2double(double2posit(0.25))<<std::endl;
    std::cout<<posit2double(double2posit(0.35))<<std::endl;
    std::cout<<posit2double(double2posit(5))<<std::endl;
    std::cout<<posit2double(double2posit(2))<<std::endl;
    std::cout<<posit2double(double2posit(9))<<std::endl;
    std::cout<<posit2double(double2posit(0))<<std::endl;*/
    //std::cout<<posit2double(double2posit(0.387401))<<std::endl;
    

    // Generate and save random double array
    std::vector<double> randomArray = generateRandomDoubleArray(size, minValue,maxValue,dRange, seed, "random_array.txt");
            // Shuffle and save
    std::vector<double> randomArray2 = generateRandomDoubleArray(size, minValue,maxValue,dRange, seed2, "random_array2.txt");
    std::vector<double> sumDouble = addVectors(randomArray, randomArray2);
/*    double a = randomArray[10];
    double b =  randomArray2[10];
    double c = a+b;
    ps_t a_p = double2posit(a);
    ps_t b_p = double2posit(b);
    ps_t c_p = positAdd(a_p,b_p);
    double C =  posit2double(c_p);
    std::cout<<a<<" "<<b<<" "<<c<<std::endl;
    std::cout<<posit2double(a_p)<<" "<<posit2double(b_p)<<" "<<C<<std::endl;
     */
    writeToFile(sumDouble, "sumDouble.txt");

    // Convert to posit array
    std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);
    std::vector<ps_t> positArray2 = convertDoubleArrayToPosit(randomArray2);
    std::vector<ps_t> sumPosit = addVectorsPosit(positArray, positArray2);
    // Convert back to double and save

    std::vector<double> reconstructedArray = convertPositArrayToDouble(sumPosit, "sumPosit.txt");

    // Convert to float and save
    std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "float_array.txt");
    std::vector<float> floatArray2 = convertDoubleArrayToFloat(randomArray2, "float_array2.txt");
    std::vector<float> sumFloat = addVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(sumFloat, "sumFloat.txt");

    // Compute SNRs
    double snrPosit = computeSNR(sumDouble, reconstructedArray);
    double snrFloat = computeSNRFloat(sumDouble, sumFloat);


    // Print results
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;

    return 0;
}
