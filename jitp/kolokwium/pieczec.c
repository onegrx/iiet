#include <stdio.h>
#define N 10000
#define K 10000
#define L 10000

int T[N][N];
int P[K][L];

int main() {
  
  int n, k, l;
  scanf("%d %d %d", &n, &k, &l);
  
  if((n <= l)||(n <= k)) {
  
    printf("Wartosci niezgodne z trescia zadania");
    return 1;
    
  }
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      scanf("%d", &T[i][j]);
    }
  }
      
  for(int i = 0; i < l; i++) {
    for(int j = 0; j < k; j++){
      
      scanf("%d", &P[i][j]);
      //walidacja wczytanego znaku
      if(!((P[i][j] == 0) || (P[i][j] == 1))) { 
      
        printf("Tablica P moze zawierac tylko wartosci O i 1");
        return 1;
        
      }
    }
  }

  int max_so_far = 0;
  int sum = 0;
    
  //dwie ponizsze petle odpowiadaja wlasciwemu ustawieniu lewych gornych rogow tablic
  for(int i = 0; i <= (n - l); i++) {
    for(int j = 0; j <= (n - k); j++) {
     
      sum = 0;
            
      //teraz nastepuje iteracja po odpowiednio umiesczonej tablicy P
      for(int x = 0; x < l; x++) {
        for(int y = 0; y < k; y++) {
        
          //Debbuging tools in case of failure :)
          //printf("! i = %d j = %d x = %d y = %d P[x][y] = %d T[x+i][y+j] = %d\n", i, j, x, y, P[x][y], T[x+1][y+1]);
          
          if(P[x][y] == 1) sum += T[x+i][y+j];
        
        }
      }
      
      if(sum > max_so_far) max_so_far = sum;      
      
    }
  }
  
  printf("\n%d\n", max_so_far);
  
  return 0;
}
