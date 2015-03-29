
// Problem maksymalnej podtablicy (spójnej)
// Suma spójnego ciągu (SSP)
// http://main.edu.pl/pl/user.phtml?op=lesson&n=29&page=algorytmika

#include <iostream>
using namespace std;

// Brute force O(n^3)
int ssp1(int A[], int n) {
    
    int result = 0;
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

int main() {
    
    return 0;
}
