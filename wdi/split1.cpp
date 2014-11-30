//C++11
#include <iostream>
#include <string>
using namespace std;

void split(int n, string s, int prev) {
  
  if(n < 0) return;
  
  if(n == 0) {
  
    cout << s << endl;
    return;
    
  }
  
  for(int i = prev; i >= 1; i--) 
    split(n - i, s + to_string(i) + " ", i);
    
}

void split(int n) {
  split(n, "", n);
}

int main() {
  
  int n;
  cin >> n;
  split(n);
  return 0;
}
