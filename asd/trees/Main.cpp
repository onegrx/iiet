#include <iostream>
#include <algorithm>
#include "BST/BST.h"

using namespace std;

int main() {

    BST bst;
    bst.insert(12);
    bst.insert(5);
    bst.insert(18);
    bst.insert(2);
    bst.insert(9);
    bst.insert(6);

    bst.inOrderWalk(bst.search(12));
    cout << endl;


    return 0;
}

