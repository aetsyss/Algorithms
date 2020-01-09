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

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return false
    }

    return isIdentical(s, t) == true || isIdentical(s!.left, t) || isIdentical(s!.right, t)
}

func isIdentical(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil && t == nil { return true }
    if s == nil && t != nil { return false }
    if s != nil && t == nil { return false }

    return s!.val == t!.val && isIdentical(s?.left, t?.left) && isIdentical(s?.right, t?.right)
}

let s = TreeNode(3)
s.left = TreeNode(4)
s.right = TreeNode(5)
s.left?.left = TreeNode(1)
s.left?.right = TreeNode(2)

let t = TreeNode(4)
t.left = TreeNode(1)
t.right = TreeNode(2)

isSubtree(s, t)
