import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
}

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

func findMerge(headA: Node?, headB: Node?) -> Int? {
    // Here...
    return nil
}

func findMergeSpace(headA: Node?, headB: Node?) -> Int? {
    let start = DispatchTime.now()
    let m = length(headA)
    let n = length(headB)
    
    var dict = [Int?:Bool]()
    var currentB = headB
    
    for _ in 0..<n {
        let b = currentB?.data
        dict[b] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    for _ in 0..<m {
        let a = currentA?.data
        if dict[a] == true {
            let end = DispatchTime.now()
            calculateTime(start: start, end: end, function: #function)
            return a
        }
        currentA = currentA?.next
    }
    
    let end = DispatchTime.now()
    calculateTime(start: start, end: end, function: #function)
    
    return nil
}

func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    
    let lenghtofA = length(headA)
    let lenghtofB = length(headB)
    
    var currentA = headA
    
    let start = DispatchTime.now()
    
    for _ in 0..<lenghtofA {
        let a = currentA?.data
        var currentB = headB
        for _ in 0..<lenghtofB {
            let b = currentB?.data
            if a == b {
                let end = DispatchTime.now()
                calculateTime(start: start, end: end, function: #function)
                return a
            }
            currentB = currentB?.next
        }
        currentA = currentA?.next
    }
    
    let end = DispatchTime.now()
    calculateTime(start: start, end: end, function: #function)
    return nil
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node1, headB: node10)
findMergeBrute(headA: node1, headB: node10)

findMergeSpace(headA: node1, headB: node10)


func calculateTime(start: DispatchTime, end: DispatchTime, function: String) {

        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests

        print("Time to evaluate problem \(function): \(timeInterval) seconds")
    
}
