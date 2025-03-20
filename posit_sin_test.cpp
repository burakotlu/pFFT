#include "posit.hpp"
#include <climits>
#include <ostream>

#include <random>
#include <iostream>
#include <fstream>
#include <cmath>
#include <limits>
#include <cstdint>

double calculateSinDegrees(double angleInRadians) {

    return std::sin(angleInRadians);
}
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
    std::cout << "Sin written to " << filename << std::endl;
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
    std::cout << "Sin written to " << filename << std::endl;
}
std::vector<double> tailorSinVectors(const std::vector<double>& a) {


    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = dTailorSin(a[i]);
    }
    return result;
}
std::vector<float> tailorSinVectorsFloat(const std::vector<float>& a) {


    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = fTailorSin(a[i]);
    }
    return result;
}
std::vector<double> sinVectors(const std::vector<double>& a) {


    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = calculateSinDegrees(a[i]);
    }
    return result;
}
std::vector<float> sinVectorsFloat(const std::vector<float>& a) {


    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = calculateSinDegrees(a[i]);
    }
    return result;
}
std::vector<ps_t> sinVectorsPosit(const std::vector<ps_t>& a) {

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positSin(a[i] );
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
std::vector<double> generateDoubleArray(size_t size, double min, double max,double dRange, const std::string& filename) {
    std::vector<double> arr(size);

    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return {};
    }

    for (size_t i = 0; i < size; ++i) {
        arr[i] = min +i*(max-min)/size;
        if (arr[i]>-0.00000000001 && arr[i]<0) arr[i]=0;
        if (arr[i]<0.00000000001 && arr[i]>0) arr[i]=0;
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


int main() {
    size_t size = 10000;  
    double minValue = -PI, maxValue = PI;
    unsigned seed = 10;  
    unsigned seed2 = 20;
    double dRange= 10000;
    /*
    std::cout<<dTailorSin(-PI*0.5)<<std::endl;
    ps_t p= double2posit(-PI*0.5);
    std::cout<<posit2double(p)<<std::endl;
    std::cout<<posit2double(positSin(double2posit(-PI*0.5)))<<std::endl;
    */
   
    // Generate and save random double array
    std::vector<double> randomArray = generateDoubleArray(size, minValue,maxValue,dRange , "random_array.txt");

    std::vector<double> sinDouble = sinVectors(randomArray);
    std::vector<double> TsinDouble = tailorSinVectors(randomArray);
    writeToFile(sinDouble, "sinDouble.txt");
    writeToFile(TsinDouble, "tailorsinDouble.txt");
    // Convert to posit array
    std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);
 
    std::vector<ps_t> sinPosit = sinVectorsPosit(positArray);
    // Convert back to double and save

    std::vector<double> reconstructedArray = convertPositArrayToDouble(sinPosit, "sinPosit.txt");

    // Convert to float and save
    std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "float_array.txt");

    std::vector<float> TsinFloat = tailorSinVectorsFloat(floatArray);
    writeToFileFloat(TsinFloat, "tailorsinFloat.txt");

    // Compute SNRs
    double snrPosit = computeSNR(TsinDouble, reconstructedArray);
    double snrFloat = computeSNRFloat(TsinDouble, TsinFloat);


    // Print results
    std::cout<<"----------------SNR RESULTS-------------------------"<<std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
    
    return 0;
}
