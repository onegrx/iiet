#include <iostream>
#include <algorithm>
using namespace std;

inline int parent(int i) {
    return (i - 1)/2;
}

inline int left(int i) {
    return (2 * i) + 1;
}

inline int right(int i) {
    return (2 * i) + 2;
}

void heapify(int A[], int size, int i) {
    
    int l = left(i);
    int r = right(i);
    
    int largest = i;
    
    if(l < size && A[l] > A[largest]) largest = l;
    if(r < size && A[r] > A[largest]) largest = r;
    
    if(largest != i) {
        swap(A[i], A[largest]);
        heapify(A, size, largest);
    }
}

void buildHeap(int A[], int size) {
    
    for(int i = parent(size - 1); i >= 0; i--) {
        heapify(A, size, i);
    }
    
}

void heapsort(int A[], int size) {

    buildHeap(A, size);
    for(int i = size - 1; i > 0; i--) {
        swap(A[0], A[i]);
        heapify(A, i, 0);
    }
    
}

int main() {
    
    const int size = 10;
    int A[size] = {5, 2, 7, 8, 1, 9, 0, 4, 3, 6};
    heapsort(A, size);
    for(int i = 0; i < size; i++) cout << A[i] << " ";
    cout << endl;
    
    return 0;
}
