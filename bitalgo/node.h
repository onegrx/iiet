class Node {
  public:
    int value;
    Node* prev;
    Node* next;
    
    Node(int val, Node* p, Node* n) {
      value = val;
      prev = p;
      next = n;
    }
};
