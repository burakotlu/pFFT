#include "posit.hpp"
#include <cmath>
bool isGreater_posit(ps_t x, ps_t y) {
    // Extract fields
    m_add_t x_mantissa = x.mantissa;
    m_add_t y_mantissa = y.mantissa;

    bool x_sign = x.sign;
    bool y_sign = y.sign;

    regime_t x_regime = x.regime;
    regime_t y_regime = y.regime;

    exponent_t x_exponent = x.exponent;
    exponent_t y_exponent = y.exponent;

    // Case 1: Different signs
    if (x_sign != y_sign)
        return (y_sign == 1); // If y is negative, x is greater

    // Same sign, compare absolute values
    bool absXGreaterEqual = 
        (x_regime > y_regime) ||
        (x_regime == y_regime && x_exponent > y_exponent) ||
        (x_regime == y_regime && x_exponent == y_exponent && x_mantissa > y_mantissa);

    if (x_sign == 0)
        return absXGreaterEqual;  // Both positive: larger abs = greater
    else
        return !absXGreaterEqual; // Both negative: smaller abs = greater
}
ps_t positMod(ps_t x, ps_t y){
    ps_t quotient,floor_val,c_x, inter,res;
    sf_t sf_fVal=0;
    mantissa_t m=0;
    bool small;
    bool x_sign = x.sign;
    bool y_sign = y.sign;
    c_x =x;
    c_x.sign = false;
    small= isGreater_posit(y, c_x);
    if (small) return x;
    else{
        quotient = positDiv(c_x,y) ;
        m.set(FRAC_LEN - 1);;
        quotient.mantissa = m;
        inter= positMul(quotient,y);
        res = positSub(c_x,inter);
        res.sign = x.sign;
        return res;
    }
    

}

float floatMul(float x, float y){
    return x*y;    
}

float floatDiv(float x, float y){
    return x/y;    
}
float floatAdd(float x, float y){
    return x+y;
}
float floatSub(float x, float y){
    return x-y;
}
double doubleMul(double x, double y){
    return x*y;
}
double doubleDiv(double x, double y){
    return x/y;
}
double doubleAdd(double x, double y){
    return x+y;
}
double doubleSub(double x, double y){
    return x-y;
}
regime_t LOD(reg_t reg){
	regime_t regime=0;
	bool flag=false;
	bool start=reg.bit(N-2);
	if(start==0) reg=~reg;

	LOD_LOOP:for(int i=N-3;i>=0;i--){
		if(reg.bit(i) && flag==0)
			regime++;
		else flag=true;

	}
    //std::cout<<"regime:"<<regime<<std::endl;
	return start?regime:(~regime)++;
}
int LOD_ADD(m_add_t in){
    bool flag=0;
    int count =0;
    for(int i=in.width-1;i>=0;i-- ){
        if(in[i] ==0){
            if(flag==false) count+=1;
        }
        else flag=true;
    }
    return count-1;
}
int LOD_MUL(mul_t in){
    bool flag=0;
    int count =0;
    for(int i=in.width-1;i>=0;i-- ){
        if(in[i] ==0){
            if(flag==false) count+=1;
        }
        else flag=true;
    }
    return FRAC_LEN-1-count;
}
int LOD_DIV(dv_t in){
    bool flag=0;
    int count =0;
    for(int i=in.width-1;i>=0;i-- ){
        if(in[i] ==0){
            if(flag==false) count+=1;
        }
        else flag=true;
    }
    return FRAC_LEN-1-count;
}
ps_t  decode(posit_t posit){

	ps_t pos;
	bool sign=0, isZero=0, isInf=0;
	regime_t regime;
	exponent_t exponent=0;
	mantissa_t mantissa=0;
	reg_t SREG,REM,reg;

	//decode sign
	sign=posit.bit(N-1);
    //zero case
	if(posit==0)  return pos;
    //inf case
    if(posit == (1<<(N-1))){
        pos.isZero=0;
        pos.isInf = 1;
        return pos;
    }
    //other cases

    if(sign)  posit=~posit+1;
    //find regime
    regime=LOD(posit.range(N-2,0));
    //std::cout<<"regime:"<<regime<<std::endl;
    //find SREG & REM
    if (regime >= 0) {
        if (regime + 3 < N) {
            SREG = (reg_t)regime + 3;
        } else {
            SREG = (reg_t)N;
        }
    } else {            
        SREG = 2 - regime;
    }
    REM=N-SREG;
    //find exponent & mantissa
    if(REM>0){
        if(ES==0){
            mantissa=posit.range(REM-1,0);
        }
        else{
            if(REM>ES){
                exponent=posit.range(REM-1,REM-ES);
                mantissa=posit.range(REM-(ES+1),0);
            }
            else {mantissa=0; exponent=posit.range(REM-1,0);}
        }
    }
	

	pos.sign=sign;
	pos.regime=regime;
	pos.exponent=exponent;
	pos.mantissa=mantissa;
	pos.isZero=isZero;
    pos.isInf = isInf;
	return pos;
}

posit_t encode(ps_t x){
	posit_t posit=0;
	reg_t SREG,REM,reg;
	regime_t regime;
	exponent_t exponent;
	mantissa_t mantissa;
	bool sign, isZero, isInf;

	isZero=x.isZero;
    isInf = x.isInf;
	sign=x.sign;
	exponent=x.exponent;
	regime=x.regime;
	mantissa=x.mantissa;
    
	if(isZero) posit=0;
    else if(isInf) posit =  1<<(N-1);
    else{
        if (regime >= 0) {
            if (regime + 3 < N) {
                SREG = (reg_t)regime + 3;
            } else {
                SREG = (reg_t)N;
            }
        } else {            
            SREG = 2 - regime;
        }
        REM=N-SREG;
        //SET REGIME BITS
        //max regime case
        if(regime==N-2){
            posit=(~posit).range(N-2,0);
        }
        //positive regime case
        else if(regime>=0){ 
            posit.range(N-2,REM+1)=~posit.range(N-2,REM+1);
        }
        //negative regime case
        else{
            posit.bit(REM)=1;
        }
        //SET OTHER BITS
        if(REM>0){
            if(ES==0){
                posit.range(REM-1,0)=mantissa;
            }
            else{
                if(REM>ES){
                    posit.range(REM-1,REM-ES)=exponent;
                    posit.range(REM-(ES+1),0)=mantissa;
                }
                else posit.range(REM-1,0)=exponent;
            }
        }
	    if(sign) posit=~posit+1;
    }

	return posit;
}

