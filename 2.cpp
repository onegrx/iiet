#include <iostream>
using namespace std;

int main() {
  int sum = 2;
  const int LIMIT = 4000000;
  
  int a = 1, b = 2, c;
  while(sum < LIMIT) {
    
    c = a + b;
    a = b;
    b = c;
    if(c % 2 == 0) sum += c;
    
  }
  
  cout << sum << endl;
  return 0;
}
