import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func print(list l: ListNode?) {
    guard let l = l else {
        return
    }

    print(l.val, terminator: " -> ")
    print(list: l.next)
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // base case
        guard let l1 = l1 else {
            return l2
        }

        guard let l2 = l2 else {
            return l1
        }

        let n: ListNode

        if l1.val <= l2.val {
            n = ListNode(l1.val)
            n.next = mergeTwoLists(l1.next, l2)
        } else {
            n = ListNode(l2.val)
            n.next = mergeTwoLists(l1, l2.next)
        }

        return n
    }
}

let l1 = ListNode(5)
l1.next = ListNode(10)
l1.next?.next = ListNode(15)

let l2 = ListNode(2)
l2.next = ListNode(12)
l2.next?.next = ListNode(17)

print(list: l1)
print("")
print(list: l2)
print("")

let s = Solution()
let ret = s.mergeTwoLists(l1, l2)

print(list: ret)
