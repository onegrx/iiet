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

Train* findTrainAdress(Train* head, string t) {
  
  Train* tmp = head;
  while((tmp != nullptr) && (tmp -> value != t))
    tmp = tmp -> next;
  //we assume given train exists
  return tmp;
  
}

Train* NEW(Train* head, string t, string p) {
  
  Person* person = new Person(p, nullptr, nullptr);
  head = new Train(t, person, head);
  return head;
}

Train* BACK(Train* head, string t, string p) {
    
  Person* q = findTrainAdress(head,t) -> head;
  while(q -> next != nullptr) q = q -> next;
  q -> next = new Person(p, q, nullptr);
  return head;
}

Train* FRONT(Train* head, string t, string p) {
  
  Train* train = findTrainAdress(head,t);
  Person* first =  train -> head;
  Person* zero = new Person(p, nullptr, first);
  train -> head = zero;
  first -> prev = zero;
  return head;
}

Train* PRINT(Train* head, string t) {

  Train* train = findTrainAdress(head, t);
  cout << "\"" << t << "\":" << endl;
  Person* q = train -> head;
  while(q != nullptr) {
    cout << q -> name << "<-";
    q = q -> next;    
  }
  cout << endl;
  return head;
}

void play(int orders) {
  
  Train* train = nullptr;
  
  string cmd, opt1, opt2;
  
  while(orders--) {
    
    cin >> cmd;
    if (cmd == "NEW") {
      
      cin >> opt1 >> opt2;     
      train = NEW(train, opt1, opt2);
      
    }
    else if (cmd == "BACK") {

      cin >> opt1 >> opt2;     
      train = BACK(train, opt1, opt2);
      
    }
    
    else if (cmd == "FRONT") {
    
      cin >> opt1 >> opt2; 
      train = FRONT(train, opt1, opt2);
      
    }
    else if (cmd == "PRINT") {
    
      cin >> opt1;
      train = PRINT(train, opt1);
      
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
