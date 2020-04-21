import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let l1 = len(headA)
        let l2 = len(headB)

        var a = headA
        var b = headB

        if l1 > l2 {
            for _ in 0..<(l1 - l2) {
                a = a?.next
            }
        } else if l2 > l1 {
            for _ in 0..<(l2 - l1) {
                b = b?.next
            }
        }

        while a != nil || b != nil {
            if a === b {
                return a
            }

            a = a?.next
            b = b?.next
        }

        return nil
    }

    func len(_ list: ListNode?) -> Int {
        return list == nil ? 0 : 1 + len(list?.next)
    }
}

func p(_ list: ListNode?) {
    guard let list = list else { return }
    print(list.val, terminator: " -> ")
    p(list.next)
}

let a = ListNode(1)
a.next = ListNode(2)
a.next?.next = ListNode(3)
a.next?.next?.next = ListNode(4)
a.next?.next?.next?.next = ListNode(5)

let b = ListNode(100)
b.next = a.next?.next

p(a)
print("")
p(b)

let s = Solution()
s.len(a)
s.len(b)

let r = s.getIntersectionNode(a, b)
r?.val

class MyView: UIView {
    override func layoutSubviews() {
        print("layoutSubviews")
    }
}

let view = MyView()
view.setNeedsLayout()
view.layoutIfNeeded()