ps_t posit_negate(ps_t posit) {
    ps_t negated_posit;

    // Negate the sign
    negated_posit.sign = (posit.sign == 0) ? 1 : 0;

    // Copy other fields
    negated_posit.regime = posit.regime;
    negated_posit.exponent = posit.exponent; // Assuming "e" refers to exponent
    negated_posit.mantissa = posit.mantissa; // Assuming "m" refers to mantissa
    negated_posit.isZero = posit.isZero;
    negated_posit.isInf = posit.isInf;


    return negated_posit;
}
ps_t float2posit(float in) {
    ps_t result;
    regime_t regime = 0;
    exponent_t exponent = 0;
    mantissa_t mantissa = 0;
    bool sign = false, isZero = false;
    reg_t exact, mant_part, SREG, REM;
    sf_t sf;

    // Define the maximum representable value for the given Posit size
    double MAX = pow(2, REG_SHIFT * (N - 2)); //(1 << (REG_SHIFT * (N - 2)));

    // Handle zero input
    if (in == 0.0) {
        isZero = true;
    }
    // Handle overflow and underflow cases
    else if (in >= MAX) {
        regime = N - 2; // Maximum positive regime
    } else if (in <= -MAX) {
        regime = N - 2; // Maximum negative regime
        sign = 1;
    } else {
        // Handle negative numbers
        if (in < 0) {
            sign = true;
            in = -in;
        }

        // Determine the scale factor (sf) and regime
        sf = (int)log2(in); // Scale factor
        exact = 1 << sf;    // Closest power of 2 less than or equal to `in`
        mant_part = (in - exact) * (1 << FRAC_LEN); // Remaining part scaled to mantissa bits
        regime = sf >> ES;

        //find SREG & REM
        if (regime >= 0) {
            if (regime + 3 < N) {
                SREG = (reg_t)regime + 3;
            } else {
                SREG = (reg_t)N;
            }
        } else {            
            SREG = 2 - regime;
        }
        REM=N-SREG;

        // Handle exponent and mantissa extraction
        if (ES == 0) {
            if (REM > 0) {
                mantissa.range(FRAC_LEN - 2, FRAC_LEN - REM - 1) = mant_part << (REM - sf);
                mantissa.set(FRAC_LEN - 1);
            }
        } else {
            if (REM > ES) {
                exponent = sf & ((1 << ES) - 1); // Extract `ES` bits from sf
                mantissa.range(FRAC_LEN - 2, FRAC_LEN - REM + ES - 1) = mant_part << (REM - sf - ES);
                mantissa.set(FRAC_LEN - 1);
            } else if (REM > 0) {
                exponent = sf & ((1 << REM) - 1); // Use remaining bits for exponent
            }
        }
    }

    // Populate the result structure
    result.sign = sign;
    result.regime = regime;
    result.exponent = exponent;
    result.mantissa = mantissa;
    result.isZero = isZero;

    return result;
}
double stable_floor(double x, double epsilon = 1e-9) {
    if (std::abs(x - std::round(x)) < epsilon) {
        return std::round(x);  // Close enough to be considered an integer
    }
    return std::floor(x);
}
ps_t double2posit(double in) {
    ps_t result;
    regime_t regime = 0;
    exponent_t exponent = 0;
    mantissa_t mantissa = 0;

    bool sign = false, isZero = false;
    double exact=0,diff=0;
    reg_t   SREG=0, REM=0;
    mantissa_t mant_part=0;
    mantissa_sf_t mant_with_sf=0, factor=0;
    sf_t sf=0;
    if (in==0){
        result.isZero =1;
        return result;
    }

    if (in < 0) {
        sign = true;
        in = -in;
    }
    
    double sf_d = hls::log2(in);
    double fl= stable_floor(sf_d);
    bool sf_exact =  (fl  == sf_d);  
         
    sf = (sf_t)static_cast<int>(fl); // Scale factor
   // std::cout<<"sf: "<<sf<<std::endl;
    //if(in<1 && !sf_exact) sf= sf-1;        
    exact = hls::pow((double)2.0,(double)sf);  
      
    diff = in-exact;
    
    factor.set(FRAC_LEN-1); 
    double interm = diff * factor;
    long long dtol =  interm;
    mant_with_sf = dtol;
    mant_part= mant_with_sf >> (int)sf; 
    regime = (sf_t)sf >> ES;
/*
    std::cout<<"in: "<<in<<std::endl;
    std::cout<<"sf_d: "<<sf_d<<std::endl;
    std::cout<<"sf_exact"<<sf_exact<<std::endl;
    std::cout<<"sf: "<<sf<<std::endl;
    std::cout<<"fl: "<<fl<<std::endl;
    std::cout<<"exact "<<exact<<std::endl;
    std::cout<<"diff "<<diff<<std::endl;
    std::cout<<"factor: "<<factor<<std::endl;
    std::cout<<"interm "<<interm<<std::endl;
    std::cout<<"dtol "<<dtol<<std::endl;
    std::cout<<"mant_with_sf "<<mant_with_sf<<std::endl;
    std::cout<<"mant_part "<<mant_part<<std::endl;
    std::cout<<"regime "<<regime<<std::endl;
    std::cout<<"FRAC_LEN "<<FRAC_LEN<<std::endl;
    */
    //find SREG & REM
    if (regime >= 0) {
        if (regime + 3 < N) {
            SREG = (reg_t)regime + 3;
        } else {
            SREG = (reg_t)N;
        }
    } else {            
        SREG = 2- regime;
    }
    REM=N-SREG;
/*
    std::cout<<SREG<<std::endl;
    std::cout<<"REM: "<<REM<<std::endl;*/
    // Handle exponent and mantissa extraction
    if(REM>0){
        if (REM > ES) {
            exponent = sf & ((1 << ES) - 1);
            mantissa= (mantissa_t)mant_part ;
            mantissa.set(FRAC_LEN-1);
        }
        else{
            exponent = sf & ((1 << REM) - 1); 
        }

    }
    
  /*  std::cout<<exponent<<std::endl;
    std::cout<<mantissa<<std::endl;*/
    result.sign = sign;
    result.regime = regime;
    result.exponent = exponent;
    result.mantissa = mantissa;
    result.isZero = isZero;


    return result;
}
float posit2float(ps_t pos){
	ml_t ml;
	float result=0,mantissa,man_d,u_R,e;

	if(pos.isZero) return result;
	if(pos.regime>=0)	ml=N-(pos.regime+3+ES);
	else	ml=N-2+pos.regime-ES;
	man_d=(float)(1<<ml);
	mantissa=(float)pos.mantissa/man_d;
    
	u_R=hls::pow((float)USEED,(float)pos.regime);
	e=hls::pow(2,pos.exponent);
	result=(float)(u_R*e*(1+mantissa));
	return pos.sign?-result:result;
}
double posit2double(ps_t pos){
	ml_t ml;
    sf_t sf;
	double result=0,mantissa,man_d,u_R,e,m;

	if(pos.isZero) return result;
    if(pos.isInf) return INFINITY;
    //std::cout<<pos.mantissa<<std::endl;
    //std::cout<<(double) (1<<FRAC_LEN)<<std::endl;
    mantissa =  (double)pos.mantissa / (double) (1<<(FRAC_LEN-1));
    //std::cout<<"mantissa: "<<mantissa<<std::endl;
	u_R=hls::pow((double)USEED,pos.regime);
	e=hls::pow(2.0,pos.exponent);
    m= mantissa;
	result=u_R*e*m;
    //std::cout<<"m: "<<m<<std::endl;
 /*   std::cout<<"pos.mantissa: "<<pos.mantissa<<std::endl;
    std::cout<<"(double) (1<<FRAC_LEN): "<<(double) (1<<FRAC_LEN)<<std::endl;
    std::cout<<"mantissa: "<<mantissa<<std::endl;
    std::cout<<"u_R: "<<u_R<<std::endl;
    std::cout<<"e: "<<e<<std::endl;
    std::cout<<"result: "<<result<<std::endl;*/
	return pos.sign?-result:result;
}

