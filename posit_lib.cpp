#include "posit.hpp"
#include <cmath>


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
    
    double sf_d = log2(in);
    
    bool sf_exact =   std::floor(sf_d) == sf_d;  
         
    sf = (int)sf_d; // Scale factor
    if(in<1 && !sf_exact) sf= sf-1;        
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
/*
ps_t positAdd(ps_t x,ps_t y){

	ps_t result;
	sf_t sf_L,sf_S,sf_x,sf_y,sf_r,diff;
	mant_add_t mL,mS,mantissa=0,x_mantissa,y_mantissa,mInter=0,mInter2=0;
	bool sign,x_sign,y_sign,ABSxIsGreaterEqual,isZero=0,x_isZero,y_isZero;
    int SA;
	ovf_t ovf;
	regime_t regime,x_regime,y_regime;
	exponent_t exponent=0,x_exponent,y_exponent;
	reg_t SREG,REM;
	//read parameters
	x_sign=x.sign;			 y_sign=y.sign;
	x_regime=x.regime;		 y_regime=y.regime;
	x_exponent=x.exponent;	 y_exponent=y.exponent;
	x_mantissa=x.mantissa;   y_mantissa=y.mantissa;
	x_isZero=x.isZero;		 y_isZero=y.isZero;
    //Clear 1's in mantissa
    x_mantissa.clear(FRAC_LEN-1);
    y_mantissa.clear(FRAC_LEN-1);
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
    mInter.set(FRAC_LEN-diff);
    mInter2.set(FRAC_LEN);
	if(x_sign ^ y_sign){ //Substraction
        mantissa = mInter2 +mL-mInter-(mS>>diff);
	}
	else { //Addition  
		mantissa=mL+mInter+mInter2+(mS>>diff);
	}
    SA = LOD_ADD(mantissa);
    mantissa = mantissa>>SA;
    mantissa=mantissa.range(FRAC_LEN-1,0);
    mantissa.set(FRAC_LEN-1);
    sf_r+=SA;

    std::cout<<"x_mantissa:"<<x_mantissa<<std::endl;
    std::cout<<"y_mantissa:"<<y_mantissa<<std::endl;
    std::cout<<"sf_x:"<<sf_x<<std::endl;
    std::cout<<"sf_y:"<<sf_y<<std::endl;
    std::cout<<"mInter:"<<mInter<<std::endl;
    std::cout<<"mInter2:"<<mInter2<<std::endl;
    std::cout<<"mantissa:"<<mantissa<<std::endl;
    std::cout<<"SA:"<<SA<<std::endl;
    std::cout<<"mL:"<<mL<<std::endl;
    std::cout<<"mS:"<<mS<<std::endl;
    std::cout<<"diff:"<<diff<<std::endl;
    std::cout<<"(mS>>diff):"<<(mS>>diff)<<std::endl;

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
*/
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
/*
ps_t positDiv(ps_t x,ps_t y){

	ps_t result;
	sf_t sf_x,sf_y,sf_r;
	bool sign,x_sign,y_sign,x_isZero,y_isZero,isZero=0;
	regime_t R,regime,x_regime,y_regime;
	exponent_t exponent=0,y_exponent,x_exponent;
	mantissa_t mantissa=0;
	dv_t x_mantissa,y_mantissa,mant=0,mul_part=0,mInter=0;
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


	//multiply mantissa 
    mInter.set(FRAC_LEN);
    mul_part = (x_mantissa + mInter) * mInter;
	mant= mul_part / (y_mantissa+mInter);
    SA = LOD_MUL(mant);
    //std::cout<<"mant:"<<mant<<std::endl;
    mant = mant>>SA;
    //std::cout<<"mant:"<<mant<<std::endl;
    mantissa=mant.range(FRAC_LEN-1,0);
    sf_r+=SA;

    std::cout<<"x_mantissa:"<<x_mantissa<<std::endl;
    std::cout<<"y_mantissa:"<<y_mantissa<<std::endl;
    std::cout<<"sf_x:"<<sf_x<<std::endl;
    std::cout<<"sf_y:"<<sf_y<<std::endl;
    std::cout<<"mInter:"<<mInter<<std::endl;
    std::cout<<"mantissa:"<<mantissa<<std::endl;
    std::cout<<"SA:"<<SA<<std::endl;
    std::cout<<"mul_part:"<<mul_part<<std::endl;
    std::cout<<"mant:"<<mant<<std::endl;


	//determine regime
	regime=sf_r>>ES;
	if(regime>=N-2) regime=N-2;
	else if(regime<2-N) regime=2-N;
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

	return result;
}*/
/*
ps_t posit_div(ps_t x, ps_t y){

	ps_t result;
	sf_t sf_x,sf_y,sf_r;
	ml_t ml_x=0,ml_y=0,ml_r=0;
	bool sign,x_sign,y_sign,x_isZero,y_isZero,isZero=0;
	regime_t R,regime,x_regime,y_regime,SA;
	exponent_t exponent=0,y_exponent,x_exponent;
	mantissa_t mantissa=0;
	mul_t x_mantissa,y_mantissa,mant=0;
	reg_t SREG,REM;
	ovf_t ovf;
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
	//determine intermediate regime
	R=sf_r>>ES;
	//determine ml_x & ml_y & ml_r
	if(x_regime<(N-ES-2) && x_regime>(2+ES-N))
		ml_x=x_regime>=0?N-(ES+3+x_regime):N-(ES+2-x_regime);
	if(y_regime<(N-ES-2) && y_regime>(2+ES-N))
		ml_y=y_regime>=0?N-(ES+3+y_regime):N-(ES+2-y_regime);
	if(R<(N-ES-2) && R>(2+ES-N))
		ml_r=R>=0?N-(ES+3+R):N-(ES+2-R);
	//divide mantissa (1+mx/(2^ml_x))/(1+my/(2^ml_y))=1+mr/(2^ml_R)
	mant=((x_mantissa+(1<<ml_x))<<ml_y)/(y_mantissa+(1<<ml_y));
	mant=mant<<(ml_r-ml_x);
	//adjust mantissa and sf wrt. leading one
	SA=ml_r+2-LOD(mant)-N;
	mant=(mant<<SA).range(ml_r-1,0);
	sf_r=sf_r-SA;
	//determine regime
	regime=sf_r>>ES;
	if(regime>=N-2) regime=N-2;
	else if(regime<2-N) regime=2-N;
	else{
		//find SREG & REM
		SREG=regime>=0?regime+3:2-regime;
		REM=N-SREG;
		// find exponent and mantissa
		if(ES==0){
			if(REM>0) mantissa=mant<<(REM-ml_r);
			}
		else{
			if(REM>=ES) {
				exponent=sf_r.range(ES-1,0);
				mantissa=mant<<(REM-ml_r-ES);
			}
			else if(REM>0) {
				exponent=sf_r.range(REM-1,0);
				mantissa=0;
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
}*/
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
/*
ps_t posit_sin_(ps_t x){
    ps_t arg1, arg2,x2;
    if (x.isZero)
        return x;
    else {
        x2 = positMul(x,x);
        arg1 = posit_div(positMul(x2,x),int2posit(6));
        arg2 = posit_div(positMul(arg1,x2),int2posit(20));
        return posit_sub(x, positAdd(arg1, arg2));
    }

}
ps_t posit_cos_(ps_t x){
    ps_t arg1, arg2,arg3,x2;
    arg1 = int2posit(1);
    if (x.isZero)
        return arg1;
    else {
        x2 = positMul(x,x);
        
        arg2 = posit_div(x2,int2posit(-2));
        arg3 = posit_div(positMul(arg2,arg2),int2posit(6));
        return positAdd(arg1, positAdd(arg2, arg3));
    }

}

void euler(ps_t angle, ps_t *result_real, ps_t *result_imag) {


    // Compute cosine (real part) and sine (imaginary part) of the angle
    *result_real = posit_cos_(angle);
    *result_imag = posit_sin_(angle);
}

void pMulTuples(ps_t x_real, ps_t x_imag, ps_t y_real, ps_t y_imag, 
               ps_t *res_real, ps_t *res_imag) {

//    if (is_scalar) {
//        // Scalar multiplication
 //       *res_real = positMul(x_real,y_real);
//        *res_imag = positMul(x_imag,y_real);
 //   } else {
        // Complex multiplication
        *res_real = posit_sub(positMul(x_real, y_real) , positMul(x_imag , y_imag));
        *res_imag = positAdd(positMul(x_real , y_imag ), positMul(x_imag , y_real));
  //  }
}
void pAddTuples(ps_t x_real, ps_t x_imag, ps_t y_real, ps_t y_imag, 
               ps_t *res_real, ps_t *res_imag) {


    // Add the real and imaginary parts
    *res_real = positAdd(x_real , y_real);
    *res_imag = positAdd(x_imag , y_imag);
}
// Iterative FFT function
void PositFFT(ps_t x_real[MAX_SIZE], ps_t x_imag[MAX_SIZE], int len, ps_t X_real[MAX_SIZE], ps_t X_imag[MAX_SIZE]) {
    // Bit-reversal permutation: reorder the input array
    int n = len;
    int bit_reversed_index;
    for (int i = 0; i < n; ++i) {
        bit_reversed_index = 0;
        for (int j = 0; j < log2(n); ++j) {
            if (i & (1 << j)) {
                bit_reversed_index |= (1 << (int)(log2(n) - 1 - j));
            }
        }

        X_real[bit_reversed_index] = x_real[i];
        X_imag[bit_reversed_index] = x_imag[i];
    }

    // Iterative FFT computation
    for (int s = 1; s <= log2(n); ++s) {
        int m = 1 << s;  // Length of the sub-FFT
        ps_t w_real = float2posit(cos(-2.0 * PI / m));  // Real part of the twiddle factor
        ps_t w_imag = float2posit(sin(-2.0 * PI / m));  // Imaginary part of the twiddle factor

        // Butterfly computation
        for (int k = 0; k < n; k += m) {
            ps_t wr = int2posit(1);  // Initialize the twiddle factor (w^0 = 1)
            ps_t wi ;

            for (int j = 0; j < m / 2; ++j) {
                ps_t even_real = X_real[k + j];
                ps_t even_imag = X_imag[k + j];
                ps_t odd_real = X_real[k + j + m / 2];
                ps_t odd_imag = X_imag[k + j + m / 2];

                // Compute the twiddle factor multiplication
                ps_t temp_real, temp_imag;
                pMulTuples(wr, wi, odd_real, odd_imag, &temp_real, &temp_imag);

                // Update the FFT output for the butterfly computation
                pAddTuples(even_real, even_imag, temp_real, temp_imag, &X_real[k + j], &X_imag[k + j]);
                pAddTuples(even_real, even_imag, posit_negate(temp_real), posit_negate(temp_imag), &X_real[k + j + m / 2], &X_imag[k + j + m / 2]);

                // Update the twiddle factor for the next iteration
                ps_t temp_wr, temp_wi;
                pMulTuples(wr, wi, w_real, w_imag, &temp_wr, &temp_wi);
                wr = temp_wr;
                wi = temp_wi;
            }
        }
    }
}

void PositFFT(ps_t x_real[MAX_SIZE], ps_t x_imag[MAX_SIZE], int len, 
              ps_t X_real[MAX_SIZE], ps_t X_imag[MAX_SIZE]) {


    // Base case: if the input length is 1, copy the input to the output
    if (len == 1) {
        X_real[0] = x_real[0];
        X_imag[0] = x_imag[0];
        return;
    }

    // Compute the factor -2π/len(x)
    ps_t C = float2posit(-2.0 * PI / len);
    ps_t factor_real[MAX_SIZE], factor_imag[MAX_SIZE];


    for (int k = 0; k < len; ++k) {
        ps_t coeff = positMul(C , int2posit(k));
        posit_euler(coeff, &factor_real[k], &factor_imag[k]);
    }

    // Divide the input array into even and odd indexed parts
    ps_t X_even_real[MAX_SIZE / 2], X_even_imag[MAX_SIZE / 2];
    ps_t X_odd_real[MAX_SIZE / 2], X_odd_imag[MAX_SIZE / 2];


    for (int i = 0; i < len / 2; ++i) {
        X_even_real[i] = x_real[2 * i];
        X_even_imag[i] = x_imag[2 * i];
        X_odd_real[i] = x_real[2 * i + 1];
        X_odd_imag[i] = x_imag[2 * i + 1];
    }

    // Recursively calculate FFT for even and odd parts
    PositFFT(X_even_real, X_even_imag, len / 2, X_even_real, X_even_imag);
    PositFFT(X_odd_real, X_odd_imag, len / 2, X_odd_real, X_odd_imag);

    // Combine the results
    for (int j = 0; j < len / 2; ++j) {
        ps_t temp_real, temp_imag;
        pMulTuples(factor_real[j], factor_imag[j], X_odd_real[j], X_odd_imag[j], &temp_real, &temp_imag);

        pAddTuples(X_even_real[j], X_even_imag[j], temp_real, temp_imag, 
                  &X_real[j], &X_imag[j]);
        pAddTuples(X_even_real[j], X_even_imag[j], posit_negate(temp_real), posit_negate(temp_imag), 
                  &X_real[j + len / 2], &X_imag[j + len / 2]);
    }
}


void float_pMulTuples(float real1, float imag1, float real2, float imag2, float* result_real, float* result_imag) {
    *result_real = real1 * real2 - imag1 * imag2;
    *result_imag = real1 * imag2 + imag1 * real2;
}

// Function to perform addition of complex numbers (float extension)
void float_pAddTuples(float real1, float imag1, float real2, float imag2, float* result_real, float* result_imag) {
    *result_real = real1 + real2;
    *result_imag = imag1 + imag2;
}

// Function to negate a complex number (i.e., negate both real and imaginary parts) (float extension)
float float_negate(float value) {
    return -value;
}

// Iterative FFT function (float extension)
void float_FFT(float x_real[MAX_SIZE], float x_imag[MAX_SIZE], int len, float X_real[MAX_SIZE], float X_imag[MAX_SIZE]) {
    // Bit-reversal permutation: reorder the input array
    int n = len;
    int bit_reversed_index;
    for (int i = 0; i < n; ++i) {
        bit_reversed_index = 0;
        for (int j = 0; j < log2(n); ++j) {
            if (i & (1 << j)) {
                bit_reversed_index |= (1 << (int)(log2(n) - 1 - j));
            }
        }

        X_real[bit_reversed_index] = x_real[i];
        X_imag[bit_reversed_index] = x_imag[i];
    }

    // Iterative FFT computation (float extension)
    for (int s = 1; s <= log2(n); ++s) {
        int m = 1 << s;  // Length of the sub-FFT
        float w_real = cos(-2.0 * PI / m);  // Real part of the twiddle factor
        float w_imag = sin(-2.0 * PI / m);  // Imaginary part of the twiddle factor

        // Butterfly computation (float extension)
        for (int k = 0; k < n; k += m) {
            float wr = 1;  // Initialize the twiddle factor (w^0 = 1)
            float wi = 0;

            for (int j = 0; j < m / 2; ++j) {
                float even_real = X_real[k + j];
                float even_imag = X_imag[k + j];
                float odd_real = X_real[k + j + m / 2];
                float odd_imag = X_imag[k + j + m / 2];

                // Compute the twiddle factor multiplication (float extension)
                float temp_real, temp_imag;
                float_pMulTuples(wr, wi, odd_real, odd_imag, &temp_real, &temp_imag);

                // Update the FFT output for the butterfly computation (float extension)
                float_pAddTuples(even_real, even_imag, temp_real, temp_imag, &X_real[k + j], &X_imag[k + j]);
                float_pAddTuples(even_real, even_imag, float_negate(temp_real), float_negate(temp_imag), &X_real[k + j + m / 2], &X_imag[k + j + m / 2]);

                // Update the twiddle factor for the next iteration (float extension)
                float temp_wr, temp_wi;
                float_pMulTuples(wr, wi, w_real, w_imag, &temp_wr, &temp_wi);
                wr = temp_wr;
                wi = temp_wi;
            }
        }
    }
}
*/
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
/*
double dTailorCos(double x) {
    bool negate;
    x = dReduceAngle(x, negate);  // Reduziere den Winkel auf [0, π/2]

    double x2 = x * x;
    double term1 = 1.0;
    double term2 = x2 / 2.0;
    double term3 = x2 * x2 / 24.0;
    double term4 = x2 * term3 /30.0;
    //double result = term1 - term2  ;
    //double result = term1 - term2 + term3 ;
    double result = term1 - term2 + term3 -term4;    
    return negate ? -result : result;  // Falls gespiegelt, das Vorzeichen setzen
}
*/

