#include "posit.hpp"


ps_t x_p,y_p;
ps_t result;
void convert_int_Test(int low_int, int up_int, bool print=true){
	float result;
	float accuracy=0;
	ps_t pos;
	string check;
	if(print){
		cout<<"--------------------------------------------"<<endl;
		cout<<" input ||    pos    ||   output   ||  check "<<endl;
		cout<<"--------------------------------------------"<<endl;
	}
	for(int i=low_int;i<up_int+1;i++){
		check="false";
		pos=int2posit(i);
		result=posit2float(pos);
		if(i==result) {check="correct";accuracy=accuracy+1;}
	//	if(print)
	//		cout<<dec<<"i: "<<i<<hex<<"||pos: "<<pos<<dec<<"||result: "<<result<<"||"<<check<<endl;
	}
	if(print) cout<<"--------------------------------------------"<<endl;
	cout<<" conversion accuracy: %"<<dec<<100*accuracy/(up_int-low_int+1)<<endl;
}

int add_test(int x, int y, bool print=true){
	float res;
	x_p=int2posit(x);
	y_p=int2posit(y);
	result=posit_add(int2posit(x),int2posit(y));
	//x_i=posit2int(encode(x));
	//y_i=posit2int(encode(y));
	res=posit2float(result);
	/*
	if(print){
		cout<<"***************ADD TEST*************"<<endl;
		cout<<"x: "<<hex<<  int2posit(x)<<endl;
		cout<<"y: "<<int2posit(y)<<endl;
		cout<<"result: "<<result<<endl;
		cout<<"---------------------------"<<endl;
		cout<<"x.sign: "<<x_p.sign<<endl;
		cout<<"x.isZero: "<<x_p.isZero<<endl;
		cout<<"x.isInf: "<<x_p.isInf<<endl;
		cout<<"x.regime: "<<x_p.regime<<endl;
		cout<<"x.exponent: "<<x_p.exponent<<endl;
		cout<<"x.abs: "<<x_p.abs<<endl;
		cout<<"x.mantissa: "<<x_p.mantissa<<endl;
		cout<<"x.man_len: "<<x_p.man_len<<endl;
		cout<<"---------------------------"<<endl;
		cout<<"y.sign: "<<y_p.sign<<endl;
		cout<<"y.isZero: "<<y_p.isZero<<endl;
		cout<<"y.isInf: "<<y_p.isInf<<endl;
		cout<<"y.regime: "<<y_p.regime<<endl;
		cout<<"y.exponent: "<<y_p.exponent<<endl;
		cout<<"y.abs: "<<y_p.abs<<endl;
		cout<<"y.mantissa: "<<y_p.mantissa<<endl;
		cout<<"y.man_len: "<<y_p.man_len<<endl;
		cout<<"********************************"<<endl;

	}*/
	return res;
}
float mul_test(int x, int y, bool print=true){
	float res;
	x_p=int2posit(x);
	y_p=int2posit(y);
	result=posit_mul(int2posit(x),int2posit(y));
	//x_i=posit2int(encode(x));
	//y_i=posit2int(encode(y));
	res=posit2float(result);
/*
	if(print){
		cout<<"---------------MUL TEST------------"<<endl;
		cout<<"x: "<<hex<< int2posit(x)<<endl;
		cout<<"y: "<<int2posit(y)<<endl;
		cout<<"result: "<<result<<endl;
		cout<<"---------------------------"<<endl;
		cout<<"x.sign: "<<x_p.sign<<endl;
		cout<<"x.isZero: "<<x_p.isZero<<endl;
		cout<<"x.isInf: "<<x_p.isInf<<endl;
		cout<<"x.regime: "<<x_p.regime<<endl;
		cout<<"x.exponent: "<<x_p.exponent<<endl;
		cout<<"x.abs: "<<x_p.abs<<endl;
		cout<<"x.mantissa: "<<x_p.mantissa<<endl;
		cout<<"x.man_len: "<<x_p.man_len<<endl;
		cout<<"---------------------------"<<endl;
		cout<<"y.sign: "<<y_p.sign<<endl;
		cout<<"y.isZero: "<<y_p.isZero<<endl;
		cout<<"y.isInf: "<<y_p.isInf<<endl;
		cout<<"y.regime: "<<y_p.regime<<endl;
		cout<<"y.exponent: "<<y_p.exponent<<endl;
		cout<<"y.abs: "<<y_p.abs<<endl;
		cout<<"y.mantissa: "<<y_p.mantissa<<endl;
		cout<<"y.man_len: "<<y_p.man_len<<endl;
		cout<<"********************************"<<endl;

	}*/
	return res;
}
void rand_try(int n, char op, int min, int max){
	float accuracy=0;
	int N1,N2,R_true,R_found;
	for(int i=0; i<n; i++){
		N1=(rand()%(max+1-min))+min;
		N2=(rand()%(max+1-min))+min;
		if(op=='+'){
			R_true=N1+N2;
			R_found=add_test(N1,N2,false);
			if(R_true!=R_found) cout<<"WRONG:   "<<dec<<N1<<" "<<op<<" "<<dec<<N2<<"="<<R_true<<"  |  found:"<<posit2float(int2posit(N1))<<"+"<<posit2float(int2posit(N2))<<"="<<R_found<<endl;
			else accuracy++;
		}
		else if(op=='*'){
			R_true=N1*N2;
			R_found=mul_test(N1,N2,false);
			if(R_true!=R_found) cout<<"WRONG:   "<<dec<<N1<<" "<<op<<" "<<dec<<N2<<"="<<R_true<<"  |  found:"<<R_found<<endl;
			else accuracy++;
		}
		else {cout<<"invalid operation type!"<<endl;break;}
	}
	if(op=='+') cout<<" summation accuracy: %"<<dec<<100*(accuracy/n)<<endl;
	if(op=='*') cout<<" multiplication accuracy: %"<<dec<<100*(accuracy/n)<<endl;

//	return 100*(accuracy/n);
}



