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
std::vector<float> squareVectorsFloat(const std::vector<float>& a) {


    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] * a[i];
    }
    return result;
}
std::vector<ps_t> squareVectorsPosit(const std::vector<ps_t>& a) {


    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positMul(a[i] , a[i]);
    }
    return result;
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
std::vector<double> mulVectors(const std::vector<double>& a, const std::vector<double>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] * b[i];
    }
    return result;
}
std::vector<double> divVectors(const std::vector<double>& a, const std::vector<double>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] / b[i];
    }
    return result;
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
std::vector<double> subVectors(const std::vector<double>& a, const std::vector<double>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<double> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] - b[i];
    }
    return result;
}
std::vector<float> mulVectorsFloat(const std::vector<float>& a, const std::vector<float>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] * b[i];
    }
    return result;
}
std::vector<float> divVectorsFloat(const std::vector<float>& a, const std::vector<float>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] / b[i];
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
std::vector<float> subVectorsFloat(const std::vector<float>& a, const std::vector<float>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<float> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = a[i] - b[i];
    }
    return result;
}
std::vector<ps_t> mulVectorsPosit(const std::vector<ps_t>& a, const std::vector<ps_t>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positMul(a[i] , b[i]);
    }
    return result;
}
std::vector<ps_t> divVectorsPosit(const std::vector<ps_t>& a, const std::vector<ps_t>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positDiv(a[i] , b[i]);
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
std::vector<ps_t> subVectorsPosit(const std::vector<ps_t>& a, const std::vector<ps_t>& b) {
    if (a.size() != b.size()) {
        throw std::invalid_argument("Vectors must be of the same size");
    }

    std::vector<ps_t> result(a.size());
    for (size_t i = 0; i < a.size(); ++i) {
        result[i] = positSub(a[i] , b[i]);
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
        //std::cout<<reconstructed<<std::endl;
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
void printPosit(ps_t p){
    std::cout<<"isZero: "<<p.isZero<<std::endl;
    std::cout<<"isInf: "<<p.isInf<<std::endl;
    std::cout<<"Sign: "<<p.sign<<std::endl;
    std::cout<<"Regime: "<<p.regime<<std::endl;
    std::cout<<"Exponent: "<<p.exponent<<std::endl;
    std::cout<<"Mantissa: "<<p.mantissa<<std::endl;
}

int main() {
    size_t size = 10000;  
    double minValue = -2.0, maxValue = 2.0;
    unsigned seed = 42;  
    unsigned seed2 = 41;
    double dRange= 10000;
    ps_t pTest,pTest2;
    double dTest2,dTest =1.18617;
 /*   pTest = double2posit(dTest); 
    printPosit(pTest);
    double dRecons = posit2double(pTest);
    std::cout<<"Recons: "<<dRecons<<std::endl;
    pTest = positMul(pTest, pTest);
    printPosit(pTest);
    dRecons = posit2double(pTest);
    std::cout<<"Recons Square: "<<dRecons<<std::endl;*/

    
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
    std::vector<double> randomArray = generateRandomDoubleArray(size, minValue,maxValue,dRange, seed, "Double.txt");
    std::vector<double> randomArray2 = generateRandomDoubleArray(size, minValue,maxValue,dRange, seed2, "Double2.txt");
    std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);
    std::vector<ps_t> positArray2 = convertDoubleArrayToPosit(randomArray2);
    std::vector<double> reconstructedArray = convertPositArrayToDouble(positArray, "Posit.txt");
    std::vector<double> reconstructedArray2 = convertPositArrayToDouble(positArray2,"Posit2.txt");
    std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "Float.txt");
    std::vector<float> floatArray2 = convertDoubleArrayToFloat(randomArray2, "Float2.txt");
 /*   double rc1,rc2;
    dTest = randomArray[235];
    dTest2 = randomArray2[235];
    double dMul,dRC;

    pTest = double2posit(dTest); rc1= posit2double(pTest);
    pTest2 = double2posit(dTest2); rc2= posit2double(pTest2);
    std::cout<<dTest<<" "<<rc1<<std::endl;
    std::cout<<dTest2<<" "<<rc2<<std::endl;
    std::cout<<"---IN1---"<<std::endl;
    printPosit(pTest);
    std::cout<<"---IN2---"<<std::endl;
    printPosit(pTest2);
    ps_t pMul;
    pMul = positMul(pTest,pTest);
    std::cout<<"---MUL---"<<std::endl;
    printPosit(pMul);
    dRC = posit2double(pMul);
    dMul = dTest*dTest;
    std::cout<<"------"<<std::endl;
    std::cout<<"dMul: "<<dMul<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    std::cout<<"------"<<std::endl;
    pMul = positMul(pMul,pMul);
    dMul = dTest*dTest*dTest*dTest;
    printPosit(pMul);
    dRC = posit2double(pMul);
    
    std::cout<<"------"<<std::endl;
    std::cout<<"dMul: "<<dMul<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    std::cout<<"------"<<std::endl;
    */
/*
    std::cout<<"---ADD---"<<std::endl;
    ps_t pAdd;
    double dAdd;
    dAdd = dTest+dTest2;
    pAdd = positAdd(pTest,pTest2);
    printPosit(pAdd);
    dRC = posit2double(pAdd);
    std::cout<<"------"<<std::endl;
    std::cout<<"dAdd: "<<dAdd<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    std::cout<<"------"<<std::endl;
    */
   /* std::cout<<"---DIV---"<<std::endl;
    ps_t pDiv;
    double dDiv;
    dDiv = dTest/dTest2;
    pDiv = positDiv(pTest,pTest2);
    printPosit(pDiv);
    dRC = posit2double(pDiv);
    std::cout<<"------"<<std::endl;
    std::cout<<"dDiv: "<<dDiv<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    std::cout<<"------"<<std::endl;*/
/*
    pMul = positMul(pTest,pTest2);
    std::cout<<"---MUL---"<<std::endl;
    printPosit(pMul);
    dRC = posit2double(pMul);
    dMul = dTest*dTest2;
    std::cout<<"------"<<std::endl;
    std::cout<<"dMul: "<<dMul<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    std::cout<<"------"<<std::endl;
    pMul = positMul(pMul,pMul);
    std::cout<<"---MUL---"<<std::endl;
    printPosit(pMul);
    dRC = posit2double(pMul);
    dMul = dMul*dMul;
    std::cout<<"------"<<std::endl;
    std::cout<<"dMul: "<<dMul<<std::endl;
    std::cout<<"dRC: "<<dRC<<std::endl;
    sf_t s = 34;
    std::cout<<s<<std::endl;
    s = -34;
    std::cout<<s<<std::endl;

    printPosit(pMul);
*/
/*
    mantissa_t a = 0;
    a.set(1);
    a.set(2);
    std::cout<<a<<std::endl;
    a.clear(2);
    std::cout<<a<<std::endl;*/

    //Check SNR
    double snrPosit = computeSNR(randomArray, reconstructedArray);
    double snrFloat = computeSNRFloat(randomArray, floatArray);

    // Print results
    std::cout << "SNR IN1 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1 (Float Conversion): " << snrFloat << " dB" << std::endl;

    snrPosit = computeSNR(randomArray2, reconstructedArray2);
    snrFloat = computeSNRFloat(randomArray2, floatArray2);
    // Print results
    std::cout << "SNR IN2 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN2 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 + IN2
    std::vector<ps_t> sumPosit = addVectorsPosit(positArray, positArray2);
    
    reconstructedArray = convertPositArrayToDouble(sumPosit, "addPosit.txt");
    std::vector<double> addDouble = addVectors(randomArray, randomArray2);
    writeToFile(addDouble, "addDouble.txt");
    std::vector<float> addFloat = addVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(addFloat, "addFloat.txt");

    snrPosit = computeSNR(addDouble, reconstructedArray);
    snrFloat = computeSNRFloat(addDouble, addFloat);
    // Print results
    std::cout << "SNR IN1+IN2 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1+IN2 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 - IN2
    std::vector<ps_t> subPosit = subVectorsPosit(positArray, positArray2);
    reconstructedArray = convertPositArrayToDouble(subPosit, "subPosit.txt");
    std::vector<double> subDouble = subVectors(randomArray, randomArray2);
    writeToFile(subDouble, "subDouble.txt");
    std::vector<float> subFloat = subVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(subFloat, "subFloat.txt");

    snrPosit = computeSNR(subDouble, reconstructedArray);
    snrFloat = computeSNRFloat(subDouble, subFloat);
    // Print results
    std::cout << "SNR IN1-IN2 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1-IN2 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 * IN2
    std::vector<ps_t> mulPosit = mulVectorsPosit(positArray, positArray2);
    reconstructedArray = convertPositArrayToDouble(mulPosit, "mulPosit.txt");
    std::vector<double> mulDouble = mulVectors(randomArray, randomArray2);
    writeToFile(mulDouble, "mulDouble.txt");
    std::vector<float> mulFloat = mulVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(mulFloat, "mulFloat.txt");

    snrPosit = computeSNR(mulDouble, reconstructedArray);
    snrFloat = computeSNRFloat(mulDouble, mulFloat);
    // Print results
    std::cout << "SNR IN1*IN2 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1*IN2 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 * IN1
    std::vector<ps_t> sqrPosit = mulVectorsPosit(positArray, positArray);
    reconstructedArray = convertPositArrayToDouble(sqrPosit, "sqrPosit.txt");
    std::vector<double> sqrDouble = mulVectors(randomArray, randomArray);
    writeToFile(sqrDouble, "sqrDouble.txt");
    std::vector<float> sqrFloat = mulVectorsFloat(floatArray, floatArray);
    writeToFileFloat(sqrFloat, "sqrFloat.txt");

    snrPosit = computeSNR(sqrDouble, reconstructedArray);
    snrFloat = computeSNRFloat(sqrDouble, sqrFloat);
    // Print results
    std::cout << "SNR IN1*IN1 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1*IN1 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 **4
    std::vector<ps_t> p4Posit = mulVectorsPosit(sqrPosit, sqrPosit);
    reconstructedArray = convertPositArrayToDouble(p4Posit, "p4Posit.txt");
    std::vector<double> p4Double = mulVectors(sqrDouble, sqrDouble);
    writeToFile(p4Double, "p4Double.txt");
    std::vector<float> p4Float = mulVectorsFloat(sqrFloat, sqrFloat);
    writeToFileFloat(p4Float, "p4Float.txt");

    snrPosit = computeSNR(p4Double, reconstructedArray);
    snrFloat = computeSNRFloat(p4Double, p4Float);
    // Print results
    std::cout << "SNR IN1**4 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1**4 (Float Conversion): " << snrFloat << " dB" << std::endl;
    //IN1 / IN2
    std::vector<ps_t> divPosit = divVectorsPosit(positArray, positArray2);
    reconstructedArray = convertPositArrayToDouble(divPosit, "divPosit.txt");
    std::vector<double> divDouble = divVectors(randomArray, randomArray2);
    writeToFile(divDouble, "divDouble.txt");
    std::vector<float> divFloat = divVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(divFloat, "divFloat.txt");

    snrPosit = computeSNR(divDouble, reconstructedArray);
    snrFloat = computeSNRFloat(divDouble, divFloat);
    // Print results
    std::cout << "SNR IN1/IN2 (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR IN1/IN2 (Float Conversion): " << snrFloat << " dB" << std::endl;
    
    /*
    dv_t AA,BB;
    dv_t A = 805306368;
    dv_t B = 644245094;
    AA = A<<(FRAC_LEN);
    BB = B<<(FRAC_LEN);
    dv_t R= AA/B;
    R= BB/A;
    std::cout<<A<<std::endl;
    std::cout<<AA<<std::endl;
    std::cout<<B<<std::endl;
    std::cout<<R<<std::endl;
*/
 /*   double a = randomArray[10];
    double b =  randomArray2[10];
    double c = a*b;
    ps_t a_p = double2posit(a);
    ps_t b_p = double2posit(b);
    ps_t c_p = positMul(a_p,b_p);
    double C =  posit2double(c_p);
    std::cout<<a<<" "<<b<<" "<<c<<std::endl;
    std::cout<<posit2double(a_p)<<" "<<posit2double(b_p)<<" "<<C<<std::endl;*/
     
    //writeToFile(mulDouble, "mulDouble.txt");

    // Convert to posit array
    //std::vector<ps_t> positArray = convertDoubleArrayToPosit(randomArray);
    //std::vector<ps_t> positArray2 = convertDoubleArrayToPosit(randomArray2);

   

    //std::vector<double> reconstructedArray = convertPositArrayToDouble(positArray, "Posit.txt");
     // Compute SNRs
    //double snrPosit = computeSNR(randomArray, reconstructedArray);
    //std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    //std::vector<ps_t> sumPosit = mulVectorsPosit(positArray, positArray2);
    // Convert back to double and save
/*
    //std::vector<double> reconstructedArray = convertPositArrayToDouble(sumPosit, "mulPosit.txt");

    // Convert to float and save
    std::vector<float> floatArray = convertDoubleArrayToFloat(randomArray, "float_array.txt");
    std::vector<float> floatArray2 = convertDoubleArrayToFloat(randomArray2, "float_array2.txt");
    std::vector<float> sumFloat = mulVectorsFloat(floatArray, floatArray2);
    writeToFileFloat(sumFloat, "mulFloat.txt");

    // Compute SNRs
    double snrPosit = computeSNR(mulDouble, reconstructedArray);
    double snrFloat = computeSNRFloat(mulDouble, sumFloat);


    // Print results
    std::cout << "SNR (Posit Reconstruction): " << snrPosit << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat << " dB" << std::endl;
*/
    return 0;
}
