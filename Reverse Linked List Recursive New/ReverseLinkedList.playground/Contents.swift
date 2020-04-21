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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        return revNodes(nil, head)
    }

    private func revNodes(_ first: ListNode?, _ second: ListNode?) -> ListNode? {
        let tmp = second?.next
        second?.next = first

        if tmp == nil {
            return second
        } else {
            return revNodes(second, tmp)
        }
    }
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)

print(list: head)
print("")

let s = Solution()
let rev = s.reverseList(head)
print(list: rev)
