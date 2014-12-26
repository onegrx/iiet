#include <iostream>
#include <algorithm>
using namespace std;

void next_perm(int *tab, int n) {
      
  int i = n - 1;
  while ((i > 0) && (tab[i - 1] >= tab[i])) i--;
  //now i is the head index of the non-increasing suffix 
  
  if(i > 0) {
    
    int p = i - 1;
    //p (pivot) is the first element before suffix

    int j = i;
    while ((j < n) && (tab[p] < tab[j])) j++;
    j--;
    //j is the rightmost successor to pivot in suffix
    
    //Debbuging tools
    //printf("i = %d -> %d  p = %d -> %d  j = %d -> %d  ", i, tab[i], p, tab[p], j, tab[j]);
    
    swap(tab[p], tab[j]);
    
  }
  
  reverse(tab+i, tab+n);
  
}

int main() {

  int length;
  cin >> length;
  
  int *seq = new int[length];
  for(int i = 0; i < length; ++i) cin >> seq[i];
  
  next_perm(seq, length);
  
  for(int i = 0; i < length; ++i) cout << seq[i] << " ";
  cout << endl;
  
}
