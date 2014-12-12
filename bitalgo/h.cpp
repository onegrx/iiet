#include <cstdio>

const double eps = 10e-9;

double root(double x) {
  double b = 0, e = x;
  while(e - b > eps) {
    double m = (b + e)/2.0;
    if(m*m > x) e = m;
    else b = m;
  }
  return b;  
} 

int main() {

  int z;
  scanf("%d", &z);
  while(z--) {
    int a;
    scanf("%d", &a);
    printf("%lf\n", root(a));
    
  }


}
