import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ret: ListNode?
        var tail: ListNode?

        var a = l1, b = l2
        var reminder = 0

        while (a != nil || b != nil) || reminder != 0 {
            let x = a?.val ?? 0
            let y = b?.val ?? 0

            print(x, y)

            let n = ListNode((x + y + reminder) % 10)
            reminder = (x + y + reminder) / 10

            if ret == nil {
                ret = n
                tail = n
            } else {
                tail?.next = n
                tail = n
            }

            a = a?.next
            b = b?.next
        }

        return ret
    }
}

let l1 = ListNode(1)
//l1.next = ListNode(4)
//l1.next?.next = ListNode(3)
//l1.next?.next?.next = ListNode(1)

let l2 = ListNode(9)
l2.next = ListNode(9)
//l2.next?.next = ListNode(4)

let s = Solution()
let ret = s.addTwoNumbers(l1, l2)

print(ret?.val)
print(ret?.next?.val)
print(ret?.next?.next?.val)
print(ret?.next?.next?.next?.val)
