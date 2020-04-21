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

    // recursive
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }

        return p!.val == q!.val
            && isSameTree(p?.left, q?.left)
            && isSameTree(p?.right, q?.right)
    }

    // iteration
    func isSameTreeIterative(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pp = [p]
        var qq = [q]

        while !pp.isEmpty {
            let a = pp.removeFirst()
            let b = qq.removeFirst()

            if a == nil && b == nil {}
            else if a == nil || b == nil { return false }
            else if a!.val != b!.val { return false }

            if let aa = a {
                pp.append(aa.left)
                pp.append(aa.right)
            }

            if let bb = b {
                qq.append(bb.left)
                qq.append(bb.right)
            }
        }

        return qq.isEmpty
    }
}

let p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(3)

let q = TreeNode(1)
q.left = TreeNode(2)
q.right = TreeNode(3)
q.left?.left = TreeNode(4)

let s = Solution()

s.isSameTree(p, q)
s.isSameTreeIterative(p, q)

