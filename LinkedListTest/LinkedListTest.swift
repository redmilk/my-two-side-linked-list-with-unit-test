//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Danyl Timofeyev on 11.11.2021.
//

import XCTest
@testable import SonyaStudy

class LinkedListTest: XCTestCase {
    
    var linkedList: LinkedList<Int>!
    
    override func setUpWithError() throws {
        linkedList = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        linkedList = nil
    }

    func testLastAppendedValue() throws {
        
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        let expectedResult: Int = 3
        let actualResult: Int?
        
        // When
        actualResult = linkedList.last?.value
        
        // Then
        XCTAssert(expectedResult == actualResult)
    }
    
    func testFirstAppendedValue() throws {
        
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        let expectedResult: Int = 1
        let actualResult: Int?
        
        // When
        actualResult = linkedList.first?.value
        
        // Then
        XCTAssert(expectedResult == actualResult)
    }
    
    
    func testFirstPreppendedValue() throws {
        
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        let node0 = Node(value: 0)
        linkedList.prepend(node0)
        
        let expectedResult: Int = 0
        let expectedHeadValue: Int = 0
        let actualResult: Int?
        
        // When
        actualResult = linkedList.first?.value
        
        // Then
        XCTAssert(expectedResult == actualResult && expectedHeadValue == actualResult)
    }
    
    func testSingleElementAppendCase() throws {
        
        // Given
        let node1 = Node(value: 1)
        linkedList.append(node1)
        
        let expectedHeadValue: Int = 1
        let expectedTailValue: Int = 1
        let actualHeadResult: Int?
        let actualTailResult: Int?
        
        // When
        linkedList.append(node1)
        actualHeadResult = linkedList.first?.value
        actualTailResult = linkedList.last?.value

        // Then
        XCTAssert(expectedHeadValue == actualHeadResult && expectedTailValue == actualTailResult)
    }
    
    func testSingleElementPreppendCase() throws {
        
        // Given
        let node1 = Node(value: 1)
        linkedList.prepend(node1)
        
        let expectedHeadValue: Int = 1
        let expectedTailValue: Int = 1
        let actualHeadResult: Int?
        let actualTailResult: Int?
        
        // When
        linkedList.append(node1)
        actualHeadResult = linkedList.first?.value
        actualTailResult = linkedList.last?.value

        // Then
        XCTAssert(expectedHeadValue == actualHeadResult && expectedTailValue == actualTailResult)
    }
    
    func testMovementFromHeadToTail() throws {
        
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        var currentNode = linkedList.first
    
        let expectedResult: Int = 3
        let actualResult: Int?
        
        // When
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        actualResult = currentNode?.value
        
        // Then
        XCTAssert(expectedResult == actualResult)
    }
    
    func testMovementFromTailToHead() throws {
        
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        var currentNode = linkedList.last
    
        let expectedResult: Int = 1
        let actualResult: Int?
        
        // When
        while currentNode?.previous != nil {
            currentNode = currentNode?.previous
        }
        actualResult = currentNode?.value
        
        // Then
        XCTAssert(expectedResult == actualResult)
    }
    
    func testEmptyListCase() throws {
        
        // Given
        let expectedHeadValue: Int? = nil
        let expectedTailValue: Int? = nil
        let expectedIsEmpty: Bool = true
        
        let actualHeadResult: Int?
        let actualTailResult: Int?
        let actualIsEmptyResult: Bool
        
        // When
        actualHeadResult = linkedList.first?.value
        actualTailResult = linkedList.last?.value
        actualIsEmptyResult = linkedList.isEmpty

        // Then
        XCTAssert(expectedHeadValue == actualHeadResult &&
                    expectedTailValue == actualTailResult &&
                    expectedIsEmpty == actualIsEmptyResult)
    }

    func testGettingNodeByIndex() throws {
        
        // Given
        let index: Int = 1

        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        linkedList.append(node1)
        linkedList.append(node2)
        linkedList.append(node3)
        
        let expectedResult: Int = 2
        let actualResult: Int?
        
        // When
        actualResult = linkedList.getNodeAtIndex(index)?.value
        
        // Then
        XCTAssert(expectedResult == actualResult, "⬜️⬜️⬜️ \(actualResult)")
    }

}
