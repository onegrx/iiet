#include <iostream>
#include <string>
using namespace std;

class Person {
  public:
    string name;
    Person* next;
    Person* prev;
    
    Person() {}
    Person(string val, Person* p, Person* n) {
      name = val;
      prev = p;
      next = n;
    }
};

class Train {
  public:
    string value;
    Person* head;
    Train* next;
    
    Train(string val, Person* head, Train* adress) {
      value = val;
      head = head;
      next = adress;
    }
};

Train* NEW(Train* head, string t, string p) {
  
  Person* person = new Person(p, nullptr, nullptr);
  head = new Train(t, person, head);
  return head;
}

Train* BACK(Train* head, string t, string p) {
  
  Train* tmp = head;
  while((tmp != nullptr) && (tmp -> value != t))
    tmp = tmp -> next;
  
  Person* q = tmp -> head;
  while(q -> next != nullptr) q = q -> next;
  q -> next = new Person(p, q, nullptr);
  return head;
}

void play(int orders) {
  
  Train* train = nullptr;
  
  string cmd, opt1, opt2;
  
  while(orders--) {
    
    cin >> cmd;
    if(cmd == "NEW") {
      
      cin >> opt1 >> opt2;     
      train = NEW(train, opt1, opt2);
      
    }
    else if (cmd == "BACK") {

      cin >> opt1 >> opt2;     
      train = BACK(train, opt1, opt2);
      
    }
    
  
  }
}

int main() {

  int Z, orders;
  cin >> Z;
  while(Z--) {
    
    cin >> orders;
    play(orders);
    
  }
  return 0;
    
}
