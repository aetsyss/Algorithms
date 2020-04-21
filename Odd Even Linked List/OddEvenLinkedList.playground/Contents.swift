import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func pr(_ list: ListNode?) {
    guard let list = list else { return }
    print(list.val, terminator: " -> ")
    pr(list.next)
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let head1 = head?.next

        var a, b: ListNode?
        a = head
        b = head?.next

        while a != nil {
            a?.next = b?.next
            b?.next = b?.next?.next

            if a?.next == nil {
                a?.next = head1
                break
            }

            a = a?.next
            b = b?.next
        }

        return head
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)
//head.next?.next?.next?.next?.next = ListNode(6)

let s = Solution()
pr(head)
print("")
s.oddEvenList(head)
print("")
pr(head)
