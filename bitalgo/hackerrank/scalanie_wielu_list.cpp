#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

/*
3
1 8
2 6 8
3 1 3 9
*/

//when extracting min from heap how could one knows frome where it comes
//problem solved: keep structure with value and position list

int parent(int i) {
    return (i - 1)/2;
}

int left(int i) {
    return (2 * i) + 1;
}

int right(int i) {
    return (2 * i) + 2;
}

struct Node {
    int val;
    int list;
};

struct HeapMin {
    HeapMin(int n);
    int getSize();
    Node getMin();
    void buildHeap();
    void heapify(int i);
    void setElem(int index, int v, int l);
    Node getElem(int i);
    void shrink();
    Node* elems;
    int size;
};

HeapMin::HeapMin(int n) {
    elems = new Node[n];
    size = n;
}

int HeapMin::getSize() {
    return size;
}

Node HeapMin::getMin() {
    return elems[0];
}

void HeapMin::shrink() {
    size--;
}

void HeapMin::heapify(int i) {

    int l = left(i);
    int r = right(i);
    
    int smallest = i;
    
    if(l < size && elems[smallest].val > elems[l].val) smallest = l;
    if(r < size && elems[smallest].val > elems[r].val) smallest = r;
    
    if(smallest != i) {
        swap(elems[i], elems[smallest]); //not values!
        heapify(smallest);
    }
}

void HeapMin::buildHeap() {
    
    for(int i = (size + 1)/2; i >= 0; i--) {
        heapify(i);
    } 
    
}

void HeapMin::setElem(int index, int v, int l) {
    elems[index].val = v;
    elems[index].list = l;
}

Node HeapMin::getElem(int i) {
    return elems[i];
}


int main() {
    
    int n, k;
    cin >> n;
    int** list = new int*[n];
    
    int* size = new int[n];
    int* offset = new int[n];
    
    //Redaing stdin
    for(int i = 0; i < n; i++) {
        cin >> k;
        size[i] = k;
        offset[i] = 0;
        list[i] = new int[k];
        for(int j = 0; j < k; j++) {
            cin >> list[i][j];
        }
    }
    
    HeapMin h(n); 
    //heap contains first elements of each list from list[]
    
    //Setting heap fields
    for(int i = 0; i < n; i++) {
        h.setElem(i, list[i][0], i);
    }
    h.buildHeap();
    
    //for(int i = 0; i < h.getSize(); i++) {
    //   cout << h.getElem(i).val;
    //}
    
    
    vector<int> res;
    
    while(h.getSize() > 0) {
        
        res.push_back(h.getMin().val);
        int currentListIndex = h.getMin().list;
        
        if(offset[currentListIndex] + 1 < size[currentListIndex]) {
            offset[currentListIndex]++;
            h.setElem(0, list[currentListIndex][offset[currentListIndex]], currentListIndex);
            h.heapify(0);
        }
        else {
            h.shrink();
            h.elems[0] = h.elems[h.getSize()];
            h.heapify(0);            
        }
        
    }
    
    for(unsigned int i = 0; i < res.size(); i++) {
        cout << res[i] << " ";
    }
    return 0;
}
