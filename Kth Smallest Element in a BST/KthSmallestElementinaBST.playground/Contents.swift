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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var p = root
        var s: [TreeNode] = []
        var counter = 0
        while !s.isEmpty || p != nil {
            while p != nil {
                s.append(p!)
                p = p?.left
            }

            let x = s.removeLast()
            counter += 1
            if counter == k {
                return x.val
            }

            p = x.right
        }

        return 0
    }
}

let root = TreeNode(50)
root.left = TreeNode(30)
root.left?.left = TreeNode(20)
root.left?.left?.left = TreeNode(10)
root.left?.right = TreeNode(40)
root.right = TreeNode(60)

let s = Solution()
s.kthSmallest(root, 3)
