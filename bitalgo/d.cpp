#include <iostream>
using namespace std;

int numbers[1001] = {0};

void bubbleSort(int n, int *T) {
  for(int i = n-1; i > 0; --i) {
    for(int j = 0; j < i; j++) {
      if(T[j] > T[j+1]) swap(T[j], T[j+1]);
    }
  }
}

int main() {

  int n;
  cin >> n;
  
  for(int i = 0; i < n; i++) cin >> numbers[i];
  bubbleSort(n, numbers);
  for(int i = 0; i < n; i++) cout << numbers[i] << " ";
  
  cout << endl;
  
  return 0;
}
