#include <stdio.h>
#include <math.h>
#define TAYLOR_PRECISE 20

int main() {
  
  double a, b, step;
  scanf("%lf %lf %lf", &a, &b, &step);
  
  printf("x\t\tcos(x)\t\tcos(x) z wzoru taylora\n");
  double taylor, mul;
  
  for(double x = a; x <= b; x += step) {
    
    taylor = 1;
    mul = 1;
    
    for(int j = 1; j < TAYLOR_PRECISE; j += 2) {
    
      mul *= (-1);
      mul *= pow(x,2)/((j*(j+1)));
      taylor += mul;
    
    }
  
    printf("%lf\t%lf\t%lf\n", x, cos(x), taylor);
    
  }
  
  return 0;
}
