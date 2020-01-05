import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val < rhs.val
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var h1 = l1, h2 = l2
    let ret_head = ListNode(0)
    var ret_tail: ListNode? = ret_head

    while h1 != nil && h2 != nil {
        if h1!.val <= h2!.val {
            ret_tail?.next = h1
            h1 = h1?.next
        } else {
            ret_tail?.next = h2
            h2 = h2?.next
        }

        ret_tail = ret_tail?.next
    }

    ret_tail?.next = h1 == nil ? h2 : h1

    return ret_head.next
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

let a = ListNode(1)
a.next = ListNode(2)
a.next?.next = ListNode(4)
a.next?.next?.next = nil

let b = ListNode(1)
b.next = ListNode(3)
b.next?.next = ListNode(4)
b.next?.next?.next = nil

a.echo()
print("")
b.echo()

let ret = mergeTwoLists(a, b)
print("")
ret?.echo()


