#include <iostream>
#include <algorithm>
using namespace std;

//http://cs.stackexchange.com/questions/3/why-is-quicksort-better-than-other-sorting-algorithms-in-practice
//http://cs.stackexchange.com/questions/11458/quicksort-partitioning-hoare-vs-lomuto

//Lomuto's Method
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

void quicksort(int A[], int p, int r) {
    if(p < r) {
        int q = partition(A, p, r);
        quicksort(A, p, q - 1);
        quicksort(A, q + 1, r);        
    }
}

int main() {
    
    const int size = 10;
    int A[size] = {5, 2, 7, 8, 1, 9, 0, 4, 3, 6};
    quicksort(A, 0, size - 1);
    for(int i = 0; i < size; i++) cout << A[i] << " ";
    cout << endl;
    
    return 0;
}
