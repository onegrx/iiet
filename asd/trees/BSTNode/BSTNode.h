//
// Created by onegrx on 09.05.15.
//

#ifndef TREES_BSTNODE_H
#define TREES_BSTNODE_H


class BSTNode {

public:


    BSTNode(int key, BSTNode *parent, BSTNode *left, BSTNode *right) : key(key), parent(parent), left(left),
                                                                       right(right) { }

    int key;

    BSTNode* parent;
    BSTNode* left;
    BSTNode* right;

};


#endif //TREES_BSTNODE_H