ps_t int2posit(int in){
	ps_t result;
	regime_t regime=0;
	exponent_t exponent=0;
	mantissa_t mantissa=0;
	bool sign=false, isZero=false;
	reg_t exact,mant_part,SREG,REM;
	sf_t sf;

	double MAX=pow(2,REG_SHIFT*(N-2));//(1<<(REG_SHIFT*(N-2)));

	if(in==0) isZero=true;
	else if(in>=MAX) regime=N-2;
	else if(in<=-MAX) { regime=N-2; sign=1; }
	else{
	//if negative
		if(in<0)  {sign=true; in=-in;}
	// find regime
		sf=(int)log2(in); //note: log2 causes great LUT increase
		exact=1<<sf;
		mant_part=in-exact;
		regime=sf>>ES;
	//find SREG & REM
		SREG=regime>=0?regime+3:2-regime;
		REM=N-SREG;
	// find exponent and mantissa
		if(ES==0){
			if(REM>0) mantissa=mant_part<<(REM-sf);
		}
		else{
			if(REM>=ES) {
				exponent=sf.range(ES-1,0);
				mantissa=mant_part<<(REM-sf-ES);
			}
			else if(REM>0) {
				exponent=sf.range(REM-1,0);
			}
		}
	}
	result.sign=sign;
	result.regime=regime;
	result.exponent=exponent;
	result.mantissa=mantissa;
	result.isZero=isZero;
	return result;
}
ps_t positAdd(ps_t x,ps_t y){

	ps_t result;
	sf_t sf_L,sf_S,sf_x,sf_y,sf_r,diff;
	m_add_t mL,mS,mantissa=0,x_mantissa,y_mantissa;
	bool sign,x_sign,y_sign,ABSxIsGreaterEqual,isZero=0,x_isZero,y_isZero;
    int SA=0;
	regime_t regime,x_regime,y_regime;
	exponent_t exponent=0,x_exponent,y_exponent;
	reg_t SREG,REM;
	//read parameters
	x_sign=x.sign;			 y_sign=y.sign;
	x_regime=x.regime;		 y_regime=y.regime;
	x_exponent=x.exponent;	 y_exponent=y.exponent;
	x_mantissa=x.mantissa;   y_mantissa=y.mantissa;
	x_isZero=x.isZero;		 y_isZero=y.isZero;

	//Set the Flag
	ABSxIsGreaterEqual=	x_regime>y_regime ||(x_regime==y_regime && x_exponent>y_exponent)||
			(x_regime==y_regime && x_exponent==y_exponent &&x_mantissa>=y_mantissa);
	//Sign
	sign=ABSxIsGreaterEqual?x_sign:y_sign;
	//determine sf_x & sf_y &sf_r
	sf_x=((sf_t)x_regime<<ES)+x_exponent;
	sf_y=((sf_t)y_regime<<ES)+y_exponent;
	sf_r=ABSxIsGreaterEqual?sf_x:sf_y;
    sf_L=ABSxIsGreaterEqual?sf_x:sf_y;
    sf_S=ABSxIsGreaterEqual?sf_y:sf_x;
    mL=ABSxIsGreaterEqual?x_mantissa:y_mantissa;
    mS=ABSxIsGreaterEqual?y_mantissa:x_mantissa;


    //std::cout<<x_mantissa<<" "<<y_mantissa<<std::endl;   
    //std::cout<<mL<<" "<<mS<<std::endl; 
    diff = sf_L -sf_S;
    mS  = mS >>diff;
	if(x_sign ^ y_sign){ //Substraction
        mantissa = mL  - mS;
	}
	else { //Addition  
		mantissa = mL + mS;
	}
    //std::cout<<"mantissa:"<<mantissa<<std::endl;
    SA =  LOD_ADD(mantissa);
    mantissa = mantissa <<SA;
    sf_r = sf_r-SA;


  /*

    std::cout<<"x_mantissa:"<<x_mantissa<<std::endl;
    std::cout<<"y_mantissa:"<<y_mantissa<<std::endl;
    std::cout<<"sf_x:"<<sf_x<<std::endl;
    std::cout<<"sf_y:"<<sf_y<<std::endl;
    std::cout<<"sf_r:"<<sf_r<<std::endl;
    std::cout<<"mantissa:"<<mantissa<<std::endl;
    std::cout<<"mL:"<<mL<<std::endl;
    std::cout<<"mS:"<<mS<<std::endl;
    std::cout<<"diff:"<<diff<<std::endl;
    std::cout<<"SA:"<<SA<<std::endl;

*/
	// set regime & exponent & mantissa
	regime=sf_r>>ES;
	//find SREG & REM
	SREG=regime>=0?regime+3:2-regime;
	REM=N-SREG;
    // Handle exponent and mantissa extraction
    if(REM>0){
        if (REM > ES) {
            exponent = sf_r & ((1 << ES) - 1);
            mantissa= (mantissa_t)mantissa ;
        }
        else{
            exponent = sf_r & ((1 << REM) - 1); 
        }

    }
	if((x_isZero && y_isZero)||((x_regime==y_regime && x_exponent==y_exponent && x_mantissa==y_mantissa )&& x.sign!=y.sign)){
		isZero=true;
		regime=0; exponent=0; mantissa=0;
	}
	else if(x_isZero && !y_isZero){ // x=0 ,y!=0 --> r=y
		sign=y_sign;
		regime=y_regime;
		exponent=y_exponent;
		mantissa=y_mantissa;
	}
	else if(!x_isZero && y_isZero){ // y=0 ,x!=0 --> r=x
		sign=x_sign;
		regime=x_regime;
		exponent=x_exponent;
		mantissa=x_mantissa;
	}
	result.regime=regime;
	result.exponent=exponent;
	result.mantissa=mantissa;
	result.sign=sign;
	result.isZero=isZero;
	return result;
}

