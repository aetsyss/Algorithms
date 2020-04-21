import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var a, b, head: TreeNode?

    func convert(_ root: TreeNode?) {
        convert1(root)
        head?.left = b
        b?.right = head
    }

    private func convert1(_ root: TreeNode?) {
        guard let root = root else {
            return
        }

        convert1(root.left)
        print(root.val)
        visit(root)
        convert1(root.right)
    }

    private func visit(_ node: TreeNode) {
        if a == nil && b == nil {
            head = node
            a = node
            b = node
        } else if b == nil {
            b = node
        } else {
            a = b
            b = node

            a?.right = b
            b?.left = a
        }
    }
}

let root = TreeNode(4)
root.left = TreeNode(2)
root.left?.left = TreeNode(1)
root.left?.right = TreeNode(3)
root.right = TreeNode(5)

let s = Solution()
s.convert(root)

s.head?.val
s.head?.right?.val
s.head?.right?.right?.val
s.head?.right?.right?.right?.val
s.head?.right?.right?.right?.right?.val

s.head?.left?.val
s.head?.right?.left?.val
s.head?.right?.right?.left?.val
s.head?.right?.right?.right?.left?.val
s.head?.right?.right?.right?.right?.left?.val
s.head?.right?.right?.right?.right?.right?.left?.val
