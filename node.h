class Node {
  public:
    int value;
    Node* next;
    
    Node(int val, Node* adress) {
      value = val;
      next = adress;
    }
};
