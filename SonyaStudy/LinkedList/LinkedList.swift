//
//  LinkedList.swift
//  SonyaStudy
//
//  Created by Danyl Timofeyev on 11.11.2021.

//

import Foundation

protocol LinkedListProtocol {
    associatedtype T: Equatable & CustomStringConvertible
    
    var isEmpty: Bool { get }
    var first: Node<T>? { get }
    var last: Node<T>? { get }
    
    func append(_ node: Node<T>)
    func prepend(_ node: Node<T>)
    func getNodeAtIndex(_ index: Int) -> Node<T>?
}


class LinkedList<T: Equatable & CustomStringConvertible>: LinkedListProtocol {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    var first: Node<T>? { head }
    var last: Node<T>? { tail }
    
    func append(_ node: Node<T>) {
        if isEmpty {
            return setupInitialNode(node)
        }
        tail?.next = node
        node.previous = tail
        tail = node
    }
    
    func prepend(_ node: Node<T>) {
        if isEmpty {
            return setupInitialNode(node)
        }
        head?.previous = node
        head = node
    }
    
    func getNodeAtIndex(_ index: Int) -> Node<T>? {
        guard index >= 0, let head = head else { return nil }
        var currentIndex = 0
        var currentNode: Node<T>? = head
        
        while(currentIndex < index) {
            currentNode = getNextNode(forNode: currentNode)
            currentIndex += 1
        }
        return currentNode
    }
    
    private func setupInitialNode(_ node: Node<T>?) {
        guard let node = node else { return }
        head = node
        head!.next = node
        tail = node
        tail!.previous = first
    }
    
    private func getNextNode(forNode node: Node<T>?) -> Node<T>? {
        node?.next
    }
    
    private func getPreviousNode(forNode node: Node<T>?) -> Node<T>? {
        node?.previous
    }
}

//struct LRU<Key: Hashable, Value> {
//    var data: [Key: Value]
//    var capacity: Int
//
//  init(capacity: Int) {
//    self.capacity = capacity
//
//  }
//
//  func add(key: Key, val: Value) {
//
//  }
//
//  func get(key: Key) {
//
//  }
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
