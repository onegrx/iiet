#include <iostream>
#include <algorithm>
using namespace std;

void countsort(int A[], int size, int k) {
    //Assumes A contains numbers from 0 to k-1 inclusive
    int *B = new int[size];
    int *C = new int[k];
    
    for(int i = 0; i < k; ++i) C[i] = 0;
    for(int i = 0; i < size; ++i) C[A[i]]++;
    //C[i] equals number of elements = i
    
    for(int i = 1; i < k; ++i) C[i] = C[i] + C[i - 1];
    //C[i] equals number of elements <= i

    for(int i = size - 1; i >= 0; i--) {
        B[C[A[i]] - 1] = A[i];
        C[A[i]]--;
    }
}

int main() {
    
    
    return 0;
}
