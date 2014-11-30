#include <iostream>
using namespace std;

int numbers[1000001] = {0};

int binary_search(int b, int e, int target) {
  
  int m;
  while(b < e) {
    
    m = (b + e) / 2;
    
    if(numbers[m] < target) b = m + 1;
    else e = m;

  }
  
  if(numbers[b] == target) return b + 1; // sic
  else return -1;

}

int main() {
  
  int n, k;
  int query;
  cin >> n >> k;
  
  for(int i = 0; i < n; i++) cin >> numbers[i];
  
  for(int i = 0; i < k; i++) {
  
    cin >> query;
    //(first element, last element + 1, query)
    cout << binary_search(0, n, query) << " ";
    
  }
  
  cout << endl;
  
  return 0;
}