ps_t positDiv2p(ps_t in,int i){
    ps_t result;
    sf_t sf_in, sf_out;
    result = in;
    sf_in=((sf_t)in.regime<<ES)+in.exponent;
    sf_out = sf_in +i;
    if (sf_out.range(REG_LEN+ES,REG_LEN+ES-1)==2){
        result.regime = 2-N;
    }
    else{
        result.regime=sf_out>>ES;
        result.exponent = sf_out & ((1 << ES) - 1);
    }

    return result;

}
ps_t positDiv(ps_t x,ps_t y){

	ps_t result;
	sf_t sf_x,sf_y,sf_r;
	bool sign,x_sign,y_sign,x_isZero,y_isZero,isZero=0;
	regime_t R,regime,x_regime,y_regime;
	exponent_t exponent=0,y_exponent,x_exponent;
	mantissa_t mantissa=0;
	dv_t x_mantissa,y_mantissa,mant=0;
	reg_t SREG,REM;
	int SA=0;
	//read parameters
	x_sign=x.sign;			 y_sign=y.sign;
	x_regime=x.regime;		 y_regime=y.regime;
	x_exponent=x.exponent;	 y_exponent=y.exponent;
	x_mantissa=x.mantissa;   y_mantissa=y.mantissa;
	x_isZero=x.isZero;		 y_isZero=y.isZero;
	//Sign
	sign=x_sign ^ y_sign;
	//isZero
	isZero=x_isZero | y_isZero;
	//determine scaling factors sf_x & sf_y & sf_r
	sf_x=((sf_t)x_regime<<ES)+x_exponent;
	sf_y=((sf_t)y_regime<<ES)+y_exponent;
	sf_r=sf_x-sf_y;
    //Sf Overflow
    if (sf_r.range(REG_LEN+ES,REG_LEN+ES-1)==2){
        regime = 2-N;
    }
    else{

        //multiply mantissa 

        mant = (x_mantissa<<(FRAC_LEN-1))/y_mantissa;
        //bool ex_bit = mant[0];
        //mant = mant>>1;
    /*   std::cout<<"mant:"<<mant<<std::endl;
        std::cout<<"sf_r:"<<sf_r<<std::endl;*/
        if(mant[FRAC_LEN-1] == 0){
            mant = (mant<<1);
            //mant[0]= ex_bit;
            sf_r = sf_r-1;
        }
        mantissa = (mantissa_t)mant;   
    /*
        std::cout<<"x_mantissa:"<<x_mantissa<<std::endl;
        std::cout<<"y_mantissa:"<<y_mantissa<<std::endl;
        std::cout<<"sf_x:"<<sf_x<<std::endl;
        std::cout<<"sf_y:"<<sf_y<<std::endl;
        std::cout<<"sf_r:"<<sf_r<<std::endl;
        std::cout<<"mantissa:"<<mantissa<<std::endl;
        std::cout<<"mant:"<<mant<<std::endl;
    */

        //determine regime
        regime=sf_r>>ES;

    }
    if (sf_r.range(REG_LEN+ES,REG_LEN+ES-1)==2){
        regime = 2-N;
    }
	if(regime>=N-2) regime=N-2;
	else if(regime<2-N) regime=2-N;
	else{
		//find SREG & REM
		SREG=regime>=0?regime+3:2-regime;
		REM=N-SREG;
        if(REM>0){
            if (REM > ES) {
                exponent = sf_r & ((1 << ES) - 1);

            }
            else{
                exponent = sf_r & ((1 << REM) - 1); 
            }

        }
	}
	if(isZero) {regime=0;exponent=0;mantissa=0;sign=0;}
	//set result
	result.regime=regime;
	result.exponent=exponent;
	result.mantissa=mantissa;
	result.sign=sign;
	result.isZero=isZero;

	return result;
}

