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
    BST(int key);

    BSTNode* search(int key);
    void insert(int key);
    void inorderWalk(BSTNode *start);
};


#endif //TREES_BST_H
