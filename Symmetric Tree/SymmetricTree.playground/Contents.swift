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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMir(a: root?.left, b: root?.right)
}

func isMir(a: TreeNode?, b: TreeNode?) -> Bool {
    if a == nil && b == nil { return true }
    if a == nil || b == nil { return false }
    return a!.val == b!.val && isMir(a: a?.left, b: b?.right) && isMir(a: a?.right, b: b?.left)
}


let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(2)
root.left?.left = TreeNode(3)
root.left?.right = TreeNode(4)
root.right?.left = TreeNode(4)
root.right?.right = TreeNode(3)

isSymmetric(root)
