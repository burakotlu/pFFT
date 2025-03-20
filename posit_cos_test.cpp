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

double calculateCosDegrees(double angleInRadians) {

    return std::cos(angleInRadians);
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
    std::cout << "Cos written to " << filename << std::endl;
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
std::vector<double>  tailorCosVectors(const std::vector<double>& a) {


    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = dTailorCos(a[i]);
    }
    return result;
}
std::vector<float> tailorCosVectorsFloat(const std::vector<float>& a) {


    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = fTailorCos(a[i]);
    }
    return result;
}
std::vector<double> cosVectors(const std::vector<double>& a) {


    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = calculateCosDegrees(a[i]);
    }
    return result;
}
std::vector<float> cosVectorsFloat(const std::vector<float>& a) {


    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = calculateCosDegrees(a[i]);
    }
    return result;
}
std::vector<ps_t> cosVectorsPosit(const std::vector<ps_t>& a) {

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positCos(a[i] );
        //std::cout<< posit2double(result[i])<<posit2double(a[i]) <<std::cos(posit2double(a[i]))<<std::endl;      
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
        //std::cout<<" value: "<<value<<"recons: "<<posit2double(double2posit(value))<<std::endl;
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
double D2P2D(double x){
    return posit2double(double2posit(x));
}
double P2D(ps_t pos){
    return posit2double(pos);    
}
ps_t D2P (double x){
    return double2posit(x);
}
int main() {
    size_t size = 10000; 
    double minValue = -PI, maxValue =PI;
    unsigned seed = 42;  
    unsigned seed2 = 41;
    double dRange= 10000;
    // Generate and save random double array

    std::vector<double> randomArray = generateDoubleArray(size, minValue,maxValue,dRange , "random_array.txt");
    double dTest = randomArray[2499];
    ps_t pTest = D2P(dTest);
    std::cout<<dTest<<" rec: "<<D2P2D(dTest)<<std::endl;

    ps_t y2,y4,term2,term3,t1minust2,result,term1 = double2posit(1);
    bool negate;
  /*  
    pTest = pReduceAngle(pTest, negate);
    std::cout<<"-------------COS----------"<<std::endl;
    //std::cout<<"y: "<<posit2double(y)<<std::endl;
    y2 = positMul(pTest, pTest);
    std::cout<<"y2: "<<posit2double(y2)<<std::endl;
    y4 = positMul(y2,y2);
    std::cout<<"y4: "<<posit2double(y4)<<std::endl;
    term2 = positDiv(y2, double2posit(2));
    std::cout<<"term2: "<<posit2double(term2)<<std::endl;
    term3 = positDiv(y4, double2posit(24));
    std::cout<<"term3: "<<posit2double(term3)<<std::endl;
    t1minust2 = positSub(term1, term2 );
    std::cout<<"t1minust2: "<<posit2double(t1minust2)<<std::endl;
    result = positAdd(t1minust2,term3);
    std::cout<<"pTest "<<P2D(pTest)<<std::endl;
    std::cout<<"y2 "<<P2D(y2)<<std::endl;
    std::cout<<"y4 "<<P2D(y4)<<std::endl;
    std::cout<<"term1 "<<P2D(term1)<<std::endl;
    std::cout<<"term2 "<<P2D(term2)<<std::endl;
    std::cout<<"t1minust2 "<<P2D(t1minust2)<<std::endl;
    std::cout<<"term3 "<<P2D(term3)<<std::endl;
    std::cout<<"result "<<P2D(result)<<std::endl;
    std::cout<<"Cos: "<<P2D(positCos(pTest))<<std::endl;

    pTest = positMul(pTest,pTest); 
    std::cout<<"x2: "<< P2D(pTest)<<std::endl;
*//*
    std::cout<<dTailorCos(PI*0.5)<<std::endl;
    ps_t p= double2posit(PI*0.5);
    std::cout<<posit2double(p)<<std::endl;
    std::cout<<posit2double(positCos(double2posit(PI*0.5)))<<std::endl;*/

    std::cout<<"-------TTTT------"<<std::endl;
    //sf_t max = (2-N)<<ES;
    //std::cout<<"max: "<<max<<std::endl;

    std::vector<double> cosDouble = cosVectors(randomArray);
    std::vector<double> TcosDouble = tailorCosVectors(randomArray);
    writeToFile(randomArray, "in.txt");
    writeToFile(cosDouble, "cosDouble.txt");
    writeToFile(TcosDouble, "tailorcosDouble.txt");
    // Convert to posit array
    std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);
    std::vector<ps_t> cosPosit = cosVectorsPosit(positArray);
    // Convert back to double and save

    std::vector<double> reconstructedArray = convertPositArrayToDouble(cosPosit, "cosPosit.txt");

    // Convert to float and save
    std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "float_array.txt");

    std::vector<float> cosFloat = cosVectorsFloat(floatArray);
    std::vector<float> TcosFloat = tailorCosVectorsFloat(floatArray);
    writeToFileFloat(cosFloat, "cosFloat.txt");
    writeToFileFloat(TcosFloat, "tailorcosFloat.txt");
    // Compute SNRs
    double snrPosit = computeSNR(TcosDouble, reconstructedArray);
    double snrFloat = computeSNRFloat(TcosDouble, TcosFloat);


    // Print results
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
   

    return 0;
}
