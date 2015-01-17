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
    int f, r; //front, rear
    int size;  
};

Queue::Queue(int n) {
  
  storage = new int[n];
  f = 0;
  r = 0;
  size = n;
  
}

Queue::~Queue() {
  
  delete [] storage;
  
}

void Queue::push(int value) {

  storage[r] = value;
  r++;
  if(r >= size) r = 0;
  
}

void Queue::pop() {
  
  f++;
  f %= size;
  
}

int Queue::front() {

  return storage[f];
  
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
