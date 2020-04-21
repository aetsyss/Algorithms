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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ret: [Int] = []
        var q = [root]

        while !q.isEmpty {
            let count = q.count
            var x: TreeNode?
            for _ in 0..<count {
                x = q.removeFirst()

                if let left = x?.left {
                    q.append(left)
                }

                if let right = x?.right {
                    q.append(right)
                }
            }

            if  let val = x?.val {
                ret.append(val)
            }
        }


        return ret
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.right = TreeNode(5)
root.right?.right = TreeNode(4)
root.left?.right?.left = TreeNode(6)

let s = Solution()
s.rightSideView(root)
