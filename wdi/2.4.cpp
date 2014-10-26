#include <iostream>
using namespace std;

int digits(int number) {

  int result = 0;
  while(number > 0) {
    number /= 10;
    result++;
  }
  return result;
  
}

int power(int b, int e) {

  int result = 1;
  while(e--) result *= b;
  return result;

}

int main() {

  int input, factor;

  cout << "Give a number: ";
  cin >> input;
  cout << "Give a factor: ";
  cin >> factor;  
  
  int digitsOfInput = digits(input);
  int amount = 0;
  
  //generate masks from 00000 to 11111 - example for 5-digits number
  //1 << n equals 2^n but is faster and shorter
  for(int mask = 0; mask < (1 << digitsOfInput); mask++) {
  
  int fig = input;
  int sum = 0;
  int exponent = 0;
  
    for(int i = 0; i < digitsOfInput; i++) {
    
      int current = fig % 10;
      fig /= 10;
      
      if(((1 << i) & mask) > 0) {
        sum += power(10,exponent)*current;
        exponent++;
      }   
       
    }
    
    if((sum % factor == 0) && (sum > 0)) {
      amount++;
      cout << sum << endl;
    }
  }
  
  cout << endl << "Number of possibilities: " << amount << endl;
  return 0;
}