ps_t positMul(ps_t x,ps_t y){

	ps_t result;
	sf_t sf_x,sf_y,sf_r,max =((2-N)<<ES);
    
	bool ovf,sign,x_sign,y_sign,x_isZero,y_isZero,isZero=0;
	regime_t R,regime,x_regime,y_regime;
	exponent_t exponent=0,y_exponent,x_exponent;
	mantissa_t mantissa=0;
	mul_t x_mantissa,y_mantissa,mant=0,mul_part=0,mInter=0;
	reg_t SREG,REM;
	int SA=0;
    mantissa.set(FRAC_LEN-1);
	//read parameters
	x_sign=x.sign;			 y_sign=y.sign;
	x_regime=x.regime;		 y_regime=y.regime;
	x_exponent=x.exponent;	 y_exponent=y.exponent;
	x_mantissa=x.mantissa;   y_mantissa=y.mantissa;
	x_isZero=x.isZero;		 y_isZero=y.isZero;
	//Sign
	sign=x_sign ^ y_sign;
	//isZero
	isZero=x_isZero | y_isZero;
	//determine scaling factors sf_x & sf_y & sf_r
	sf_x=((sf_t)x_regime<<ES)+x_exponent;
	sf_y=((sf_t)y_regime<<ES)+y_exponent;
	sf_r=(sf_t)sf_x+sf_y;
    //bool SignSfx,SignSfy,SignSfr;
   // SignSfx = sf_x[REG_LEN+ES];
   // SignSfy = sf_y[REG_LEN+ES];    
    //SignSfr = sf_r[REG_LEN+ES]; 
 //   std::cout<<SignSfx<<SignSfy<<SignSfr<<std::endl;
    //bool sf_overflow = (!SignSfx && !SignSfy && SignSfr) || (SignSfx && SignSfy && !SignSfr);
//    std::cout<<sf_overflow<<std::endl;
    //if (sf_r<max ||sf_overflow ) sf_r =max;
 //   std::cout<<"------------------MUL-------------------"<<std::endl;
   // std::cout<<"sf_r:"<<sf_r<<std::endl;
    //std::cout<<"ovf: "<<sf_r.range(REG_LEN+ES,REG_LEN+ES-1)<<std::endl;
    //Sf Overflow
    //std::cout<<"sf_r.range(REG_LEN+ES,REG_LEN+ES-1) "<<sf_r.range(REG_LEN+ES,REG_LEN+ES-1)<<std::endl;
    if (sf_r.range(REG_LEN+ES,REG_LEN+ES-1)==2){
        regime = 2-N;
        //std::cout<<"OVF"<<std::endl;
        //std::cout<<"regime:"<<regime<<std::endl;
    }
    else{
        //multiply mantissa 
        mant = (mul_t) x_mantissa * y_mantissa;
        ovf = mant[MUL_LEN-1];
        if (ovf){
            sf_r+=1;
            mantissa = (mantissa_t) mant.range(MUL_LEN-1,MUL_LEN-FRAC_LEN);
        } 
        else
            mantissa = (mantissa_t) mant.range(MUL_LEN-2,MUL_LEN-1-FRAC_LEN);
 /*       std::cout<<"mant: "<<mant<<std::endl;
        std::cout<<"MUL_LEN-2: "<<MUL_LEN-2<<std::endl;
        std::cout<<"MUL_LEN-1-FRAC_LEN: "<<MUL_LEN-1-FRAC_LEN<<std::endl;
        std::cout<<"ovf: "<<ovf<<std::endl;
        std::cout<<"mantissa: "<<mantissa<<std::endl;*/
        //mInter.set(FRAC_LEN);
        //mul_part = (x_mantissa * y_mantissa) >>FRAC_LEN;
        //mant= x_mantissa +y_mantissa + mul_part+mInter;
        //SA = LOD_MUL(mant);
        //std::cout<<"mant:"<<mant<<std::endl;
        //mant = mant>>SA;


        //determine regime
        regime=sf_r>>ES;
    }
    //std::cout<<"regime:"<<regime<<std::endl;
	if(regime>=N-2) regime=N-2;
	else if(regime<=2-N) regime=2-N;
	else{
		//find SREG & REM
		SREG=regime>=0?regime+3:2-regime;
		REM=N-SREG;
        if(REM>0){
            if (REM > ES) {
                exponent = sf_r & ((1 << ES) - 1);
                mantissa= (mantissa_t)mantissa ;
            }
            else{
                exponent = sf_r & ((1 << REM) - 1); 
            }

        }
	}
	if(isZero) {regime=0;exponent=0;mantissa=0;sign=0;}
	//set result
	result.regime=regime;
	result.exponent=exponent;
	result.mantissa=mantissa;
	result.sign=sign;
	result.isZero=isZero;
    //std::cout<<"mant:"<<mant<<std::endl;
    //mantissa=mant.range(FRAC_LEN-1,0);
    //sf_r+=SA;
 /*   std::cout<<"sf_r:"<<sf_r<<std::endl;
    std::cout<<"x_mantissa:"<<x_mantissa<<std::endl;
    std::cout<<"y_mantissa:"<<y_mantissa<<std::endl;
    std::cout<<"sf_x:"<<sf_x<<std::endl;
    std::cout<<"sf_y:"<<sf_y<<std::endl;
    std::cout<<"mInter:"<<mInter<<std::endl;
    std::cout<<"mantissa:"<<mantissa<<std::endl;
    std::cout<<"SA:"<<SA<<std::endl;
    std::cout<<"mul_part:"<<mul_part<<std::endl;
    std::cout<<"regime:"<<regime<<std::endl;
    std::cout<<"exponent:"<<exponent<<std::endl;
    std::cout<<"mantissa:"<<mantissa<<std::endl;
    std::cout<<"sign:"<<sign<<std::endl;
    std::cout<<"isZero:"<<isZero<<std::endl;
    std::cout<<"------------------MUL ENDs-------------------"<<std::endl;*/
	return result;
}

ps_t positSub(ps_t x,ps_t y){

	ps_t result;
	y.sign= !(y.sign);
	result=positAdd(x,y);
	return result;
}

///////////////////////////COS////////////////////////////////
double dReduceAngle(double angle, bool &negate) {
    // Begrenzung auf [-π, π]
    angle = fmod(angle, 2 * PI);
    if (angle > PI) 
        angle -= 2 * PI;
    else if (angle < -PI) 
        angle += 2 * PI;

    // Kosinus-Symmetrie ausnutzen
    negate = false;
    if (angle > PI / 2) {
        angle = PI - angle;
        negate = true;  // Negation für cos(-x) beachten
    } else if (angle < -PI / 2) {
        angle = -PI - angle;
        negate = true;  // Negation für cos(-x) beachten
    }

    return angle;
}

// Taylor-Approximation für cos(x)


double dTailorCos(double x) {
    bool negate;
    double x2,term1,term2,term3,term4;
    x = dReduceAngle(x, negate);  // Reduce the angle to [0, π/2]

    x2 = x * x;
    term1 = 1.0;
    term2 = x2 / 2.0;

    #if TERMS > 2
        #if APPR_TAILOR ==0
            term3 = x2 * x2 / 24.0;
        #elif APPR_TAILOR ==1
            term3 = x2 * x2 / 32.0;
        #endif
    #endif

    #if TERMS > 3
        #if APPR_TAILOR ==0
            term4 = x2 * term3 / 30.0;
        #elif APPR_TAILOR ==1
            term4 = x2 * term3 / 32.0;
        #endif
    #endif

    #if TERMS == 2
        return negate ? -(term1 - term2) : (term1 - term2);
    #elif TERMS == 3
        return negate ? -(term1 - term2 + term3) : (term1 - term2 + term3);
    #elif TERMS == 4
        return negate ? -(term1 - term2 + term3 - term4) : (term1 - term2 + term3 - term4);
    #else
        return negate ? -(term1 - term2 + term3 - term4) : (term1 - term2 + term3 - term4);
    #endif
}

float fReduceAngle(float angle, bool &negate) {
    // Begrenzung auf [-π, π]
    angle = fmod(angle, 2 * PI);
    if (angle > PI) 
        angle -= 2 * PI;
    else if (angle < -PI) 
        angle += 2 * PI;

    // Kosinus-Symmetrie ausnutzen
    negate = false;
    if (angle > PI / 2) {
        angle = PI - angle;
        negate = true;  // Negation für cos(-x) beachten
    } else if (angle < -PI / 2) {
        angle = -PI - angle;
        negate = true;  // Negation für cos(-x) beachten
    }

    return angle;
}

