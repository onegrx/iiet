#include <iostream>
#include "node.h"
int main() {}

Node* find(int query, Node* head) {
  
  while(head != nullptr) {
    if(head -> value == query) return head;
    head = head -> next;
  }
  return nullptr;
  
}

Node* search(int query, Node* head) {
  
  while((head != nullptr) && (head -> value != query))
    head = head -> next;
  return head;
  
}

Node* push_front(int value, Node* head) {

  Node* first = new Node(value, head);
  return first;
  
}

