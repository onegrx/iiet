//
// Created by onegrx on 09.05.15.
//

#ifndef TREES_BST_H
#define TREES_BST_H


#include "../BSTNode/BSTNode.h"

class BST {

    private:
    BSTNode* root;

    public:
    BST();

    BSTNode* search(int key);
    void insert(int key);
    void inOrderWalk(BSTNode *start);

    BSTNode* maxElement();
    BSTNode* minElement();
    BSTNode* successor(BSTNode);
    BSTNode* predecessor(BSTNode);


};


#endif //TREES_BST_H
