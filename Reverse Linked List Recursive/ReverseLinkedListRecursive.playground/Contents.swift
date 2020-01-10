import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

extension ListNode {
    func print() {
        var cur: ListNode? = self
        while cur != nil {
            Swift.print("\(cur!.val)", terminator: " -> ")
            cur = cur?.next
        }
    }
}

func reverse(_ n: ListNode?) -> ListNode? {
    if n == nil || n?.next == nil {
        return n
    }

    let rest = reverse(n?.next)
    n?.next?.next = n

    n?.next = nil

    return rest
}

let node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(3)
node.next?.next?.next = ListNode(4)

node.print()
print("")
let rev = reverse(node)
rev!.print()