double dTailorCos(double x) {
    bool negate;
    x = dReduceAngle(x, negate);  // Reduce the angle to [0, π/2]

    double x2 = x * x;
    double term1 = 1.0;
    double term2 = x2 / 2.0;

    #if TERMS > 2
        double term3 = x2 * x2 / 32.0;
    #endif

    #if TERMS > 3
        double term4 = x2 * term3 / 32.0;
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
    x = fReduceAngle(x, negate); 

    float x2 = x * x;
    float term1 = 1.0;
    float term2 = x2 / 2.0;

    #if TERMS > 2
        float term3 = x2 * x2 / 32.0;
    #endif

    #if TERMS > 3
        float term4 = x2 * term3 / 32.0;
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
}
// Approximate cosine using Taylor series expansion
ps_t positCos(ps_t x) {
    ps_t y, y2, y4, result;
    ps_t term1, term2, term3, t1minust2, term4;
    bool negate;
    term1 = double2posit(1);
    if (x.isZero == 1) return term1;
    y = pReduceAngle(x, negate);

    y2 = positMul(y, y);
    y4 = positMul(y2, y2);

    term2 = positDiv2p(y2, -1);

    #if TERMS > 2
        term3 = positDiv2p(y4, -5);
    #endif

    #if TERMS > 3
        term4 = positDiv2p(positMul(term3, y2), -5);
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
}/*
ps_t positCos(ps_t x) {
    ps_t y,y2,y4, result;
    ps_t term1, term2,term3,t1minust2,term4;
    bool negate;
    term1 = double2posit(1);
    if (x.isZero == 1) return term1;
    y = pReduceAngle(x, negate);
    //std::cout<<"-------------COS----------"<<std::endl;
    //std::cout<<"y: "<<posit2double(y)<<std::endl;
    y2 = positMul(y, y);
    //std::cout<<"y2: "<<posit2double(y2)<<std::endl;
    y4 = positMul(y2,y2);
    //std::cout<<"y4: "<<posit2double(y4)<<std::endl;
    term2 = positDiv(y2, double2posit(2));
    //term2 = positDiv2p(y2, -1);
    //std::cout<<"term2: "<<posit2double(term2)<<std::endl;
    term3 = positDiv(y4, double2posit(24));
    //term3 = positDiv2p(y4, -5);
    //std::cout<<"term3: "<<posit2double(term3)<<std::endl;
    term4 = positDiv(positMul(term3,y2), double2posit(30));
    //term4 = positDiv2p(positMul(term3,y2), -5);
    t1minust2 = positSub(term1, term2 );
    //std::cout<<"t1minust2: "<<posit2double(t1minust2)<<std::endl;
    //result = t1minust2;
    //result = positAdd(t1minust2,term3);
    result = positSub(positAdd(t1minust2,term3),term4);
    
    return negate ? posit_negate(result) : result;  // Falls gespiegelt, das Vorzeichen setzen

}*/
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
    term2 = x * x * x / 6.0;

    #if TERMS > 2
        term3 = term2 * x * x / 20.0;
    #endif
    #if TERMS > 3
        term4 = term3 * x * x / 42.0;
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

