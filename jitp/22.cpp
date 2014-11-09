#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {

  int N;
  scanf("%d", &N);
  
  int *liczby = (int*)(calloc(N, sizeof(int)));
  for(int i = 0; i < N; i++) scanf("%d", &liczby[i]);
  
  int wynik_elements = ceil(N/2.0);
  int *wynik = (int*)(calloc(wynik_elements, sizeof(int)));
  
  
  for(int i = 0; i < wynik_elements; i++) {
  
    if((2*i+1) < N) wynik[i] = (liczby[2*i] + liczby[2*i+1]) / 2;
    else wynik[i] = liczby[2*i];    
    
  }
  
  for(int i = 0; i < N; i++) printf("%d ", liczby[i]);
  printf("\n");
  for(int i = 0; i < wynik_elements; i++) printf("%d ", wynik[i]);
  
  free(liczby);
  free(wynik);
  
  return 0;
}
