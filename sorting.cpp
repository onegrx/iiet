#include <iostream>
#include <algorithm>
using namespace std;
int main() {}

void bubbleSort(int n, int *T) {
  for(int i = n-1; i > 0; --i) {
    for(int j = 0; j < i; j++) {
      if(T[j] > T[j+1]) swap(T[j], T[j+1]);
    }
  }
}

void bubbleSort2(int n, int *T) {
  for(int i = n; i > 0; --i) {
    for(int j = 0; j < i-1; ++j) {
      if(T[j] > T[j+1]) swap(T[j], T[j+1]);
    }
  }
}

void insertionSort(int n, int *T) {
  for(int j = 1; j < n; j++) {
    int key = T[j];
    int i = j - 1;
    while((i >= 0) && (T[i] > key)){
      T[i+1] = T[i];
      i--;
    }
    T[i+1] = key;
  }  
}