// Taylor-Approximation für cos(x)
/*
float fTailorCos(float x) {
    bool negate;
    x = fReduceAngle(x, negate);  // Reduziere den Winkel auf [0, π/2]

    float x2 = x * x;
    float term1 = 1.0;
    float term2 = x2 / 2.0;
    float term3 = x2 * x2 / 24.0;
    float term4 = x2 * term3 /30.0;
    //float result = term1 - term2  ;
    //float result = term1 - term2 + term3 ;
    float result = term1 - term2 + term3 -term4;
    return negate ? -result : result;  // Falls gespiegelt, das Vorzeichen setzen
}*/
float fTailorCos(float x) {
    bool negate;
    float x2,term1,term2,term3,term4;
    x = dReduceAngle(x, negate);  // Reduce the angle to [0, π/2]

    x2 = x * x;
    term1 = 1.0;
    term2 = x2 / 2.0;

    #if TERMS > 2
        #if APPR_TAILOR ==0
            term3 = x2 * x2 / 24.0;
        #elif APPR_TAILOR ==1
            term3 = x2 * x2 / 32.0;
        #endif
    #endif

    #if TERMS > 3
        #if APPR_TAILOR ==0
            term4 = x2 * term3 / 30.0;
        #elif APPR_TAILOR ==1
            term4 = x2 * term3 / 32.0;
        #endif
    #endif

    #if TERMS == 2
        return negate ? -(term1 - term2) : (term1 - term2);
    #elif TERMS == 3
        return negate ? -(term1 - term2 + term3) : (term1 - term2 + term3);
    #elif TERMS == 4
        return negate ? -(term1 - term2 + term3 - term4) : (term1 - term2 + term3 - term4);
    #else
        return negate ? -(term1 - term2 + term3 - term4) : (term1 - term2 + term3 - term4);
    #endif
}

#define EPSILON 1e-12  // Adjust this based on precision needs

double safeZero(double value) {
    return (std::abs(value) < EPSILON) ? 0.0 : value;
}
ps_t pReduceAngle(ps_t angle, bool &negate) {
    ps_t m_angle;
    m_angle = positMod(angle,POSIT_2PI);

    if (isGreater_posit(m_angle,POSIT_PI ))
        m_angle = positAdd(m_angle,POSIT_M_2PI);
    else if (isGreater_posit(POSIT_M_PI,m_angle ))  
        m_angle = positAdd(m_angle,POSIT_2PI);

    // Kosinus-Symmetrie ausnutzen
    negate = false;
	if (isGreater_posit(m_angle,POSIT_PI_OVER2 ))	{
		m_angle = positSub(POSIT_PI,m_angle);
        negate = true;  // Negation für cos(-x) beachten
    }else if (isGreater_posit(POSIT_M_PI_OVER2,m_angle )){
		m_angle = positAdd(m_angle,POSIT_PI);
		m_angle.sign=!m_angle.sign;
        negate = true;  // Negation für cos(-x) beachten
    }
	return m_angle;
}/*
ps_t pReduceAngle(ps_t angle, bool &negate) {
    // Begrenzung auf [-π, π]
    double dAngle = posit2double(angle);
//std::cout<<"dangle: "<<dAngle<<std::endl;
    dAngle = fmod(dAngle, 2 * PI);

    if (dAngle >= PI) 
        dAngle -= 2 * PI;
    else if (dAngle <= -PI) 
        dAngle += 2 * PI;

    // Kosinus-Symmetrie ausnutzen
    negate = false;
    if (dAngle >= PI / 2) {
        dAngle = PI - dAngle;
        negate = true;  // Negation für cos(-x) beachten
    } else if (dAngle <= -PI / 2) {
        dAngle = -PI - dAngle;
        negate = true;  // Negation für cos(-x) beachten
    }
   // std::cout<<"dangle: "<<dAngle<<std::endl;
    dAngle = safeZero(dAngle);
   // std::cout<<"dangle: "<<dAngle<<std::endl;
    return double2posit(dAngle);
}*/
// Approximate cosine using Taylor series expansion
ps_t positCos(ps_t x) {
    ps_t y, y2, y4, result;
    ps_t term1, term2, term3, t1minust2, term4;
    bool negate;
    term1 = ONE;
    if (x.isZero == 1) return term1;
    y = pReduceAngle(x, negate);

    y2 = positMul(y, y);
    y4 = positMul(y2, y2);

    term2 = positDiv2p(y2, -1);

    #if TERMS > 2
        #if APPR_TAILOR ==0
            term3 = positDiv(y4, double2posit(24.0));
        #elif APPR_TAILOR ==1
            term3 = positDiv2p(y4, -5);
        #endif
    #endif

    #if TERMS > 3
        #if APPR_TAILOR ==0
            term4 = positDiv(positMul(term3, y2), double2posit(30.0));
        #elif APPR_TAILOR ==1
            term4 = positDiv2p(positMul(term3, y2), -5);
        #endif        
    #endif

    t1minust2 = positSub(term1, term2);

    #if TERMS == 2
        result = t1minust2;
    #elif TERMS == 3
        result = positAdd(t1minust2, term3);
    #elif TERMS == 4
        result = positSub(positAdd(t1minust2, term3), term4);
    #else
        result = positSub(positAdd(t1minust2, term3), term4);
    #endif
    
    return negate ? posit_negate(result) : result;
}
///////////////////////////SINE////////////////////////////////
double dNAngle(double angle) {
    //std::cout<<"angle: "<<angle<<std::endl;
    angle = fmod(angle, 2 * PI);  // Begrenzung auf [-2π, 2π]
    
    if (angle > PI) 
        angle -= 2 * PI;
    else if (angle < -PI) 
        angle += 2 * PI;

    if (angle > PI / 2) 
        angle = PI - angle;
    else if (angle < -PI / 2) 
        angle = -PI - angle;

    return angle;
}

double dTailorSin(double in) {
    double term1, term2, term3, term4, x;
    x = dNAngle(in);

    term1 = x;
    #if APPR_TAILOR ==0
        term2 = x * x * x / 6.0;
    #elif APPR_TAILOR ==1
        term2 = x * x * x / 8.0;
    #endif
    #if TERMS > 2
        #if APPR_TAILOR ==0
            term3 = term2 * x * x / 20.0;
        #elif APPR_TAILOR ==1
            term3 = term2*x*x/16.0;
        #endif
    #endif
    #if TERMS > 3
        #if APPR_TAILOR ==0
            term4 = term3 * x * x / 42.0;
        #elif APPR_TAILOR ==1
            term4 = term3*x*x/32.0;
        #endif
    #endif

    #if TERMS == 2
        return term1 - term2;
    #elif TERMS == 3
        return term1 - term2 + term3;
    #elif TERMS == 4
        return term1 - term2 + term3 - term4;
    #else
        return term1 - term2 + term3 - term4;
    #endif
}

float fNAngle(float angle) {
    angle = fmod(angle, 2 * PI);  // Begrenzung auf [-2π, 2π]
    
    if (angle > PI) 
        angle -= 2 * PI;
    else if (angle < -PI) 
        angle += 2 * PI;

    if (angle > PI / 2) 
        angle = PI - angle;
    else if (angle < -PI / 2) 
        angle = -PI - angle;

    return angle;
}

