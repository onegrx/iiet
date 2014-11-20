#include <cstdio>

int main() {
  
  char c;
  scanf("%c", &c);
  if(c != '\n') {
  
    main();
    printf("%c", c);
    
  }

  return 0;

}
