#include <iostream>
using namespace std;

class Queue {
  public:
  
    Queue(int n);
    ~Queue();
  
    void push(int value);
    void pop();
    void front();
    
  private:
  
    int *storage;
    int f, r; //front, rear
    int size;  
    
    bool isFull() {
      return (r + 1) % size == f;
    }
    
    bool isEmpty() {
      return (r == (-1)) && (f == (-1));
    }
    
};

Queue::Queue(int n) {
  
  storage = new int[n];
  f = -1;
  r = -1;
  size = n;
  
}

Queue::~Queue() {
  
  delete [] storage;
  
}

void Queue::push(int value) {

  if(isFull()) {
    cout << "FULL" << endl;
    return;
  }
  
  if(isEmpty()) 
    f = r = 0;
  else 
    r = (r + 1) % size;
    
  storage[r] = value;
  cout << "OK" << endl;
  
}

void Queue::pop() {
  
  if(isEmpty()) {
    cout << "EMPTY" << endl;
    return;
  }
  if (f == r) //1 element left before pop()
    f = r = (-1);
  else
    f = (f + 1) % size;
    
  cout << "OK" << endl;
  
}

void Queue::front() {
  
  if(!isEmpty()){
    cout << storage[f] << endl;
  }
  else {
    cout << "NONE" << endl;  
  }
  
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
      
      q.front();
      
    }
    
  }

  return 0;
}
