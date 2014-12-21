#include <iostream>
//#include <iomanip>
#include <cmath>
#include <cstdio>
using namespace std;

const double eps = 1e-9;

struct Function {
  double A,B,C,D,E,F,G,H,I,J;  

  double value(double x) {
    double result = 0.0;

    result += A * sin(B * x + C);
    result += D * exp(E * x + F);
    result += G * fabs(H * x + I);
    result += J;

    return result;
  }
};

//iterative version, recursive available on github
double root(Function func, double b, double e) {
  
  while(fabs(b - e) >= eps) {
  
    double m = (b + e)/2.0;
    if(func.value(b) * func.value(m) <= 0) //root is in the first half 
      e = m;
    else
      b = m;
    
  }
  return b;
  
}

int main() {
  
  double p, q;
  cin >> p >> q;
  
  Function func;
  cin >> func.A >> func.B >> func.C >> func.D >> func.E >> func.F 
  >> func.G >> func.H >> func.I >> func.J;
  
  double x = root(func, p, q);
  //cout << setprecision(7) << x;
  printf("%0.7lf\n",x);
  
  return 0;
}
