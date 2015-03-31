#include <iostream>
#include <algorithm>
using namespace std;

int partition(int A[], int p, int r) {
    int pivot = A[r];
    int i = p - 1;
    
    for(int j = p; j < r; j++) {
        if(A[j] <= pivot) {
            i++;
            swap(A[j], A[i]);
        }
    }
    
    swap(A[r], A[i + 1]);
    return i + 1;
}

int select(int A[], int size, int k) {

    if(size <= 1) return A[0];
    
    int q = partition(A, 0, size - 1);
    
    if(k == q) return A[k];
    else if(k < q) return select(A, q, k);
    else return select(A + q + 1, size - (q + 1), k - (q + 1));
    
}

int main() {
    
    const int size = 10;
    int A[size] = {5, 2, 7, 8, 1, 9, 0, 4, 3, 6};

    cout << "4th element is: " << select(A, size - 1, 4);
    
    return 0;
}
