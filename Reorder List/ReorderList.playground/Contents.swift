import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    func echo() {
        var t: ListNode? = self

        while t != nil {
            print((t?.val)!, terminator: " ")
            t = t?.next
        }

        print("")
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }

    var prev = head
    var cur = head?.next

    while cur != nil {
        let curNext = cur?.next

        cur?.next = prev
        prev = cur

        if cur?.next === head {
            cur?.next?.next = nil
        }

        cur = curNext
    }

    return prev
}

func reorderList(_ head: ListNode?) {
    var count = 0
    var cur = head
    while cur != nil {
        count += 1
        cur = cur?.next
    }

    if count < 3 {
        return
    }

    var right = head
    for _ in 0..<count/2 {
        right = right?.next
    }

    right?.next = reverseList(right?.next)

    cur = head
    var rightPointer = right?.next
    right?.next = nil

    for _ in 0..<(count - 1) / 2 {
        let nextRightPointer = rightPointer?.next
        rightPointer?.next = cur?.next
        cur?.next = rightPointer
        cur = rightPointer?.next
        rightPointer = nextRightPointer
    }
}

let a = ListNode(1)
a.next = ListNode(2)
a.next?.next = ListNode(3)
a.next?.next?.next = ListNode(4)
a.next?.next?.next?.next = ListNode(5)
a.next?.next?.next?.next?.next = nil

a.echo()

reorderList(a)

a.echo()
