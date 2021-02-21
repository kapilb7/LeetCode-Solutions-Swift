import UIKit
import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?
    var size: Int
    
    init() {
        size = 0
    }
    
    func displayLinkedList() {
        guard var node = head else { return }
        print(node.value)
        while let next = node.next {
            node = next
            print("\(node.value)")
        }
    }
    
    func append(value: Int) {
        let node = Node(value: value)
        
        if size == 0 {
            head = node
            tail = head
        } else {
            let newTail = node
            tail?.next = newTail
            tail = newTail
            tail?.next = nil
        }
         size += 1
    }
    
    func appendAtHead(value: Int) {
        let node = Node(value: value)
        
        if size == 0 {
            head = node
            tail = head
        } else {
            let newHead = node
            newHead.next = head
            head = newHead
        }
        size += 1
    }
    
    func appendAtIndex(value: Int, index: Int) {
        if index > size {
            print("Index out of bounds...")
        }
        
        if index == size{
            append(value: value)
        } else if index == 0 {
            appendAtHead(value: value)
        } else {
            var nodes = 0
            var node = head
            
            while node != nil {
                if nodes == index - 1 {
                    let newNode = Node(value: value)
                    newNode.next = node?.next
                    node?.next = newNode
                    size += 1
                    break
                }
                nodes += 1
                node = node?.next
            }
        }
    }
    
    func get(index: Int) -> Int{
        if index > size {
            print("Index out of bounds...")
        }
        
        var nodes = 0
        var node = head
        
        while node != nil {
            if nodes == index {
                return node!.value
            }
            nodes += 1
            node = node?.next
        }
        return -1
    }
    
    func deleteAtIndex(index: Int) {
        if index > size {
            print("Index out of bounds...")
        }
        
        if index == 0 {
            head = head?.next
        } else {
            var nodes = 0
            var node = head
            
            while node != nil {
                if nodes == index - 1 {
                    if index == size - 1{
                        tail = node
                    }
                    node?.next = node?.next?.next
                    break
                }
                nodes += 1
                node = node?.next
            }
        }
        size -= 1
    }
    
    func hasCycle(head: Node?) -> Bool {
        var slowPointer = head
        var fastPointer = head
        
//        while fastPointer != nil, fastPointer?.next != nil {
//            slowPointer = slowPointer?.next
//            fastPointer = fastPointer?.next?.next
//
//            if slowPointer?.value == fastPointer?.value && slowPointer?.next?.value == fastPointer?.next?.value {
//                return true
//            }
//        }
//        return false
        
        while fastPointer != nil , fastPointer?.next != nil {
                slowPointer = slowPointer?.next
                fastPointer = fastPointer?.next?.next
                
                if slowPointer === fastPointer {
                    return true
                }
            }
            return false
    }
    
    func detectCycle(head: Node?) -> Node? {
//        if head == nil || head?.next == nil {
//            print("Not enough number of nodes to create a cycle...")
//        }
//
//        var slowPointer = head
//        var fastPointer = head
//
//        while slowPointer?.next != nil || fastPointer?.next != nil || fastPointer?.next?.next != nil {
//            slowPointer = slowPointer?.next
//            fastPointer = fastPointer?.next?.next
//
//            if slowPointer?.value == fastPointer?.value && slowPointer?.next?.value == fastPointer?.next?.value {
//                break
//            }
//        }
//
//        slowPointer = head
//
//        while slowPointer !== fastPointer {
//            slowPointer = slowPointer?.next
//            fastPointer = fastPointer?.next
//        }
//        return slowPointer!
        
        if (head == nil || head?.next == nil) {
              return nil
          }
          
          var slowPointer = head
          var fastPointer = head
          
          // Once they match, stop iterating.
          while (slowPointer?.next != nil || fastPointer?.next != nil || fastPointer?.next?.next != nil) {
              slowPointer = slowPointer?.next
              fastPointer = fastPointer?.next?.next
              
              if (slowPointer === fastPointer) {
                  break
              }
          }
          
          // Reset slow pointer back to headnode to start again.
          slowPointer = head

          // When slow pointer and fast pointer meets, that's the start of the cycle.
          while(slowPointer !== fastPointer) {
              slowPointer = slowPointer?.next
              fastPointer = fastPointer?.next
          }
          
          return slowPointer
    }
    
    func createCycleAtEnd() {
        if size == 0 {
            print("Not enough number of nodes to create a cycle...")
        }
        
        tail?.next = head
        var nodes = 0
        
        guard var node = head else { return }
        print(node.value)

        while nodes < size {
            let next = node.next
            node = next!
            print("\(node.value)")
            nodes += 1
        }
    }
    
}
var list = LinkedList()
print("Added 10")
list.append(value: 10)
print("Added 20")
list.append(value: 20)
print("Added 30")
list.append(value: 30)
print("Added 0 at head")
list.appendAtHead(value: 0)
print("Added 40 at index 1")
list.appendAtIndex(value: 40, index: 1)
list.displayLinkedList()
print("Getting value at index 3: \(list.get(index: 3))")
print("Deleting node at index 1")
list.deleteAtIndex(index: 1)
list.displayLinkedList()
print("Displaying Cycle")
list.createCycleAtEnd()
print(list.hasCycle(head: list.head))
var cycle = list.detectCycle(head: list.head)
print("Cycle:")
print(cycle?.value as Any)






