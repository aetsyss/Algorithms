import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func print(list: ListNode?) {
    guard let list = list else {
        return
    }

    print(list.val, terminator: " -> ")
    print(list: list.next)
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil {
            return head
        }

        let remaining = swapPairs(head?.next?.next)

        let second = head?.next
        second?.next = head
        head?.next = remaining

        return second
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)

print(list: head)
print("")

let s = Solution()
let rev = s.swapPairs(head)
print(list: rev)
