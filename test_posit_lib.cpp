#include "posit.hpp"
#include <climits>
#include <etc/hls_sqrt_apfixed.h>
#include <ostream>
#include <vector>
#include <random>
#include <iostream>
#include <fstream>
#include <cmath>
#include <limits>
#include <filesystem>


void fillRandomDoublesArray(double* arr, int size, double minVal, double maxVal, unsigned int seed) {
    std::mt19937 gen(seed);  // Seeded random number generator
    std::uniform_real_distribution<double> dist(minVal, maxVal); // Range is dynamic here

    for (int i = 0; i < size; ++i) {
        arr[i] = dist(gen);
    }
}
void convertPositArrayToDoubleArray(const ps_t* positArray, double* doubleArray, size_t size) {
    for (size_t i = 0; i < size; ++i) {
        ps_t positValue = positArray[i]; // Access array element
        double reconstructed = posit2double(positValue);  // Convert posit to double
        doubleArray[i] = reconstructed; // Store in the output array
    }
}

void convertDoubleArrayToPositArray(ps_t positArray[], double doubleArray[], size_t size) {
    for (size_t i = 0; i < size; ++i) {
        double doubleValue = doubleArray[i]; // Access array element
        
        ps_t converted = double2posit(doubleValue);  // Convert posit to double
        positArray[i] = converted; // Store in the output array
        if(i==1)
        std::cout<<doubleValue<<"--"<<posit2double(converted)<<std::endl;
    }
}
void convertDoubleArrayToFloatArray(float floatArray[], double doubleArray[], size_t size) {
    float converted=0;
    for (size_t i = 0; i < size; ++i) {
        double doubleValue = doubleArray[i]; 
        converted = (float)doubleValue;  
        floatArray[i] = converted; 
    }
}
void calculateSinArrays(
    const float floatSinCosIn[], float SinFloat[],
    const double doubleSinCosIn[], double SinDouble[],
    const ps_t positSinCosIn[], ps_t SinPosit[],
    int size)
{
    for (int i = 0; i < size; ++i) {
        // Calculate sine for float
        SinFloat[i] = fTailorSin(floatSinCosIn[i]);

        // Calculate sine for double
        SinDouble[i] = dTailorSin(doubleSinCosIn[i]);

        // Calculate sine for posit
        SinPosit[i] = positSin(positSinCosIn[i]);  
    }
}
void calculateCosArrays(
    const float floatSinCosIn[], float CosFloat[],
    const double doubleSinCosIn[], double CosDouble[],
    const ps_t positSinCosIn[], ps_t CosPosit[],
    int size)
{
    for (int i = 0; i < size; ++i) {
        // Calculate sine for float
        CosFloat[i] = fTailorCos(floatSinCosIn[i]);

        // Calculate sine for double
        CosDouble[i] = dTailorCos(doubleSinCosIn[i]);

        // Calculate sine for posit
        CosPosit[i] = positCos(positSinCosIn[i]);  
    }
}
// Compute SNR between original and reconstructed array
double computeSNR(const double original[], const double reconstructed[], size_t size) {
    double signalPower = 0.0, noisePower = 0.0;

    for (size_t i = 0; i < size; ++i) {
        signalPower += original[i] * original[i];
        double error = original[i] - reconstructed[i];
        noisePower += error * error;
    }

    if (noisePower == 0.0) return std::numeric_limits<double>::infinity(); // Perfect reconstruction

    return 10.0 * log10(signalPower / noisePower);
}

// Compute SNR between original double array and float array
double computeSNRFloat(const double original[], const float reconstructed[], size_t size) {
    float signalPower = 0.0, noisePower = 0.0;

    for (size_t i = 0; i < size; ++i) {
        signalPower += original[i] * original[i];
        float error = original[i] - reconstructed[i];
        noisePower += error * error;
    }

    if (noisePower == 0.0) return std::numeric_limits<float>::infinity(); // Perfect reconstruction

    return 10.0 * log10(signalPower / noisePower);
}
void writeToFileFloat(const std::string& filename, const float data_array[], size_t size) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error: Could not open file " << filename << " for writing!" << std::endl;
        return;
    }

    // Loop through the array and write each value to the file
    for (size_t i = 0; i < size; ++i) {
        outFile << data_array[i] << "\n";
    }

    outFile.close();
    std::cout << "Saved " << size << " values to " << filename << std::endl;
}


