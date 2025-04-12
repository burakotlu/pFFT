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
#include <cstdint>
#include <filesystem>



void loadSignalToArray(const std::string& filename,
                       float floatArray[],
                       double doubleArray[],
                       ps_t positArray[],
                       int size) {
    std::ifstream file(filename);

    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }

    double sample;
    int i = 0;

    while (file >> sample && i < size) {
        floatArray[i] = static_cast<float>(sample);
        doubleArray[i] = sample;
        positArray[i] = double2posit(sample);
        ++i;
    }

    file.close();

    std::cout << "Loaded " << i << " values into arrays" << std::endl;
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

void convertPositArrayToDoubleArray(ps_t positArray[], double doubleArray[], size_t size) {
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
void fillRandomDoublesArray(double* arr, int size, double minVal = -5.0, double maxVal = 5.0) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<double> dist(minVal, maxVal);

    for (int i = 0; i < size; ++i) {
        arr[i] = dist(gen);
    }
}
int main() {
    std::cout<<"double PI: "<<PI<<std::endl;
   std::cout << "ONE: "  <<posit2double(ONE) << std::endl;
   std::cout << "mONE: "  <<posit2double(mONE) << std::endl;
    std::cout << "POSIT_PI_OVER2: " << posit2double(POSIT_PI_OVER2) << std::endl;
    std::cout << "PI: " << posit2double(POSIT_PI) << std::endl;
    std::cout << "2PI: " << posit2double(POSIT_2PI) << std::endl;
    std::cout << "POSIT_M_PI_OVER2: " << posit2double(POSIT_M_PI_OVER2) << std::endl;
    std::cout << "POSIT_M_PI: " << posit2double(POSIT_M_PI) << std::endl;
    std::cout << "POSIT_M_2PI: " << posit2double(POSIT_M_2PI) << std::endl;

    std::cout << "ZERO+mONE: "  <<posit2double(positAdd(ZERO,mONE)) << std::endl;
    std::cout << "(ZERO+mONE)+mONE: "  <<posit2double(positAdd(positAdd(ZERO,mONE),mONE)) << std::endl;
    
    std::cout<<"------------------------"<<std::endl;
    
    double ang = -278.0101318359375;
    std::cout << "positMod: "  <<posit2double(positMod(double2posit(ang),POSIT_2PI)) << std::endl;
    std::cout << "doubleMod: "  <<fmod(ang,PI*2) << std::endl;
     std::cout<<"------------------------"<<std::endl;
    std::cout << "positCos: "  <<posit2double(positCos(double2posit(ang)) )<< std::endl;
    std::cout << "doubleCos: "  <<dTailorCos(ang) << std::endl;
    std::cout << "floatCos: "  <<fTailorCos(ang) << std::endl;

/*
    ps_t x,y;
    x= double2posit(5);
	y= double2posit(2);
	std::cout<<posit2double(positMod(x,y))<<std::endl;
	x= double2posit(3);
	y= double2posit(5);
	std::cout<<posit2double(positMod(x,y))<<std::endl;
	x= double2posit(-3);
	y= double2posit(5);
	std::cout<<posit2double(positMod(x,y))<<std::endl;
	x= double2posit(-18);
	y= double2posit(5);
	std::cout<<posit2double(positMod(x,y))<<std::endl;
	x= double2posit(-18.25);
	y= double2posit(5);
	std::cout<<posit2double(positMod(x,y))<<std::endl;
    std::cout<<posit2double(positMod(POSIT_PI,POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(POSIT_M_2PI,POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(18),POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(-4),POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(5),POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(8),POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(-150.895),POSIT_2PI))<<std::endl;
    std::cout<<posit2double(positMod(double2posit(-153.742),POSIT_2PI))<<std::endl;
*/

    double doublekFac[IN_SIZE];
    ps_t positkFac[IN_SIZE];
    double positkFacDouble[IN_SIZE];
    for(int i=0;i<IN_SIZE;i++){
        positkFac[i] = calculateKFactor(i);
        doublekFac[i] = (double) i/IN_SIZE;

    }
    convertPositArrayToDoubleArray(positkFac, positkFacDouble, IN_SIZE);
    double snrPosit_F = computeSNR(doublekFac, positkFacDouble, IN_SIZE);


    double dIn[1000];
    ps_t pIn[1000];
    double ptodIn[1000];
    double doubleMd[1000];
    ps_t positMd[1000];
    double positMdDouble[1000];
    fillRandomDoublesArray(dIn,1000,-250,250);
    convertDoubleArrayToPositArray(pIn,dIn,1000);
    convertPositArrayToDoubleArray(pIn, ptodIn, 1000);
    for(int i=0;i<1000;i++){
        positMd[i] = positMod(pIn[i],POSIT_2PI);
        doubleMd[i] = fmod(dIn[i],2*PI);

    }
    convertPositArrayToDoubleArray(positMd, positMdDouble, 1000);
    double snrPosit_M_IN = computeSNR(dIn, ptodIn, IN_SIZE);
    double snrPosit_M = computeSNR(doubleMd, positMdDouble, IN_SIZE);


    std::string appr_suffix = (APPR_TAILOR == 1) ? "_APP" : "_NAPP";
    
    // Construct the base path
    std::string basePath = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/TERMS_" 
                            + std::to_string(TERMS) + "_N_" + std::to_string(N) 
                            + "_ES_" + std::to_string(ES)
                            + "_SIZE_" + std::to_string(IN_SIZE) + appr_suffix;
    std::string inputFile = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/random_numbers_" + std::to_string(IN_SIZE) + ".txt";  // Input file with the time-domain signal
    std::string inputSinCosFile = "c:/Users/Burak/Desktop/TAU/HLS/PositFFT/PositFFT/angle_values_" + std::to_string(IN_SIZE) + ".txt";  // Input file with the time-domain signal
	std::string signalFile = basePath + "/signal.txt";  // Input file with the time-domain signal
    std::string dOutputFileReal = basePath + "/double_fft_real.txt";
    std::string dOutputFileImag = basePath + "/double_fft_imag.txt";
    std::string fOutputFileReal = basePath + "/float_fft_real.txt";
    std::string fOutputFileImag = basePath + "/float_fft_imag.txt";
    std::string pOutputFileReal = basePath + "/posit_fft_real.txt";
    std::string pOutputFileImag = basePath + "/posit_fft_imag.txt";
    std::string snrFFTOut = basePath + "/snr_fft.txt";
    std::string difftOutputFile = basePath + "/double_ifft_output.txt";
    std::string fifftOutputFile = basePath + "/float_ifft_output.txt";
    std::string pifftOutputFile = basePath + "/posit_ifft_output.txt";
    std::string snrIFFTOut = basePath + "/snr_ifft.txt";
    std::string inDouble = basePath + "/in_double.txt";
    std::string inFloat = basePath + "/in_float.txt";
    std::string inPosit = basePath + "/in_posit.txt";
	std::string inSinCosDouble = basePath + "/inSinCos_double.txt";
    std::string inSinCosFloat = basePath + "/inSinCos_float.txt";
    std::string inSinCosPosit = basePath + "/inSinCos_posit.txt";
	std::string sinDouble = basePath + "/sin_double.txt";
    std::string sinFloat = basePath + "/sin_float.txt";
    std::string sinPosit = basePath + "/sin_posit.txt";
	std::string cosDouble = basePath + "/cos_double.txt";
    std::string cosFloat = basePath + "/cos_float.txt";
    std::string cosPosit = basePath + "/cos_posit.txt";
	std::string snrSINOut = basePath + "/snr_sin.txt";
	std::string snrCOSOut = basePath + "/snr_cos.txt";
    std::cout << "Before Load" << std::endl;

    // Step 1: Load the signal from the txt file into a HLS stream
    float floatSignal[IN_SIZE];
    double doubleSignal[IN_SIZE];
    ps_t positSignal[IN_SIZE];
    double positSignalDouble[IN_SIZE];
    loadSignalToArray(inputFile, floatSignal, doubleSignal, positSignal, IN_SIZE);

    convertPositArrayToDoubleArray(positSignal, positSignalDouble, IN_SIZE);
    writeToFile(inDouble, doubleSignal, IN_SIZE);
    writeToFileFloat(inFloat, floatSignal, IN_SIZE);
    writeToFile(inPosit, positSignalDouble, IN_SIZE);
    double snrPosit_IN = computeSNR(doubleSignal, positSignalDouble, IN_SIZE);

    double snrFloat_IN = computeSNRFloat(doubleSignal,floatSignal, IN_SIZE);


    std::cout << "After Load" << std::endl;
    float floatSinCosIn[IN_SIZE];
    double doubleSinCosIn[IN_SIZE];
    ps_t positSinCosIn[IN_SIZE];
    double positSinCosInDouble[IN_SIZE];
    loadSignalToArray(inputSinCosFile, floatSinCosIn, doubleSinCosIn, positSinCosIn, IN_SIZE);
	convertPositArrayToDoubleArray(positSinCosIn, positSinCosInDouble, IN_SIZE);
	writeToFile(inSinCosDouble, doubleSinCosIn, IN_SIZE);
    writeToFileFloat(inSinCosFloat, floatSinCosIn, IN_SIZE);
    writeToFile(inSinCosPosit, positSinCosInDouble, IN_SIZE);
	std::cout << "----------SIN--------------" << std::endl;
    float SinFloat[IN_SIZE];
    double SinDouble[IN_SIZE];
    ps_t SinPosit[IN_SIZE];
	double SinPositDouble[IN_SIZE];
    calculateSinArrays(floatSinCosIn,SinFloat,doubleSinCosIn,SinDouble,positSinCosIn,SinPosit,IN_SIZE);
	convertPositArrayToDoubleArray(SinPosit, SinPositDouble, IN_SIZE);
	writeToFile(sinDouble, SinDouble, IN_SIZE);        
    writeToFile(sinPosit, SinPositDouble, IN_SIZE);       
    writeToFileFloat(sinFloat, SinFloat, IN_SIZE);  
    double snrPosit_SIN = computeSNR(SinDouble, SinPositDouble, IN_SIZE);
    double snrFloat_SIN = computeSNRFloat(SinDouble,SinFloat, IN_SIZE);   
    std::ofstream outFileSIN(snrSINOut);
    outFileSIN << "Posit: " << snrPosit_SIN << std::endl;
    outFileSIN << "Float: " << snrFloat_SIN << std::endl;
    outFileSIN.close();
	std::cout << "----------COS--------------" << std::endl;
    float CosFloat[IN_SIZE];
    double CosDouble[IN_SIZE];
    ps_t CosPosit[IN_SIZE];
	double CosPositDouble[IN_SIZE];
    calculateCosArrays(floatSinCosIn,CosFloat,doubleSinCosIn,CosDouble,positSinCosIn,CosPosit,IN_SIZE);
	convertPositArrayToDoubleArray(CosPosit, CosPositDouble, IN_SIZE);
	writeToFile(cosDouble, CosDouble, IN_SIZE);        
    writeToFile(cosPosit, CosPositDouble, IN_SIZE);       
    writeToFileFloat(cosFloat, CosFloat, IN_SIZE);  
	double snrPosit_COS = computeSNR(CosDouble, CosPositDouble, IN_SIZE);
    double snrFloat_COS = computeSNRFloat(CosDouble,CosFloat, IN_SIZE);   
    std::ofstream outFileCOS(snrCOSOut);
    outFileCOS << "Posit: " << snrPosit_COS << std::endl;
    outFileCOS << "Float: " << snrFloat_COS << std::endl;
    outFileCOS.close();
    std::cout << "----------FFT--------------" << std::endl;
    std::cout << "Calculating double results..." << std::endl;
    dFFTResult d_fftResult;
    dFFT(doubleSignal, d_fftResult);

    std::cout << "Calculating float results..." << std::endl;
    fFFTResult f_fftResult;
    fFFT(floatSignal, f_fftResult);

    std::cout << "Calculating posit results..." << std::endl;
    pFFTResult pfftResult;
    pFFT(positSignal, pfftResult);

    double RC_real[IN_SIZE];  
    double RC_imag[IN_SIZE];

    convertPositArrayToDoubleArray(pfftResult.real, RC_real, IN_SIZE);
    convertPositArrayToDoubleArray(pfftResult.imag, RC_imag, IN_SIZE);

    std::cout << "Writing results in files..." << std::endl;
// Assuming data is stored in arrays like RC_real, RC_imag, d_fftResult.real, d_fftResult.imag
    writeToFile(signalFile, doubleSignal, IN_SIZE);        // For signalArray
    writeToFile(pOutputFileReal, RC_real, IN_SIZE);       // For real part of posit FFT result
    writeToFile(pOutputFileImag, RC_imag, IN_SIZE);      // For imaginary part of posit FFT result
    writeToFile(dOutputFileReal, d_fftResult.real, IN_SIZE);  // For real part of double FFT result
    writeToFile(dOutputFileImag, d_fftResult.imag, IN_SIZE);  // For imaginary part of double FFT result

    writeToFileFloat(fOutputFileReal, f_fftResult.real,IN_SIZE);
    writeToFileFloat(fOutputFileImag, f_fftResult.imag,IN_SIZE);

    // Compute SNRs

    double snrPosit_FFT = computeSNR(d_fftResult.real, RC_real, IN_SIZE);

    double snrFloat_FFT = computeSNRFloat(d_fftResult.real,f_fftResult.real, IN_SIZE);
    std::ofstream outFileFFT(snrFFTOut);
    outFileFFT << "Posit: " << snrPosit_FFT << std::endl;
    outFileFFT << "Float: " << snrFloat_FFT << std::endl;
    outFileFFT.close();

    double snrPosit_ANG = computeSNR(d_Angle_Array, p_Angle_Array, MAX_SIZE);
    double snrFloat_ANG = computeSNRFloat(d_Angle_Array, f_Angle_Array, MAX_SIZE);
    std::string GAFile = basePath + "/angle.txt";  // Input file with the time-domain signal
    std::string pGAFile = basePath + "/p_angle.txt";  // Input file with the time-domain signal
    std::string fGAFile = basePath + "/f_angle.txt";  // Input file with the time-domain signal
    writeToFile(GAFile, d_Angle_Array, MAX_SIZE);        // For signalArray
    writeToFileFloat(fGAFile, f_Angle_Array, MAX_SIZE);       // For real part of float FFT result
    writeToFile(pGAFile, p_Angle_Array, MAX_SIZE);       // For real part of posit FFT result
 
    double snrPosit_RP = computeSNR(d_RP_Array, p_RP_Array, MAX_SIZE);
    double snrFloat_RP = computeSNRFloat(d_RP_Array, f_RP_Array, MAX_SIZE);
    std::string RPFile = basePath + "/rp.txt";  // Input file with the time-domain signal
    std::string pRPFile = basePath + "/p_rp.txt";  // Input file with the time-domain signal
    std::string fRPFile = basePath + "/f_rp.txt";  // Input file with the time-domain signal
    writeToFile(RPFile, d_RP_Array, MAX_SIZE);        // For signalArray
    writeToFileFloat(fRPFile, f_RP_Array, MAX_SIZE);       // For real part of float FFT result
    writeToFile(pRPFile, p_RP_Array, MAX_SIZE);       // For real part of posit FFT result
 
    double snrPosit_IMG = computeSNR(d_IMG_Array, p_IMG_Array, MAX_SIZE);
    double snrFloat_IMG = computeSNRFloat(d_IMG_Array, f_IMG_Array, MAX_SIZE);
    std::string IMGFile = basePath + "/img.txt";  // Input file with the time-domain signal
    std::string pIMGFile = basePath + "/p_img.txt";  // Input file with the time-domain signal
    std::string fIMGFile = basePath + "/f_img.txt";  // Input file with the time-domain signal
    writeToFile(IMGFile, d_IMG_Array, MAX_SIZE);        // For signalArray
    writeToFileFloat(fIMGFile, f_IMG_Array, MAX_SIZE);       // For real part of float FFT result
    writeToFile(pIMGFile, p_IMG_Array, MAX_SIZE);       // For real part of posit FFT result

    double snrPosit_DTH = computeSNR(d_DTH_Array, p_DTH_Array, DTHETA_SIZE);
    double snrFloat_DTH = computeSNRFloat(d_DTH_Array, f_DTH_Array, DTHETA_SIZE);
    std::string DTHFile = basePath + "/dth.txt";  // Input file with the time-domain signal
    std::string pDTHFile = basePath + "/p_dth.txt";  // Input file with the time-domain signal
    std::string fDTHFile = basePath + "/f_dth.txt";  // Input file with the time-domain signal
    writeToFile(DTHFile, d_DTH_Array, DTHETA_SIZE);        // For signalArray
    writeToFileFloat(fDTHFile, f_DTH_Array, DTHETA_SIZE);       // For real part of float FFT result
    writeToFile(pDTHFile, p_DTH_Array, DTHETA_SIZE);       // For real part of posit FFT result

    std::cout << "Computing double IFFT..." << std::endl;
    double d_reconstructedSignal[IN_SIZE];
    dIFFT(d_fftResult.real, d_fftResult.imag, d_reconstructedSignal, IN_SIZE);
    std::cout << "Writing IFFT results to file..." << std::endl;
    writeToFile(difftOutputFile, d_reconstructedSignal, IN_SIZE);
    // Conversion buffers
    float f_real[IN_SIZE], f_imag[IN_SIZE];
    ps_t p_real[IN_SIZE], p_imag[IN_SIZE];

    // Convert double FFT result to float and posit
    for (int i = 0; i < IN_SIZE; i++) {
        f_real[i] = static_cast<float>(d_fftResult.real[i]);
        f_imag[i] = static_cast<float>(d_fftResult.imag[i]);

        p_real[i] = double2posit(d_fftResult.real[i]);
        p_imag[i] = double2posit(d_fftResult.imag[i]);
    }
    std::cout << "Computing float IFFT..." << std::endl;
    float f_reconstructedSignal[IN_SIZE];
    fIFFT(f_real, f_imag, f_reconstructedSignal, IN_SIZE);
    writeToFileFloat(fifftOutputFile, f_reconstructedSignal, IN_SIZE);

    std::cout << "Computing posit IFFT..." << std::endl;
    ps_t p_reconstructedSignal[IN_SIZE];
    pIFFT(p_real, p_imag, p_reconstructedSignal, IN_SIZE);
    double RC_result[IN_SIZE];
    convertPositArrayToDoubleArray(p_reconstructedSignal, RC_result, IN_SIZE);
    writeToFile(pifftOutputFile, RC_result, IN_SIZE);
     // Compute SNRs for IFFT
    double snrPosit_IFFT = computeSNR(d_reconstructedSignal, RC_result, IN_SIZE);
    double snrFloat_IFFT = computeSNRFloat(d_reconstructedSignal, f_reconstructedSignal, IN_SIZE);
    std::ofstream outFileIFFT(snrIFFTOut);

    outFileIFFT << "-------------WRT ORIG-------------------------" << std::endl;
    outFileIFFT << "Posit: " << snrPosit_IFFT << std::endl;
    outFileIFFT << "Float: " << snrFloat_IFFT << std::endl;
    outFileIFFT.close();
    // Compute SNRs with respect to original signal
    double snrPosit_IFFT_ORIG = computeSNR(doubleSignal, RC_result,IN_SIZE);
    double snrFloat_IFFT_ORIG = computeSNRFloat(doubleSignal, f_reconstructedSignal,IN_SIZE);
    double snrDouble_IFFT_ORIG = computeSNR(doubleSignal, d_reconstructedSignal,IN_SIZE);
    std::cout << "----------------SNR RESULTS K Factor-------------------------" << std::endl;
    std::cout << "SNR k factor Calculation: " << snrPosit_F << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS MOD-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_M_IN << " dB" << std::endl;
    std::cout << "SNR Mod Calculation: " << snrPosit_M << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS INPUT-------------------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_IN << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_IN << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS SIN-------------------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_SIN << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_SIN << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS COS-------------------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_COS << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_COS << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS FFT-------------------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_FFT << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_FFT << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS IFFT-------------------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_IFFT << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_IFFT << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS IFFT WRT ORIG-----------------" << std::endl;
    std::cout << "SNR (Posit Reconstruction): " << snrPosit_IFFT_ORIG << " dB" << std::endl;
    std::cout << "SNR (Float Conversion): " << snrFloat_IFFT_ORIG << " dB" << std::endl;
    std::cout << "SNR (Double Conversion): " << snrDouble_IFFT_ORIG << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS ANG-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_ANG << " dB" << std::endl;
    std::cout << "SNR Before Calculation Float: " << snrFloat_ANG << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS RP-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_RP << " dB" << std::endl;
    std::cout << "SNR Before Calculation Float: " << snrFloat_RP << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS IMG-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_IMG << " dB" << std::endl;
    std::cout << "SNR Before Calculation Float: " << snrFloat_IMG << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS DTH-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_DTH << " dB" << std::endl;
    std::cout << "SNR Before Calculation Float: " << snrFloat_DTH << " dB" << std::endl;
    std::cout << "----------------SNR RESULTS MOD-------------------------" << std::endl;
    std::cout << "SNR Before Calculation: " << snrPosit_M_IN << " dB" << std::endl;
    std::cout << "SNR Mod Calculation: " << snrPosit_M << " dB" << std::endl;




    std::cout << "Processing complete." << std::endl;

    return 0;
}