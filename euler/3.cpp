#include <iostream>
using namespace std;

long long int big = 600851475143;

bool isPrime(int n) {
  if(n == 1) return false;
  bool prime = true;
  for(int i = 2; (i*i <= n) && prime; i++) {
    if(n % i == 0) prime = false;
  }
  return prime;
}

int main() {
  
  int maxfactor = 0;
  for(int i = 1; i * i < big; i += 2) {
    if(big % i == 0){
      if(isPrime(i)) {
        maxfactor = i;
        while(big % i == 0) big /= i;
      }
    }
  }
  if(big > maxfactor) maxfactor = big; //the reminder is prime
  cout << maxfactor << endl;

}
