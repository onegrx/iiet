
// Problem maksymalnej podtablicy (spójnej)
// Suma spójnego ciągu (SSP)
// http://main.edu.pl/pl/user.phtml?op=lesson&n=29&page=algorytmika

#include <iostream>
#include <cassert>
using namespace std;

//Example values taken from Cormen
const int n = 17;
int A[n] = {100, 113, 110, 85, 105, 102, 86, 63, 81, 101, 94, 106, 101, \
    79, 94, 90, 97};
    
//Brute force O(n^3)
int ssp1(int A[], int n) {
    
    int result = 0; //or theoretically even minus infinity
    for(int i = 0; i < n; i++)
        for(int j = i; j < n; j++) {
            int partial = 0;
            for(int k = i; k <= j; k++)
                partial += A[k];
            if(partial > result)
                result = partial;
        } 
    return result;
}

//Brute force O(n^2)
int ssp2(int A[], int n) {
    
    int result = 0;
    for(int i = 0; i < n; i++) {
        int partial = 0;
        for(int j = i; j < n; j++) {
            partial += A[j];
            if(partial > result)
                result = partial;
        }
    }
    return result;
}



int main() {
        
    const int size = n - 1;
    int B[size];
    for(int i = 0; i < size; i++)
        B[i] = A[i + 1] - A[i];
    
    cout << "Result of ssp1: " << ssp1(B, size) << endl;
    cout << "Result of ssp2: " << ssp2(B, size);

    return 0;
}