float fTailorSin(float in) {
    float term1, term2, term3, term4, x;
    x = dNAngle(in);

    term1 = x;
    #if APPR_TAILOR ==0
        term2 = x * x * x / 6.0;
    #elif APPR_TAILOR ==1
        term2 = x * x * x / 8.0;
    #endif
    #if TERMS > 2
        #if APPR_TAILOR ==0
            term3 = term2 * x * x / 20.0;
        #elif APPR_TAILOR ==1
            term3 = term2*x*x/16.0;
        #endif
    #endif
    #if TERMS > 3
        #if APPR_TAILOR ==0
            term4 = term3 * x * x / 42.0;
        #elif APPR_TAILOR ==1
            term4 = term3*x*x/32.0;
        #endif
    #endif

    #if TERMS == 2
        return term1 - term2;
    #elif TERMS == 3
        return term1 - term2 + term3;
    #elif TERMS == 4
        return term1 - term2 + term3 - term4;
    #else
        return term1 - term2 + term3 - term4;
    #endif
}


ps_t pNAngle(ps_t angle) {
    ps_t m_angle;
    m_angle = positMod(angle,POSIT_2PI);

    if (isGreater_posit(m_angle,POSIT_PI )) 
        m_angle = positAdd(m_angle,POSIT_M_2PI);
	else if (isGreater_posit(POSIT_M_PI,m_angle )) 
		m_angle = positAdd(m_angle,POSIT_2PI);	
	if (isGreater_posit(m_angle,POSIT_PI_OVER2 ))	
		m_angle = positSub(POSIT_PI,m_angle);
	else if (isGreater_posit(POSIT_M_PI_OVER2,m_angle )){
		m_angle = positAdd(m_angle,POSIT_PI);
		m_angle.sign=!m_angle.sign;
        }
	return m_angle;


}/*
ps_t pNAngle(ps_t angle) {
    //Test
    double dAngle = posit2double(angle);
    //std::cout<<"dAngle: "<<dAngle<<std::endl;
    dAngle = fmod(dAngle, 2 * PI);  // Begrenzung auf [-2π, 2π]
    
    if (dAngle > PI) 
        dAngle -= 2 * PI;
    else if (dAngle < -PI) 
        dAngle += 2 * PI;

    if (dAngle > PI / 2) 
        dAngle = PI - dAngle;
    else if (dAngle < -PI / 2) 
        dAngle = -PI - dAngle;
    dAngle = safeZero(dAngle);
    return double2posit(dAngle);
}
*/


// Approximate sine using Taylor series expansion
ps_t positSin(ps_t x) {
    ps_t y,y2,y3,y5,y7;
    //std::cout<<"x: "<<posit2double(x)<<std::endl;
    y = pNAngle(x);
    //std::cout<<"y: "<<posit2double(y)<<std::endl;
    y2 = positMul(y, y);
    y3 = positMul(y2,y);
    #if TERMS > 2
        y5 = positMul(y2, y3);
    #endif
    #if TERMS > 3
        y7 = positMul(y2, y5);
    #endif
    //2 TERMS
    #if TERMS == 2
        #if APPR_TAILOR ==0
            return positSub(y,positDiv(y3,double2posit(6)));
        #elif APPR_TAILOR ==1
            return positSub(y,positDiv2p(y3,-3));
        #endif

    //3 TERMS
     #elif TERMS == 3
        #if APPR_TAILOR ==0
            return positAdd(positSub(y,positDiv(y3,double2posit(6))),positDiv(y5,double2posit(120)));
        #elif APPR_TAILOR ==1
            return positAdd(positSub(y,positDiv2p(y3,-3)),positDiv2p(y5,-7));
        #endif
    //4 TERMS
    #elif TERMS == 4
        #if APPR_TAILOR ==0
            return positSub(positAdd(positSub(y,positDiv(y3,double2posit(6))),positDiv(y5,double2posit(120))),positDiv(y7, double2posit(5040)));
        #elif APPR_TAILOR ==1
            return positSub(positAdd(positSub(y,positDiv2p(y3,-3)),positDiv2p(y5,-7)),positDiv2p(y7, -12));
        #endif
    #endif
}

void pEuler(ps_t angle, ps_t *result_real, ps_t *result_imag) {
    *result_real = positCos(angle);
    *result_imag = positSin(angle);
}
void dEuler(double angle, double *result_real, double *result_imag) {
    *result_real = dTailorCos(angle);
    *result_imag = dTailorSin(angle);
}
void fEuler(float angle, float *result_real, float *result_imag) {
    *result_real = fTailorCos(angle);
    *result_imag = fTailorSin(angle);
}
// Define file streams for logging values (commented out)
std::ofstream signalFile("signal_values.txt");
std::ofstream realPartFile("realPart_values.txt");
std::ofstream multiplicationFile("multiplication_values.txt");
std::ofstream realSumFile("realsum_values.txt");
std::ofstream angleFile("angle_values.txt");
std::ofstream deltaThetaFile("deltaTheta_values.txt");

std::ofstream PsignalFile("posit_signal_values.txt");
std::ofstream PrealPartFile("posit_realPart_values.txt");
std::ofstream PmultiplicationFile("posit_multiplication_values.txt");
std::ofstream PrealSumFile("posit_realsum_values.txt");
std::ofstream PangleFile("posit_angle_values.txt");
std::ofstream PdeltaThetaFile("posit_deltaTheta_values.txt");

// Define the accumulation function for double type signals
void dAccumulateFC(int k, int sampleCount, const double signalBuffer[], double& realSum, double& imagSum) {
    double realPart, imagPart, angle = 0.0;
    double deltaTheta = -2.0 * M_PI * k / sampleCount;

    // Initialize sums
    realSum = 0.0;
    imagSum = 0.0;

    // Accumulate FFT bin
    for (int n = 0; n < sampleCount; n++) {
        dEuler(angle, &realPart, &imagPart);

        realSum += signalBuffer[n] * realPart;
        imagSum += signalBuffer[n] * imagPart;

        angle += deltaTheta;
    }
}

void fAccumulateFC(int k, int sampleCount, const float signal[], float& realSum, float& imagSum) {
    float realPart, imagPart, angle = 0.0;

    // Initialize the sums to 0
    realSum = 0.0;
    imagSum = 0.0;
    float deltaTheta = -2.0 * M_PI * k / sampleCount;

    // Loop over the samples and compute the FFT accumulation
    for (int n = 0; n < sampleCount; n++) {
        // Access the signal array instead of reading from the stream
        float signalVal = signal[n];

        fEuler(angle, &realPart, &imagPart);

        // Accumulate the results
        realSum += signalVal * realPart;
        imagSum += signalVal * imagPart;
        angle += deltaTheta;
    }
}

