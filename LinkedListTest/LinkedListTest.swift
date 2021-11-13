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
    var filledList: LinkedList<Int>! // filledList with values: 8 7 5 3 1 2 4 6

    
    override func setUpWithError() throws {
        linkedList = LinkedList<Int>()
        filledList = LinkedList<Int>()

        filledList.prepend(Node(value: 1))
        filledList.append(Node(value: 2))
        filledList.prepend(Node(value: 3))
        filledList.append(Node(value: 4))
        filledList.prepend(Node(value: 5))
        filledList.append(Node(value: 6))
        filledList.prepend(Node(value: 7))
        filledList.prepend(Node(value: 8))
        /// 8 7 5 3 1 2 4 6
    }

    override func tearDownWithError() throws {
        linkedList = nil
        filledList = nil
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
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        linkedList.prepend(node1)
        linkedList.append(node2)
        linkedList.prepend(node3)
        linkedList.append(node4)
        linkedList.prepend(node5)
        linkedList.append(node6)
        linkedList.prepend(node7)
        linkedList.prepend(node8)
        /// 8 7 5 3 1 2 4 6
        
        var currentNode = linkedList.first
    
        let expectedResult: Int = 6
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
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        linkedList.prepend(node1)
        linkedList.append(node2)
        linkedList.prepend(node3)
        linkedList.append(node4)
        linkedList.prepend(node5)
        linkedList.append(node6)
        linkedList.prepend(node7)
        linkedList.prepend(node8)

        /// 8 7 5 3 1 2 4 6
        
        var currentNode = linkedList.last
    
        let expectedResult: Int = 8
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
        let index1: Int = 5
        let index2: Int = 7
        let index3: Int = 1

        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        linkedList.prepend(node1)
        linkedList.append(node2)
        linkedList.prepend(node3)
        linkedList.append(node4)
        linkedList.prepend(node5)
        linkedList.append(node6)
        linkedList.prepend(node7)
        linkedList.prepend(node8)
        /// 8 7 5 3 1 2 4 6
        
        let expectedResult1: Int = 2
        let actualResult1: Int?
        let expectedResult2: Int = 6
        let actualResult2: Int?
        let expectedResult3: Int = 7
        let actualResult3: Int?
        
        // When
        actualResult1 = linkedList.getNodeAtIndex(index1)?.value
        actualResult2 = linkedList.getNodeAtIndex(index2)?.value
        actualResult3 = linkedList.getNodeAtIndex(index3)?.value
        
        // Then
        XCTAssert(expectedResult1 == actualResult1 &&
                    expectedResult2 == actualResult2 &&
                    expectedResult3 == actualResult3)
    }
    
    func testRemoveAll() throws {
        // Given
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        linkedList.prepend(node1)
        linkedList.append(node2)
        linkedList.prepend(node3)
        linkedList.append(node4)
        linkedList.prepend(node5)
        linkedList.append(node6)
        linkedList.prepend(node7)
        linkedList.prepend(node8)
        /// 8 7 5 3 1 2 4 6
        
        // When
        linkedList.removeAll()
        
        // Then
        XCTAssert(linkedList.isEmpty)
    }
    
    func testRemoveSpecificNodeWhenItIsHead() {
        // Given
        let valueToDelete: Int = 8
        let expectedResult: String = "7  5  3  1  2  4  6  "
        var actualResult: String
        
        // When
        filledList.removeElement(valueToDelete)
        actualResult = filledList.printAll() ?? ""
        
        //Then
        XCTAssert(expectedResult == actualResult)
    }
    
    func testRemoveSpecificNode() throws {
        // Given
        /// filledList with values: 8 7 5 3 1 2 4 6
        let valueToDelete1: Int = 3
        let valueToDelete2: Int = 4
        let valueToDelete3: Int = 6
        let valueToDelete4: Int = 8
        
        var actualResult1: Bool
        var actualResult2: Bool
        var actualResult3: Bool
        var actualResult4: Bool

        // When
        let initialState = filledList.printAll()
        actualResult1 = filledList.removeElement(valueToDelete1)
        let state1 = filledList.printAll()
        actualResult2 = filledList.removeElement(valueToDelete2)
        let state2 = filledList.printAll()
        actualResult3 = filledList.removeElement(valueToDelete3)
        let state3 = filledList.printAll()
        actualResult4 = filledList.removeElement(valueToDelete4)
        let finalState = filledList.printAll()
        
        // Then
        XCTAssert(actualResult1 && actualResult2 && actualResult3 && actualResult4,
                  "\(actualResult1) && \(actualResult2) && \(actualResult3) && \(actualResult4)")
    }
    
    func testPrintAll() {
        // Given
        var resultForPrint: String?
        let expectedResult = "8  7  5  3  1  2  4  6  "
        
        // When
        resultForPrint = filledList.printAll()

        // Then
        XCTAssert(resultForPrint ?? "" == expectedResult)
    }

}
