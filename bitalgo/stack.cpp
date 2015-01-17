#include <iostream>
using namespace std;

class Stack {
  
  public:
    Stack(int n);
    ~Stack();
    
    void push(int value);
    int pop();
  
  private:
    int *storage;
    int up;  
  
};

Stack::Stack(int n) {
  
  storage = new int[n];
  up = 0;
  
}

Stack::~Stack() {
  
  delete [] storage;
  
}

void Stack::push(int value) {

  storage[up++] = value;
  
}

int Stack::pop() {
  
  int element = storage[--up];
  return element;
  
}

int main() {
  
  Stack s(5);
  return 0;
}