/*
double dTailorSin(double in){
    double term1,term2,term3,term4,x;
    x = dNAngle(in);
    //std::cout<<"x: "<<x<<std::endl;
    term1= x;
    term2 = x*x*x/8.0;
    //term3 = term2*x*x/16.0;
    //term4 = term3*x*x/32.0;
    return term1 - term2 ;
    //return term1 - term2 +term3;
    //return term1 - term2 +term3-term4;
}
*/
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
    x = fNAngle(in);

    term1 = x;
    term2 = x * x * x / 6.0;

    #if TERMS > 2
        term3 = term2 * x * x / 20.0;
    #endif
    #if TERMS > 3
        term4 = term3 * x * x / 42.0;
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
    //return positSub(y,positDiv(y3,double2posit(6)));
    return positSub(y,positDiv2p(y3,-3));
    //3 TERMS
     #elif TERMS == 3
    //return positAdd(positSub(y,positDiv(y3,double2posit(6))),positDiv(y5,double2posit(120)));
    return positAdd(positSub(y,positDiv2p(y3,-3)),positDiv2p(y5,-7));
    //4 TERMS
    #elif TERMS == 4
    //return positSub(positAdd(positSub(y,positDiv(y3,double2posit(6))),positDiv(y5,double2posit(120))),positDiv(y7, double2posit(5040)));
    return positSub(positAdd(positSub(y,positDiv2p(y3,-3)),positDiv2p(y5,-7)),positDiv2p(y7, -12));
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
/*
void dAccumulateFC(int k, const std::vector<double>& signal, double& realSum, double& imagSum) {
    int sampleCount = signal.size();
    double realPart, imagPart,angle;
    //std::cout<<"sampleCount: "<<sampleCount<<std::endl;
    realSum = 0.0;
    imagSum = 0.0;
    for (int n = 0; n < sampleCount; n++) {
        //std::cout<<"---"<<n<<std::endl;
        angle = -2.0 * PI * k * n / sampleCount;
        std::cout<<"dAngle: "<<angle<<std::endl;
        dEuler(angle, &realPart, &imagPart);
        std::cout<<"D: "<<realPart<<"-"<<imagPart<<std::endl;
        realSum += signal[n] * realPart;
        imagSum += signal[n] * imagPart;
    }
}*/
std::ofstream signalFile("signal_values.txt");
std::ofstream realPartFile("realPart_values.txt");
std::ofstream multiplicationFile("multiplication_values.txt");
std::ofstream realSumFile("realsum_values.txt");
std::ofstream angleFile("angle_values.txt");
std::ofstream deltaThetaFile("deltaTheta_values.txt");
void dAccumulateFC(int k, const std::vector<double>& signal, double& realSum, double& imagSum) {
    int sampleCount = signal.size();
    double realPart, imagPart,angle=0.0;

    //std::cout<<"sampleCount: "<<sampleCount<<std::endl;
    realSum = 0.0;
    imagSum = 0.0;
    double deltaTheta = -2.0 * PI * k / sampleCount;
    for (int n = 0; n < sampleCount; n++) {
        //std::cout<<"---"<<n<<std::endl;
        //angle = -2.0 * PI * k * n / sampleCount;
        //std::cout<<"dAngle: "<<angle<<std::endl;
        dEuler(angle, &realPart, &imagPart);
        //std::cout<<"D: "<<realPart<<"-"<<imagPart<<std::endl;
        // Write values to files


        realSum += signal[n] * realPart;
        imagSum += signal[n] * imagPart;
        angle += deltaTheta;
/*        if(k==3125){
            signalFile << signal[n] << std::endl;
            realPartFile << realPart << std::endl;
            multiplicationFile << signal[n] * realPart << std::endl;
            angleFile<<angle<<std::endl;
            deltaThetaFile<<deltaTheta<<std::endl;
        }*/
    }
/*    if(k==3125){
        realSumFile<<realSum<<std::endl;
    }*/
}
void fAccumulateFC(int k, const std::vector<float>& signal, float& realSum, float& imagSum) {
    int sampleCount = signal.size();
    float realPart, imagPart,angle=0.0;
    realSum = 0.0;
    imagSum = 0.0;
    float deltaTheta = -2.0 * PI * k / sampleCount;
    for (int n = 0; n < sampleCount; n++) {


        fEuler(angle, &realPart, &imagPart);
        realSum += signal[n] * realPart;
        imagSum += signal[n] * imagPart;
        angle += deltaTheta;
    }
}
std::ofstream PsignalFile("posit_signal_values.txt");
std::ofstream PrealPartFile("posit_realPart_values.txt");
std::ofstream PmultiplicationFile("posit_multiplication_values.txt");
std::ofstream PrealSumFile("posit_realsum_values.txt");
std::ofstream PangleFile("posit_angle_values.txt");
std::ofstream PdeltaThetaFile("posit_deltaTheta_values.txt");
void pAccumulateFC(int k, const std::vector<ps_t>& signal, ps_t& realSum, ps_t& imagSum) {
    int sampleCount = signal.size();
    ps_t angle,realPart, imagPart;
    ps_t deltaTheta = double2posit(-2.0 * PI * k / sampleCount);
   for (int n = 0; n < sampleCount; n++) {


        //angle = positDiv(positMul(POSIT_2PI,positMul(double2posit((double)k), double2posit((double)n))) ,double2posit((double)sampleCount));
        //angle = double2posit(-2.0 * PI * k * n / sampleCount);
        //std::cout<<"n,k: "<<n<<"-"<<k<<"pAngle: "<<posit2double(angle)<<std::endl;
        pEuler(angle, &realPart, &imagPart);
        //std::cout<<"P: "<<posit2double(realPart)<<"-"<<posit2double(imagPart)<<std::endl;


        realSum = positAdd(realSum,positMul(signal[n] ,realPart));

        imagSum = positAdd(imagSum,positMul(signal[n] ,imagPart));
        angle = positAdd(angle, deltaTheta);
     /*   if (k==3125){
            PsignalFile << posit2double(signal[n]) << std::endl;
            PrealPartFile << posit2double(realPart) << std::endl;
            PmultiplicationFile << posit2double(positMul(signal[n] ,realPart)) << std::endl;
            PrealSumFile<<posit2double(realSum)<<std::endl;
            PangleFile<<posit2double(angle)<<std::endl;
            PdeltaThetaFile<<posit2double(deltaTheta)<<std::endl;
        }*/
    }
  /*  if (k==3125){
        PrealSumFile<<posit2double(realSum)<<std::endl;
    }*/

}

