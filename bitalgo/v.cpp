#include <iostream>
using namespace std;

class Queue {
  public:
  
    Queue(int n);
    ~Queue();
  
    void push(int value);
    void pop();
    int front();
  
  private:
  
    int *storage;
    int p, q;
    int size;  
};

Queue::Queue(int n) {
  
  storage = new int[n];
  p = 0;
  q = 0;
  size = n;
  
}

Queue::~Queue() {
  
  delete [] storage;
  
}

void Queue::push(int value) {

  storage[q] = value;
  q++;
  if(q >= size) q = 0;
  
}

void Queue::pop() {
  
  p++;
  p %= size;
  
}

int Queue::front() {

  return storage[p];
  
}

int main() {

  int n, k;
  int x;
  string cmd;
  
  cin >> n >> k;
  
  Queue q(n);
  
  for(int i = 0; i < k; i++) {
  
    cin >> cmd;
    
    if(cmd == "PUSH") {
      
      cin >> x;
      q.push(x);
      
    }
    else if (cmd == "POP") {
      
      q.pop();
      
    }
    else if (cmd == "FRONT") {
      
      cout << q.front() << endl;
      
    }
    
  }

  return 0;
}
