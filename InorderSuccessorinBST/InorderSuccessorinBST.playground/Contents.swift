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
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        var q = root
        var s: [TreeNode] = []
        var fl = false

        while !s.isEmpty || q != nil {
            while q != nil {
                s.append(q!)
                q = q?.left
            }

            let x = s.removeLast()
            print(x.val)

            if fl == true {
                return x
            }

            if x === p {
                fl = true
            }

            q = x.right
        }

        return nil
    }
}

let root = TreeNode(5)
root.left = TreeNode(3)
root.left?.left = TreeNode(2)
root.left?.left?.left = TreeNode(1)
root.left?.right = TreeNode(4)
root.right = TreeNode(6)

let s = Solution()
s.inorderSuccessor(root, root.left?.left)?.val
