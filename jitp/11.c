#define _XOPEN_SOURCE
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
 
int main()
{ 
  double a, b;
	int N, hit = 0;
  
	scanf("%lf %lf", &a, &b);
  scanf("%d", &N);
	

  for(int i = 1; i <= N; i++) {
    
    double x = a + (drand48()*(b-a)); //generowanie losowych x z przedzialu [a,b]
    double y = (2* drand48()) -1; //generowanie losowych y z przedzialu [-1,1]
    
    if(sin(x)>0) {
      if(y<sin(x) && y>0)
        hit++;
    }
    else if (sin(x)<0) {
      if(y>sin(x) && y<0)
        hit++;
    }
    
    
  }
      
  double qarea = (b - a) * 2;
  double result = qarea * hit;
  result /= N;
  
  //Tricky, I wasted some time wondering why qarea * (hit / N) gives 0 --> both hit and N are integers. Now it works :)
  
  printf("%lf\n", result);
  return 0;
}


