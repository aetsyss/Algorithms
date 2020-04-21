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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var q = [root]
        var ret: [[Int]] = []

        var fl = true

        while !q.isEmpty {
            let count = q.count
            var arr: [Int] = []

            for _ in 0..<count {
                let x = q.removeFirst()
                arr.append(x.val)

                if let left = x.left {
                    q.append(left)
                }

                if let right = x.right {
                    q.append(right)
                }
            }

            if fl == true {
                ret.append(arr)
            } else {
                ret.append(arr.reversed())
            }

            fl.toggle()
        }

        return ret
    }
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

let s = Solution()
s.zigzagLevelOrder(root)
