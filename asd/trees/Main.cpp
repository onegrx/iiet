#include <iostream>
#include <algorithm>
#include "BST/BST.h"

using namespace std;

int main() {

    BST bst(12);
    bst.insert(5);
    bst.insert(18);
    bst.insert(2);
    bst.insert(9);
    bst.insert(6);

    BST bst2;
    bst2.insert(12);
    bst2.insert(18);
    bst2.insert(5);
    bst2.insert(2);
    bst2.insert(6);
    bst2.insert(9);

    bst.inorderWalk(bst.search(12));
    cout << endl;
    bst2.inorderWalk(bst.search(12));


    return 0;
}

