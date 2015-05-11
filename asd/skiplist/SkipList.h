//
// Created by onegrx on 11.05.15.
//

#ifndef SKIPLIST_SKIPLIST_H
#define SKIPLIST_SKIPLIST_H


#include "SKLNode.h"

class SkipList {
public:
    void insert(int key, int val);

    SKLNode* head;
    SKLNode* tail;
    int max_level;
    int level;
};


#endif //SKIPLIST_SKIPLIST_H
