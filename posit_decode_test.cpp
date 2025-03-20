#include "posit.hpp"
#include <cstdint>
#include <iostream>
#include <fstream>
#include <cmath>
#include <iterator>
#include <vector>
using namespace std;

// Function to compute SNR
double computeSNR(const std::vector<double>& original, const std::vector<double>& approx) {
    if (original.size() != approx.size() || original.empty()) {
        std::cerr << "Error: Mismatched array sizes or empty array!" << std::endl;
        return -1.0;  // Indicate error
    }

    double signalPower = 0.0;
    double noisePower = 0.0;

    for (size_t i = 0; i < original.size(); ++i) {
        signalPower += original[i] * original[i];  // Sum of squares of original signal
        double error = original[i] - approx[i];
        noisePower += error * error;  // Sum of squares of error
    }

    if (noisePower == 0.0) {
        return std::numeric_limits<double>::infinity();  // Perfect reconstruction
    }

    double snr = 10.0 * std::log10(signalPower / noisePower);
    return snr;
}

// Function to generate numbers and save them to a file
std::vector<uint64_t> generateNumbersToFile(int n, const std::string& filename) {
    std::ofstream outFile(filename);
    std::vector<uint64_t> numbers;

    if (!outFile) {
        std::cerr << "Error opening file!" << std::endl;
        return numbers;
    }

    uint64_t limit = static_cast<uint64_t>(std::pow(2, n));
    std::cout<< "Limit: "<<limit<<std::endl;
    for (uint64_t i = 0; i < limit; ++i) {
        outFile << i << std::endl;
        numbers.push_back(i);
    }

    outFile.close();
    std::cout << "Data written to " << filename << std::endl;
    return numbers;
}

int main() {

    

 /*  
    std::vector<uint64_t> result = generateNumbersToFile(N, "numbers.txt");
    //std::cout<<result.size()<<std::endl;
 
    std::ofstream outDecodedFile("output.txt"); 
    posit_t converted=0;
    double accuracy=0.0;
 //   converted = encode(decode(32767));
 //   std::cout<< converted << " "<<(posit_t)32767<<std::endl;
 //   std::cout<<converted.bit(0)<<" "<<converted.bit(15)<<" "<<converted.bit(1)<<" "<<converted.range(2,0)<<std::endl;

    for (size_t i = 0; i < result.size(); ++i) {
   
       
        converted =  encode(decode((posit_t) result[i]));

        outDecodedFile<< converted << std::endl;

        if (converted == (posit_t)result[i])
            accuracy += 1.0;
        else
            std::cout<<"Mismatch! --> "<<converted<<" - "<<result[i]<<std::endl;


      
    }

    outDecodedFile.close();

    std::cout << "Data written to outfiles" << std::endl;
    std::cout << "Accuracy: " << (static_cast<double>(accuracy) / result.size() * 100.0) << "%" << std::endl;


*/
    return 0;
}