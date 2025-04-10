#include <ap_int.h>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string.h>
#include <stdlib.h>
#include <hls_math.h>

#include <vector>
#include "hls_stream.h"
using namespace std;

#define N 32
#define ES 2
#define TERMS 4
#define IN_SIZE 1024
#define APPR_TAILOR 0

#define FRAC_LEN (N-(ES+2))
#define MUL_LEN 2*FRAC_LEN
#define PI 3.14
#if (ES==0)
#define REG_SHIFT 1 //(1<<ES)
#define USEED 2 //(1<<REG_SHIFT)
#endif
#if (ES==1)
#define REG_SHIFT 2 //(1<<ES)
#define USEED 4 //(1<<REG_SHIFT)
#endif
#if (ES==2)
#define REG_SHIFT 4 //(1<<ES)
#define USEED 16 //(1<<REG_SHIFT)
#endif
#if (ES==3)
#define REG_SHIFT 8 //(1<<ES)
#define USEED 256 //(1<<REG_SHIFT)
#endif
#if (N==16) 
#define REG_LEN 5 //log2(N)+1
#endif
#if (N==24) 
#define REG_LEN 6 //log2(N)+1
#endif
#if (N==28) 
#define REG_LEN 6 //log2(N)+1
#endif
#if (N==32) 
#define REG_LEN 6 //log2(N)+1
#endif
#if (N==64) 
#define REG_LEN 7 //log2(N)+1
#endif
typedef ap_int<REG_LEN> regime_t;
typedef ap_uint<REG_LEN> ml_t;
typedef ap_uint<FRAC_LEN> mantissa_t;
typedef ap_uint<FRAC_LEN+REG_LEN+ES+1> mantissa_sf_t;
#if ES!=0
typedef ap_uint<ES> exponent_t;
#else
typedef ap_uint<1> exponent_t;
#endif
typedef ap_uint<FRAC_LEN+2> mant_add_t;
typedef ap_uint<FRAC_LEN+1> m_add_t;
typedef ap_uint<2> ovf_t;
typedef ap_uint<MUL_LEN> mul_t;
typedef ap_uint<MUL_LEN+2> dv_t;
typedef ap_int<REG_LEN+ES+1> sf_t;

typedef ap_uint<N-1> reg_t;
typedef ap_uint<N> posit_t;
typedef ap_uint<1> bool_t;


typedef struct POSIT{bool sign=0;bool isZero=1;bool isInf=0;regime_t regime=0;exponent_t exponent=0;mantissa_t mantissa=0;}POSIT;
typedef POSIT ps_t;



// Header declarations updated for streaming-based functions



// Accumulation functions for IFFT computation
// Defining some constant POSIT structs 
const ps_t POSIT_PI = {0, false, false, 0, 0, 1411}; 
const ps_t POSIT_2PI = {0, false, false, 2, 0, 842887333}; 
const ps_t ONE = {0, false, false, 0, 0, 1<<(FRAC_LEN-1)};
const ps_t ZERO = {0, true, false, 0, 0, 1<<(FRAC_LEN-1)}; 
regime_t LOD(reg_t reg);
int LOD_ADD(mant_add_t in);
ps_t  decode(posit_t posit);
posit_t encode(ps_t X);
posit_t posit_reverse(posit_t value);
ps_t posit_negate(ps_t posit);
ps_t int2posit(int X);
float posit2float(ps_t pos);
double posit2double(ps_t pos);
ps_t float2posit(float in);
ps_t double2posit(double in);

ps_t pReduceAngle(ps_t angle, bool &negate);
ps_t positAdd(ps_t x,ps_t y);
ps_t positMul(ps_t x,ps_t y);
ps_t positDiv(ps_t x,ps_t y);
ps_t positSub(ps_t x,ps_t y);
ps_t positCos(ps_t x);
ps_t positSin(ps_t x);
ps_t normalize_angle(ps_t x) ;
double dTailorSin(double in);
float fTailorSin(float in);
double dTailorCos(double in);
float fTailorCos(float in);
void pEuler(ps_t angle, ps_t *result_real, ps_t *result_imag);
void dEuler(double angle, double *result_real, double *result_imag);
void fEuler(float angle, float *result_real, float *result_imag);


struct pFFTResult {
    ps_t real[IN_SIZE];  // Array for real values
    ps_t imag[IN_SIZE];  // Array for imaginary values

    // Constructor (initialize arrays)
    pFFTResult(size_t size = IN_SIZE) {
        // Arrays are statically sized, no need to resize
        std::fill(std::begin(real), std::end(real), ps_t{ZERO});  // Initialize with zero
        std::fill(std::begin(imag), std::end(imag), ps_t{ZERO});  // Initialize with zero
    }
};

struct dFFTResult {
    double real[IN_SIZE];  // Array for real values
    double imag[IN_SIZE];  // Array for imaginary values

    // Constructor (initialize arrays)
    dFFTResult(size_t size = IN_SIZE) {
        // Arrays are statically sized, no need to resize
        std::fill(std::begin(real), std::end(real), 0.0);  // Initialize with zero
        std::fill(std::begin(imag), std::end(imag), 0.0);  // Initialize with zero
    }
};

struct fFFTResult {
    float real[IN_SIZE];  // Array for real values
    float imag[IN_SIZE];  // Array for imaginary values

    // Constructor (initialize arrays)
    fFFTResult(size_t size = IN_SIZE) {
        // Arrays are statically sized, no need to resize
        std::fill(std::begin(real), std::end(real), 0.0f);  // Initialize with zero
        std::fill(std::begin(imag), std::end(imag), 0.0f);  // Initialize with zero
    }
};

void fFFT(float signal[], fFFTResult& result);
void dFFT(double signal[], dFFTResult& result);
void pFFT(ps_t signal[], pFFTResult& result);

// IFFT functions for different signal types
void dIFFT(const double real[], const double imag[], double signal[], int sampleCount);
void fIFFT(const float real[], const float imag[], float signal[], int sampleCount);
void pIFFT(const ps_t real[], const ps_t imag[], ps_t signal[], int sampleCount);
