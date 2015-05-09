//
// Created by onegrx on 09.05.15.
//

#include "BST.h"
#include <iostream>


BST::BST() {
    root = nullptr;
}

BST::BST(int key) {
    root = new BSTNode(key, nullptr, nullptr, nullptr);
}

BSTNode* BST::search(int key) {

    BSTNode* tmp_root = root;

    while(tmp_root != nullptr) {
        if(tmp_root -> key == key) {
            return tmp_root;
        }
        else if(tmp_root -> key < key) {
            tmp_root = tmp_root -> right;
        }
        else {
            tmp_root = tmp_root -> left;
        }
    }

    return tmp_root;

}

void BST::insert(int key) {

    BSTNode* current_parent = nullptr;
    BSTNode* tmp_root = root;

    while(tmp_root != nullptr) {
        current_parent = tmp_root;
        if(key < tmp_root -> key) {
            tmp_root = tmp_root -> left;
        }
        else {
            tmp_root = tmp_root -> right;
        }
    }

    BSTNode* bstNode = new BSTNode(key, current_parent, nullptr, nullptr);

    if(current_parent == nullptr) {
        root = bstNode;
        return;
    }
    if(key < current_parent -> key) {
        current_parent->left = bstNode;
        return;
    }
    current_parent->right = bstNode;


}


void BST::inorderWalk(BSTNode *start) {

    if(start != nullptr) {
        inorderWalk(start->left);
        std::cout << start->key << " ";
        inorderWalk(start->right);
    }

}