int main(){
	cout<<setprecision(15);

	//convert_int_Test(-1024,1024,true);
	//rand_try(1000,'+',-512,512);
	//rand_try(1000,'*',-32,32);
	//posit_mul(int2posit(7),int2posit(7));

/*
	cout<<dec<<posit2float(0x2A80)<<endl;//   21/128
	cout<<dec<<posit2float(0xa600)<<endl; //-10
	cout<<dec<<posit2float(posit_add(0xa600,0x2A80))<<endl;
	cout<<dec<<posit2float(posit_mul(0xa600,0x2A80))<<endl;

	for(int i=-256 ;i<257;i++){
		cout<<dec<<i<<"/256="<<posit2float(posit_mul(int2posit(i),0x1000))<<"          "<<i/256.0<<endl;
	}
*/

	//cout<<(int)log2(3)<<endl;
	//cout<<hex<<int2posit(3)<<endl;;

	return 0;
}

//cout<<"result: "<<dec<<add_test(178,122,true)<<endl;
//cout<<"result: "<<dec<<mul_test(-15,15)<<endl;
//cout<<"pos:"<<hex<<int2posit(48)<<endl;
//cout<<"reconst:"<<dec<<posit2int(int2posit(3840))<<endl;
//pos.regime=14;
//pos.sign=1;
//pos.sign=1;
//pos.regime=1;
//pos.exponent=3;
//pos.mantissa=0x2b0;
//pos.man_len=10;
/*	cout<<hex<<encode(pos)<<endl;
cout<<"reconst:"<<dec<<posit2int(encode(pos))<<endl;
pos2=decode(int2posit(3840));
cout<<"---------------------------"<<endl;
cout<<hex<<"sign: "<<pos2.sign<<endl;
cout<<"isZero: "<<pos2.isZero<<endl;
cout<<"isInf: "<<pos2.isInf<<endl;
cout<<"regime: "<<pos2.regime<<endl;
cout<<"exponent: "<<pos2.exponent<<endl;
cout<<"mantissa: "<<pos2.mantissa<<endl;
cout<<"man_len: "<<pos2.man_len<<endl;
*/
