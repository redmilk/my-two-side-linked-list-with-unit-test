//
//  Node.swift
//  SonyaStudy
//
//  Created by Danyl Timofeyev on 11.11.2021.
//

import Foundation

protocol NodeProtocol: AnyObject {
    associatedtype Node: NodeProtocol
    associatedtype T: Equatable & CustomStringConvertible
    var value: T { get }
    var next: Node? { get set }
    var previous: Node? { get set }
}

class Node<T: Equatable & CustomStringConvertible>: NodeProtocol {
    public var value: T
    public var next: Node?
    public weak var previous: Node?

    init(value: T) {
        self.value = value
    }
}
