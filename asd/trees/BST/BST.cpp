//
// Created by onegrx on 09.05.15.
//

#include "BST.h"

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
