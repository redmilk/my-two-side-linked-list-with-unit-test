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
    func removeAll()
    @discardableResult
    func removeElement(_ element: T) -> Bool
    @discardableResult
    func printAll() -> String?
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
        node.next = head
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
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    @discardableResult
    func removeElement(_ elementToDelete: T) -> Bool {
        guard !isEmpty else { return false }
        /// if element to delete is Head
        if elementToDelete == head!.value {
            return removeHead()
        }
        var currentNode = head
        while getNextNode(forNode: currentNode) != nil {
            currentNode = getNextNode(forNode: currentNode)
            guard let value = currentNode?.value, value == elementToDelete else { continue }
            let previousNode = currentNode?.previous
            let nextNode = currentNode?.next
            /// if next and previous nodes does exist
            if previousNode != nil && nextNode != nil {
                previousNode?.next = nextNode
                nextNode?.previous = previousNode
                /// if no previous node, we deal with head
            } else if previousNode == nil {
                nextNode?.previous = nil
                head = nextNode
            } else if nextNode == nil {
                /// if no next node, we deal with tail
                previousNode?.next = nil
                tail = previousNode
            }
            return true
        }
        return false
    }
    
    @discardableResult
    func printAll() -> String? {
        guard !isEmpty else { return nil }
        var currentNode = head
        var result: String = ""
        result += "\(currentNode!.value)  "
        while getNextNode(forNode: currentNode) != nil {
            currentNode = getNextNode(forNode: currentNode)
            result += "\(currentNode!.value)  "
        }
        return result
    }
    
    private func setupInitialNode(_ node: Node<T>?) {
        guard let node = node else { return }
        head = node
        tail = node
    }
    
    private func removeHead() -> Bool {
        guard head != nil else { return false }
        let nodeAfterHead = getNextNode(forNode: head)
        nodeAfterHead?.previous = nil
        head = nodeAfterHead
        return true
    }
    
    private func getNextNode(forNode node: Node<T>?) -> Node<T>? {
        node?.next
    }
    
    private func getPreviousNode(forNode node: Node<T>?) -> Node<T>? {
        node?.previous
    }
}
