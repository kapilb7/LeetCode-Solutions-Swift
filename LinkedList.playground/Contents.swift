import UIKit

class ListNode {
    let val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MyLinkedList {
    var head: ListNode?
    var tail: ListNode?
    var count: Int
    
    /** Initialize your data structure here. */
    init() {
        count = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index > count - 1 { return -1 }
        
        var i = 0
        var node = head
        
        while node != nil {
            if i == index {
                return node!.val
            }
            i += 1
            node = node!.next
        }
        
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        if count == 0 { // the list is empty
            head = ListNode(val)
            tail = head
        } else {
            let newHead = ListNode(val)
            newHead.next = head
            head = newHead
        }
        count += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        if count == 0 { // the list is empty
            head = ListNode(val)
            tail = head
        } else {
            let newTail = ListNode(val)
            tail!.next = newTail
            tail = newTail
        }
        count += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count { return }
        if index == count {
            addAtTail(val)
        } else if index == 0 {
            addAtHead(val)
        } else {
            var i = 0
            var node = head

            while node != nil {
                if i == index - 1 {
                    let newNode = ListNode(val)
                    newNode.next = node!.next
                    node!.next = newNode
                    count += 1
                    break
                }
                i += 1
                node = node!.next
            }
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= count { return }
        if index == 0 {
            head = head!.next
        } else {
            var i = 0
            var node = head

            while node != nil {
                if i == index - 1 {
                    if index == count - 1 { // "index" is at the tail
                        tail = node
                    }
                    node!.next = node!.next!.next
                    break
                }
                i += 1
                node = node!.next
            }
        }
        
        count -= 1
    }
}


var l = MyLinkedList()
l.addAtHead(2)
print(l.get(0))


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow_p = head
        var fast_p = head
        
        while fast_p != nil , fast_p?.next != nil {
            slow_p = slow_p?.next
            fast_p = fast_p?.next?.next
            
            if slow_p === fast_p {
                return true
            }
        }
        return false
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
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
}

var s = Solution()
print(s.hasCycle(l.head))
print(s.detectCycle(l.head) as Any)
