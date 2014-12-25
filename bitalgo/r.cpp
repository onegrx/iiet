#include <iostream>
#include <string>
using namespace std;

class Node {
  public:
    int value;
    Node* next;
    
    Node(int val, Node* adress) {
      value = val;
      next = adress;
    }
};

Node* top(Node* head) {
  
  if (head == nullptr) {
    cout << "EMPTY" << endl;
    return head;
  }
  cout << head->value << endl;
  return head;
  
}

Node* pop(Node* head) {
  
  if(head == nullptr) return head;
  Node* to_del = head;
  delete to_del;
  head = head -> next;
  return head;
    
}

Node* push(Node* head, int v) {
  
  head = new Node(v, head);
  return head;
  
}

int main() {
  
  int z;
  cin >> z;
  
  string cmd;
  int x;
  Node* hd = nullptr;

  
  while(z--){
    
    cin >> cmd;
    if (cmd == "TOP")
      hd = top(hd);
    else if (cmd == "POP")
      hd = pop(hd);
    else if (cmd == "PUSH") {
      cin >> x;
      hd = push(hd, x);
    }
        
  }
  
  return 0;
}