void writeToFile(const std::string& filename, const double data_array[], size_t size) {
    std::ofstream outFile(filename);
    if (!outFile) {
        std::cerr << "Error: Could not open file " << filename << " for writing!" << std::endl;
        return;
    }

    // Loop through the array and write each value to the file
    for (size_t i = 0; i < size; ++i) {
        outFile <<data_array[i] << "\n";
    }

    outFile.close();
    std::cout << "Saved " << size << " values to " << filename << std::endl;
}
void addDoubleArrays(const double* arr1, const double* arr2, double* result, int size) {
    for (int i = 0; i < size; ++i) {
        result[i] = arr1[i] + arr2[i];
    }
}
template <typename T>
void addArrays(const T* arr1, const T* arr2, T* result, int size) {
    for (int i = 0; i < size; ++i) {
        result[i] = arr1[i] + arr2[i];
    }
}
void printPosit(ps_t x){
    std::cout<<"sign: "<<x.sign<<" ";
    std::cout<<"isZero: "<<x.isZero<<" ";
    std::cout<<"isInf: "<<x.isInf<<" ";
    std::cout<<"exponent: "<<x.exponent<<" ";
    std::cout<<"regime: "<<x.regime<<" ";
    std::cout<<"mantissa: "<<x.mantissa<<" "<<std::endl;
}
int main() {
        // Construct the base path
    std::string basePath = "C:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositLibSNR/PositLib" ;
	std::string d_inFile = basePath + "/d_in.txt";  
    std::string f_inFile = basePath + "/f_in.txt";  
    std::string p_inFile = basePath + "/p_in.txt";
	std::string d_in2File = basePath + "/d_in2.txt";  
    std::string f_in2File = basePath + "/f_in2.txt";  
    std::string p_in2File = basePath + "/p_in2.txt";
	std::string d_SumFile = basePath + "/d_sum.txt";  
    std::string f_SumFile = basePath + "/f_sum.txt";  
    std::string p_SumFile = basePath + "/p_sum.txt";
    int TEST_SIZE = 10000;
    double double_in[TEST_SIZE];
    double double_in2[TEST_SIZE];
    float float_in[TEST_SIZE];
    float float_in2[TEST_SIZE];
    ps_t posit_in[TEST_SIZE];
    ps_t posit_in2[TEST_SIZE];
    double d_posit_in[TEST_SIZE];
    double d_posit_in2[TEST_SIZE];

    double d_sum[TEST_SIZE];
    float f_sum[TEST_SIZE];
    ps_t p_sum[TEST_SIZE];
    double d_p_sum[TEST_SIZE];

    fillRandomDoublesArray(double_in,TEST_SIZE,-1,1,26);
    fillRandomDoublesArray(double_in2,TEST_SIZE,-1,1,27);
    convertDoubleArrayToPositArray(posit_in,double_in,TEST_SIZE);
    convertPositArrayToDoubleArray(posit_in, d_posit_in, TEST_SIZE);
    convertDoubleArrayToPositArray(posit_in2,double_in2,TEST_SIZE);
    convertPositArrayToDoubleArray(posit_in2, d_posit_in2, TEST_SIZE);

    convertDoubleArrayToFloatArray(float_in,double_in,TEST_SIZE);
    convertDoubleArrayToFloatArray(float_in2,double_in2,TEST_SIZE);
    addArrays<double>(double_in, double_in2, d_sum, TEST_SIZE);
    addArrays<float>(float_in, float_in2, f_sum, TEST_SIZE);
    addArrays<ps_t>(posit_in, posit_in2, p_sum, TEST_SIZE);
    convertPositArrayToDoubleArray(p_sum, d_p_sum, TEST_SIZE);
    double SNR_ADD_P = computeSNR(d_sum,d_p_sum,TEST_SIZE);
    double SNR_ADD_F = computeSNRFloat(d_sum, f_sum, TEST_SIZE);
    std::cout<<"SNR ADD POSIT VS DOUBLE :"<<SNR_ADD_P<<std::endl;
    std::cout<<"SNR ADD FLOAT VS DOUBLE :"<<SNR_ADD_F<<std::endl;
    writeToFile(d_inFile, double_in, TEST_SIZE);
    writeToFile(d_in2File, double_in2, TEST_SIZE);
    writeToFile(p_inFile, d_posit_in, TEST_SIZE);
    writeToFile(p_in2File, d_posit_in2, TEST_SIZE);
    writeToFileFloat(f_inFile, float_in, TEST_SIZE);
    writeToFileFloat(f_in2File, float_in2, TEST_SIZE);
    writeToFile(d_SumFile, d_sum, TEST_SIZE);
    writeToFile(p_SumFile, d_p_sum, TEST_SIZE);
    writeToFileFloat(f_SumFile, f_sum, TEST_SIZE);
    double x = double_in[1];
    
    ps_t y = double2posit(x);
    printPosit(y);
    printPosit(posit_in[1]);
    std::cout<<posit2double(y)<<posit2double(posit_in[1])<<"-"<<x<<std::endl;
    posit_in[1]= y;
    std::cout<<posit2double(posit_in[1])<<"-"<<x<<std::endl;
    return 0;

}