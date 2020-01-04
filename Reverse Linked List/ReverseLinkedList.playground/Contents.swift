import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
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

extension ListNode {
    func echo() {
        var t: ListNode? = self

        while t != nil {
            print((t?.val)!, terminator: " ")
            t = t?.next
        }
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)
head.echo()

print("")

let reversed = reverseList(head)
reversed?.echo()
