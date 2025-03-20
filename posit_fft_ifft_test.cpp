#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

const double PI = 3.141592653589793;

// Normalize angle to range [-PI, PI]
double normalize_angle(double x) {
    while (x > PI) x -= 2 * PI;
    while (x < -PI) x += 2 * PI;
    return x;
}

// Approximate sine using Taylor series expansion
double sin_taylor(double x) {
    x = normalize_angle(x);
    double x2 = x * x;
    return x * (1 - x2 / 6 + x2 * x2 / 120 - x2 * x2 * x2 / 5040);
}

// Approximate cosine using Taylor series expansion
double cos_taylor(double x) {
    x = normalize_angle(x);
    double x2 = x * x;
    return 1 - x2 / 2 + x2 * x2 / 24 - x2 * x2 * x2 / 720;
}

void fft(vector<double>& aReal) {
    int N = aReal.size();
    vector<double> AReal(N), AImag(N, 0.0);
    
    // Bit-reversal permutation
    int logN = log2(N);
    for (int i = 0; i < N; i++) {
        int rev = 0;
        for (int j = 0; j < logN; j++) {
            if (i & (1 << j)) rev |= (1 << (logN - 1 - j));
        }
        AReal[rev] = aReal[i];
    }
    
    // Iterative FFT
    for (int s = 1; s <= logN; s++) {
        int m = 1 << s;
        double angle = -2.0 * PI / m;
        double cosAngle = cos_taylor(angle);
        double sinAngle = sin_taylor(angle);
        for (int k = 0; k < N; k += m) {
            double wReal = 1.0;
            double wImag = 0.0;
            for (int j = 0; j < m / 2; j++) {
                double tempReal = wReal * AReal[k + j + m / 2] - wImag * AImag[k + j + m / 2];
                double tempImag = wReal * AImag[k + j + m / 2] + wImag * AReal[k + j + m / 2];
                
                AReal[k + j + m / 2] = AReal[k + j] - tempReal;
                AImag[k + j + m / 2] = AImag[k + j] - tempImag;
                AReal[k + j] += tempReal;
                AImag[k + j] += tempImag;
                
                double newWReal = wReal * cosAngle - wImag * sinAngle;
                wImag = wReal * sinAngle + wImag * cosAngle;
                wReal = newWReal;
            }
        }
    }
    
    // Print FFT results
    for (size_t i = 0; i < N; i++) {
        cout << AReal[i] << " + " << AImag[i] << "i" << endl;
    }
}

// Inverse FFT function
void ifft(vector<double>& aReal) {
    int N = aReal.size();
    vector<double> AReal(N), AImag(N, 0.0);
    
    // Bit-reversal permutation
    int logN = log2(N);
    for (int i = 0; i < N; i++) {
        int rev = 0;
        for (int j = 0; j < logN; j++) {
            if (i & (1 << j)) rev |= (1 << (logN - 1 - j));
        }
        AReal[rev] = aReal[i];
    }
    
    // Iterative IFFT (similar to FFT but with a sign change)
    for (int s = 1; s <= logN; s++) {
        int m = 1 << s;
        double angle = 2.0 * PI / m;  // opposite sign of FFT
        double cosAngle = cos_taylor(angle);
        double sinAngle = sin_taylor(angle);
        for (int k = 0; k < N; k += m) {
            double wReal = 1.0;
            double wImag = 0.0;
            for (int j = 0; j < m / 2; j++) {
                double tempReal = wReal * AReal[k + j + m / 2] - wImag * AImag[k + j + m / 2];
                double tempImag = wReal * AImag[k + j + m / 2] + wImag * AReal[k + j + m / 2];
                
                AReal[k + j + m / 2] = AReal[k + j] - tempReal;
                AImag[k + j + m / 2] = AImag[k + j] - tempImag;
                AReal[k + j] += tempReal;
                AImag[k + j] += tempImag;
                
                double newWReal = wReal * cosAngle - wImag * sinAngle;
                wImag = wReal * sinAngle + wImag * cosAngle;
                wReal = newWReal;
            }
        }
    }

    // Normalize by dividing by N
    for (int i = 0; i < N; i++) {
        AReal[i] /= N;
        AImag[i] /= N;
    }

    // Print IFFT results
    for (size_t i = 0; i < N; i++) {
        cout << AReal[i] << " + " << AImag[i] << "i" << endl;
    }
}

int main() {
    vector<double> signalReal = {0, 1, 2, 3, 4, 5, 6, 7};
    
    // Perform FFT
    cout << "FFT Result:" << endl;
    fft(signalReal);
    
    // Perform IFFT
    cout << "\nIFFT Result:" << endl;
    ifft(signalReal);

    return 0;
}
