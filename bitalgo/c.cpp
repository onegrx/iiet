#include <cstdio>

bool isPrime(int n) {
  if(n == 1) return false;
  bool prime = true;
  for(int i = 2; (i*i <= n) && prime; i++) {
    if(n % i == 0) prime = false;
  }
  return prime;
}

int main() {
  int Z;
  scanf("%d", &Z);
  int a;
  while(Z--) {
    scanf("%d", &a);
    if(isPrime(a)) printf("TAK\n");
    else printf("NIE\n");  
  }
  return 0;
}
