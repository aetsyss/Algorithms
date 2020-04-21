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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, min: .min, max: .max)
    }

    private func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let root = root else {
            return true
        }

        return root.val > min
            && root.val < max
            && isValidBST(root.left, min: min, max: root.val)
            && isValidBST(root.right, min: root.val, max: max)
    }
}

let root = TreeNode(7)
root.left = TreeNode(5)
root.right = TreeNode(10)
root.left?.left = TreeNode(3)
root.left?.right = TreeNode(6)
root.right?.left = TreeNode(8)
root.right?.right = TreeNode(15)
root.right?.right?.left = TreeNode(14)
root.right?.right?.right = TreeNode(10)

let s = Solution()
s.isValidBST(root)
