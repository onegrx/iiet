#include <cstdio>

int moves = 0;

void hanoi(int n, char src, char dest, char help) {
  
  if(n > 0) {
    
    hanoi(n - 1, src, help, dest);
    printf("%c --> %c\n", src, dest);
    moves++;
    hanoi(n - 1, help, dest, src);
  
  }
  
}

int main() {
  
  int n;
  scanf("%d", &n);
  hanoi(n, 'A', 'B', 'C');
  printf("Number of moves: %d", moves);
  return 0;
}
