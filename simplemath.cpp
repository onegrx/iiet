#include <cassert>
#include <vector>
#include <set>
using namespace std;
int max(int a, int b);
int abs(int a);
int digits(int number);
bool isPrime(int n);
int power(int b, int e);
int fpower(int b, int e);
int factorial(int n);
set<int> divisors(int n);
vector<int> primeFactors(int n);
int gcd(int a, int b);
int fib(int n);

//****************************************

int main() {
  assert(power(7,3)==fpower(7,3));
  assert(max(5,8)==8);
  assert(digits(3742)==4);
  assert(isPrime(19));
  assert(!isPrime(20));
  assert(abs(-3)==3);
  assert(factorial(5)==120);
}

int max(int a, int b) { 
  return (a > b) ? a : b;
}

int abs(int a) {
  if(a>=0) return a;
  else return -a;
}

int digits(int number) {
  int result = 0;
  while(number > 0) {
    number /= 10;
    result++;
  }
  return result;
}

bool isPrime(int n) {
  bool prime = true;
  for(int i = 2; (i*i < n) && prime; i++) {
    if(n % i == 0) prime = false;
  }
  return prime;
}

int power(int b, int e) {
  int result = 1;
  while(e--) result *= b;
  return result;
}

int fpower(int b, int e) {
  if(e==0) return 1;
  int result = 1;
  while(e > 0) {
    if((e&1)==1) result *= b; //if odd
    e /= 2;
    b *= b;
  }
  return  result;
}

int factorial(int n) {
  int result = 1;
  for(int i = 1; i <= n; i++) result *= i;
  return result;
}

set<int> divisors(int n) {
  set<int> res;
  for(int i = 1; i*i <= n; ++i) {
    if(n % i == 0) {
      if(i != n/i) {
        res.insert(i);
        res.insert(n/i);
      }
      else res.insert(i);
    }
  }
  return res;
}

vector<int> primeFactors(int n) {
  vector<int> res;
  


}