pFFTResult pFFT(const std::vector<ps_t>& signal) {
    int sampleCount = signal.size();
    pFFTResult result;
    //result.real.resize(sampleCount, 0.0);
    //result.imag.resize(sampleCount, 0.0);
    std::cout<<"sampleCount: "<<sampleCount<<std::endl;
    for (int k = 0; k < sampleCount; k++) { // For each frequency bin
        if (k%200 ==0)  
            std::cout<<k<<std::endl;
        pAccumulateFC(k, signal, result.real[k], result.imag[k]);
    }
    
    return result;
}
dFFTResult dFFT(const std::vector<double>& signal) {
    int sampleCount = signal.size();
    dFFTResult result;
    //result.real.resize(sampleCount, 0.0);
    //result.imag.resize(sampleCount, 0.0);
    std::cout<<"sampleCount: "<<sampleCount<<std::endl;
    for (int k = 0; k < sampleCount; k++) { // For each frequency bin
        if (k%200 ==0)  
            std::cout<<k<<std::endl;
        dAccumulateFC(k, signal, result.real[k], result.imag[k]);
    }
    
    return result;
}


fFFTResult fFFT(const std::vector<float>& signal) {
    int sampleCount = signal.size();
    fFFTResult result;
    //result.real.resize(sampleCount, 0.0);
    //result.imag.resize(sampleCount, 0.0);
    
    for (int k = 0; k < sampleCount; k++) { // For each frequency bin
        if (k%200 ==0)  
            std::cout<<k<<std::endl;
        fAccumulateFC(k, signal, result.real[k], result.imag[k]);
    }
    
    return result;
}

void dAccumulateFC_IFFT(int k, const dFFTResult& result, double& realSum, double& imagSum) {
    int sampleCount = result.real.size();
    realSum = 0.0;
    imagSum = 0.0;
    double realPart, imagPart,angle;
    for (int n = 0; n < sampleCount; n++) {
        angle = 2.0 * PI * k * n / sampleCount; // Inverse sign for angle
        realPart = dTailorCos(angle);
        imagPart = dTailorSin(angle);
        
        realSum += result.real[n] * realPart - result.imag[n] * imagPart;
        imagSum += result.real[n] * imagPart + result.imag[n] * realPart;
    }
}

std::vector<double> dIFFT(const dFFTResult& result) {
    int sampleCount = result.real.size();
    std::vector<double> signal(sampleCount, 0.0);
    std::cout<<"sampleCount: "<<sampleCount<<std::endl;
    for (int k = 0; k < sampleCount; k++) { // For each time bin
        if (k%200 ==0)  
            std::cout<<k<<std::endl;
        double realSum = 0.0, imagSum = 0.0;
        dAccumulateFC_IFFT(k, result, realSum, imagSum);
        
        // Scale by sampleCount and store the result in the signal
        signal[k] = (realSum / sampleCount);
    }
    
    return signal;
}