#include <stdio.h>
const int SIZE = 1000;

int bit[SIZE][SIZE];
int res[SIZE][SIZE];

int main() {

  int n, r;
  scanf("%d %d", &n, &r);
  
  int startx, starty;
  int endx, endy;
  int result;
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
    
      scanf("%d", &bit[i][j]);
            
    }
  }

  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
    
      startx = ((i - r) < 0) ? 0 : (i - r);
      starty = ((j - r) < 0) ? 0 : (j - r);
      
      endx = ((i + r) > (n - 1)) ? (n - 1) : (i + r);
      endy = ((j + r) > (n - 1)) ? (n - 1) : (j + r);
      
      result = 0;
      
      for(int x = startx; x <= endx; x++ ) {
        for(int y = starty; y <= endy; y++ ) {
          
          result += bit[x][y];
          
        }
      }
      
      res[i][j] = result;
      
    }
  }  
  
  printf("\n");
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
    
      printf("%d ", res[i][j]);
            
    }
    printf("\n");
  }  
  
  
  
  return 0;
}
