//
// Created by onegrx on 09.05.15.
//

#include "BST.h"
#include <iostream>


BST::BST() {
    root = nullptr;
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


void BST::inOrderWalk(BSTNode *start) {

    if(start != nullptr) {
        inOrderWalk(start->left);
        std::cout << start->key << " ";
        inOrderWalk(start->right);
    }

}

BSTNode *BST::maxElement() {
    BSTNode* tmp_root = root;
    while(tmp_root->right != nullptr) {
        tmp_root = tmp_root->right;
    }
    return tmp_root;
}

BSTNode *BST::minElement() {
    BSTNode* tmp_root = root;
    while(tmp_root->left != nullptr) {
        tmp_root = tmp_root->left;
    }
    return tmp_root;
}

BSTNode *BST::successor(BSTNode node) {
    if(node.right != nullptr) {
        //return minElement(node.right);
    }
}

BSTNode *BST::predecessor(BSTNode node) {
    return nullptr;
}
