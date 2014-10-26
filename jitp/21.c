#include <stdio.h>
#include <string.h>
#define SIZEOFRESULT 200

char num1[100];
char num2[100];
char res[SIZEOFRESULT+1];

void reverse(char array[], int start, int end) {
  int temp;
  while(start < end) {
    temp = array[start];
    array[start] = array[end];
    array[end] = temp;
    start++;
    end--;    
  }
}

int main() {
  
  for(int i = 0; i <= 201; i++) res[i] = 0;
  
  scanf("%s", num1);
  scanf("%s", num2);  
  
  char sign = 0;
  int PTR1 = 0, PTR2 = 0;

  int len1 = strlen(num1);
  int len2 = strlen(num2);
  
  //Issues contected with signed numbers
  if(num1[0] == '-') {
    PTR1++;
    sign = 1;
    len1--;
    if(num2[0] == '-') {
      PTR2++;
      sign = 0;
      len2--;
    }
  }
  else if(num2[0] == '-') {
    PTR2++;
    sign = 1;
    len2--;
  }
      
  reverse(num1, PTR1, PTR1+len1-1);
  reverse(num2, PTR2, PTR2+len2-1);
  
  int actual;
  int i = 0, k = 0;
  
  //Debugging tools
  //printf("ptr1: %d ptr2: %d\n", PTR1, PTR2);
  //printf("len1: %d len2: %d\n", len1, len2);
  //printf("sign: %d\n", sign);
    
  //Multiplication, ptrs omits the potential signs, i and k indicates current positions
  for(int ptr1 = PTR1; ptr1 < PTR1+len1; ptr1++){
    k = 0; //Because old value remians from previous loop
    for(int ptr2 = PTR2; ptr2 < PTR2+len2; ptr2++){
      
      actual = (num1[ptr1]-'0')*(num2[ptr2]-'0');
      res[k+i+1] += actual / 10;
      res[k+i] += actual % 10;
      res[k+i+1] += res[k+i] / 10;
      res[k+i] = res[k+i]%10; 
      k++;
      
    }
    i++;
  }
  
  if(sign) printf("-");
  
  int index = SIZEOFRESULT; 
  while(!res[index]){index--;}
  
  while(index >= 0) {
  
    printf("%d",res[index]);
    index--;
    
  }
  printf("\n");
  
}
