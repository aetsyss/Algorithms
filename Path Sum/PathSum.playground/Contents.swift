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

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let root = root else { return false }

    if root.left == nil && root.right == nil { return sum - root.val == 0 }

    return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
}

let root = TreeNode(5)
root.left = TreeNode(4)
root.right = TreeNode(8)
root.left?.left = TreeNode(11)
root.left?.left?.left = TreeNode(7)
root.left?.left?.right = TreeNode(2)
root.right?.left = TreeNode(13)
root.right?.right = TreeNode(4)
root.right?.right?.right = TreeNode(1)

hasPathSum(root, 22)
