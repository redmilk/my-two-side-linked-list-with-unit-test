//
//  LRUCache.swift
//  SonyaStudy
//
//  Created by Danyl Timofeyev on 13.11.2021.
//

import Foundation


//
//struct LRU<Key: Hashable, Value> {
//    var data: [Key: Value]
//    var capacity: Int
//    
//    init(capacity: Int) {
//        self.capacity = capacity
//    }
//    
//    func add(key: Key, val: Value) {
//        
//    }
//    
//    func get(key: Key) {
//        
//    }
//    
//}

/**
 
a: 1
c: 2
e: 10


get(e)
e: 10
a: 1
c: 2

get(a)
a: 1
e: 10
c: 2

add(z: 20)
a: 1
e: 10
z: 20
 
*/
