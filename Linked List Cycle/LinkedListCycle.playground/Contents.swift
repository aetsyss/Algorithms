import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(head: ListNode?) -> Bool {
    var slow = head
    var fast = head

    while slow != nil {
        slow = slow?.next
        fast = fast?.next?.next

        if slow != nil && fast != nil && slow?.val == fast?.val {
            return true
        }
    }

    return false
}

let head = ListNode(3)
head.next = ListNode(2)
head.next?.next = ListNode(0)
head.next?.next?.next = ListNode(-4)
head.next?.next?.next?.next = head.next

hasCycle(head: head)
