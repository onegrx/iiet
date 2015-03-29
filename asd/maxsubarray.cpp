
// Use -std=c++11 flag for g++ to compile this file

// Problem maksymalnej podtablicy (spójnej)
// Suma spójnego ciągu (SSP)
// http://main.edu.pl/pl/user.phtml?op=lesson&n=29&page=algorytmika

#include <iostream>
#include <cassert>
#include <algorithm>
using namespace std;

//Example values taken from Cormen
const int n = 17;
int A[n] = {100, 113, 110, 85, 105, 102, 86, 63, 81, 101, 94, 106, \
    101, 79, 94, 90, 97};
    
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

//Dynamic solution using recursion, O(n log n)
//Good explanation in Cormen p. 70 - 73
int ssp3(int A[], int n) {

    if(n == 0) return 0;
    if(n == 1) return max(A[0], 0);
    int l, r;
    l = ssp3(A, n/2);
    r = ssp3(A + n/2, n - n/2); //to avoid round error
    
    //_ _ _ _ _ _
    //<--- | --->
    
    int lprim = 0, lpartial = 0; //or rather -inf as above
    for(int i = n/2 -1; i > 0; i--) {
        lpartial += A[i];
        if(lpartial > lprim) lprim = lpartial;
    }
    
    int rprim = 0, rpartial = 0;
    for(int i = n/2; i < n; i++) {
        rpartial += A[i];
        if(rpartial > rprim) rprim = rpartial;
    }    
    
    return max({l, r, lprim + rprim});
}

//Best solution using dynamic programming, O(n)
int ssp4(int A[], int n) {
    
    int result = 0;
    int partial = 0;
    for(int i = 0; i < n; i++) {
        partial += A[i];
        partial = max(partial, 0);
        if(partial > result) result = partial;
    }
    return result;
}

int main() {
        
    const int size = n - 1;
    int B[size];
    for(int i = 0; i < size; i++)
        B[i] = A[i + 1] - A[i];
    
    cout << "Result of ssp1: " << ssp1(B, size) << endl;
    cout << "Result of ssp2: " << ssp2(B, size) << endl;
    cout << "Result of ssp3: " << ssp3(B, size) << endl;
    cout << "Result of ssp4: " << ssp4(B, size) << endl;

    return 0;
}
