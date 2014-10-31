#include <iostream>
using namespace std;

const int DIGITS  = 5000;
int res[DIGITS] = {0};

int main() {

  res[0] = 1;
  int n, i, length = 1, carry = 0;
  cin >> n;
  
  for(int mul = 1; mul <= n; mul++) {
    
    i = 0;
    while( (i < length) || (carry != 0) ) {
    
      res[i] = (res[i] * mul) + carry;
      carry = res[i] / 10;
      res[i] = res[i] % 10;
      i++;
      
    }
    length = i;
    
  }
  
  //write out
  for(int j = length - 1; j >= 0; j--) cout << res[j];
  
}
