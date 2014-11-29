//C++11
#include <iostream>
#include <string>
using namespace std;

void rozklad(int n, string s, int poprz) {

  if(n < 0) return;
  
  if(n==0) {
  
    cout << s << endl;
    return;
    
  }
  
  for(int i = poprz; i >= 1; i--) 
    rozklad(n - i, s + to_string(i) + " ", i);
    
}

int main() {
  
  int n;
  cin >> n;
  rozklad(n,"",n);
  return 0;
}