void pAccumulateFC(int k, int sampleCount, const ps_t signal[], ps_t& realSum, ps_t& imagSum) {
    ps_t angle, realPart, imagPart;
    ps_t deltaTheta;
    //ps_t deltaTheta = double2posit(-2.0 * M_PI * k / sampleCount);

    // Loop over the samples and compute the FFT accumulation

    for (int n = 0; n < sampleCount; n++) {
        // Access the signal array instead of reading from the stream
        ps_t signalVal = signal[n];

        // Compute Euler for posit type

        pEuler(angle, &realPart, &imagPart);

        // Accuulate the results
        realSum = positAdd(realSum, positMul(signalVal, realPart));
        imagSum = positAdd(imagSum, positMul(signalVal, imagPart));

        angle = positAdd(angle, deltaTheta);
    }

}

// Function for pFFT (using ps_t type)
void pFFT(ps_t signal[], pFFTResult& result) {
    int sampleCount = IN_SIZE;

    for (int k = 0; k < sampleCount; k++) { // For each frequency bin
  //      if (k % 200 == 0)  
   //         std::cout << k << std::endl;

        // Call the accumulation function for each frequency bin
        ps_t realSum = ZERO;
        ps_t imagSum = ZERO;
        pAccumulateFC(k, sampleCount, signal, realSum, imagSum);

        result.real[k] = realSum;  // Store the real part in the array
        result.imag[k] = imagSum;  // Store the imaginary part in the array
    }
}

// Function for dFFT (using double type)
void dFFT(double signal[], dFFTResult& result) {
    const int sampleCount = IN_SIZE;

    // Step 1: Copy signal from stream into buffer
    double signalBuffer[IN_SIZE];

    // Step 2: Use buffered data for FFT (reusable)
    for (int k = 0; k < sampleCount; k++) {
        if (k % 200 == 0)
            std::cout << "Processing bin: " << k << std::endl;

        double realSum = 0.0;
        double imagSum = 0.0;

        dAccumulateFC(k, sampleCount, signal, realSum, imagSum);

        result.real[k] = realSum;  // Store the real part in the array
        result.imag[k] = imagSum;  // Store the imaginary part in the array
    }
}

// Function for fFFT (using float type)
void fFFT(float signal[], fFFTResult& result) {
    int sampleCount = IN_SIZE;

    for (int k = 0; k < sampleCount; k++) { // For each frequency bin
        if (k % 200 == 0)  
            std::cout << k << std::endl;

        // Call the accumulation function for each frequency bin
        float realSum = 0;
        float imagSum = 0;
        fAccumulateFC(k, sampleCount, signal, realSum, imagSum);

        result.real[k] = realSum;  // Store the real part in the array
        result.imag[k] = imagSum;  // Store the imaginary part in the array
    }
}

// Accumulation function for dFFT IFFT (using double arrays)
void dAccumulateFC_IFFT(int k, const double real[], const double imag[], double& realSum, double& imagSum, int sampleCount) {
    realSum = 0.0;
    imagSum = 0.0;
    double realPart, imagPart, angle = 0.0;
    double deltaTheta = 2.0 * PI * k / sampleCount;

    for (int n = 0; n < sampleCount; n++) {
        double signalVal_real = real[n];
        double signalVal_imag = imag[n];

        dEuler(angle, &realPart, &imagPart);

        realSum += signalVal_real * realPart - signalVal_imag * imagPart;
        imagSum += signalVal_real * imagPart + signalVal_imag * realPart;
        angle += deltaTheta;
    }
}

// IFFT function for dFFT (using double arrays)
void dIFFT(const double real[], const double imag[], double signal[], int sampleCount) {
    for (int k = 0; k < sampleCount; k++) {
        if (k % 200 == 0)
            std::cout << k << std::endl;

        double realSum = 0.0, imagSum = 0.0;
        dAccumulateFC_IFFT(k, real, imag, realSum, imagSum, sampleCount);

        signal[k] = realSum / sampleCount;
    }
}

// Accumulation function for fFFT IFFT (using float arrays)
void fAccumulateFC_IFFT(int k, const float real[], const float imag[], float& realSum, float& imagSum, int sampleCount) {
    realSum = 0.0f;
    imagSum = 0.0f;
    float realPart, imagPart, angle = 0.0f;
    float deltaTheta = 2.0f * PI * k / sampleCount;

    for (int n = 0; n < sampleCount; n++) {
        float signalVal_real = real[n];
        float signalVal_imag = imag[n];

        fEuler(angle, &realPart, &imagPart);

        realSum += signalVal_real * realPart - signalVal_imag * imagPart;
        imagSum += signalVal_real * imagPart + signalVal_imag * realPart;
        angle += deltaTheta;
    }
}

// IFFT function for fFFT (using float arrays)
void fIFFT(const float real[], const float imag[], float signal[], int sampleCount) {
    for (int k = 0; k < sampleCount; k++) {
        if (k % 200 == 0)
            std::cout << k << std::endl;

        float realSum = 0.0f, imagSum = 0.0f;
        fAccumulateFC_IFFT(k, real, imag, realSum, imagSum, sampleCount);

        signal[k] = realSum / sampleCount;
    }
}

// Accumulation function for pFFT IFFT (using ps_t arrays)
void pAccumulateFC_IFFT(int k, const ps_t real[], const ps_t imag[], ps_t& realSum, ps_t& imagSum, int sampleCount) {

    ps_t realPart, imagPart, angle = ZERO;
    ps_t deltaTheta = double2posit(2.0 * PI * k / sampleCount);

    for (int n = 0; n < sampleCount; n++) {
        ps_t signalVal_real = real[n];
        ps_t signalVal_imag = imag[n];

        pEuler(angle, &realPart, &imagPart);

        realSum = positAdd(realSum, positSub(positMul(signalVal_real, realPart), positMul(signalVal_imag, imagPart)));
        imagSum = positAdd(imagSum, positAdd(positMul(signalVal_real, imagPart), positMul(signalVal_imag, realPart)));
        angle = positAdd(angle, deltaTheta);
    }

}

// IFFT function for pFFT (using ps_t arrays)
void pIFFT(const ps_t real[], const ps_t imag[], ps_t signal[], int sampleCount) {
    for (int k = 0; k < sampleCount; k++) {
        if (k % 200 == 0)
            std::cout << k << std::endl;

        ps_t realSum=ZERO;
        ps_t imagSum=ZERO;
        pAccumulateFC_IFFT(k, real, imag, realSum, imagSum, sampleCount);
        signal[k] = positDiv(realSum ,double2posit(sampleCount));
    }
}