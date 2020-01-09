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

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }

    return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}

func maxDepth1(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }

    var dq: [TreeNode] = [root!]
    var ret = 0

    while !dq.isEmpty {
        ret += 1
        let size = dq.count

        for _ in 0..<size {
            let cur = dq.removeFirst()

            if let left = cur.left { dq.append(left) }
            if let right = cur.right { dq.append(right) }
        }
    }

    return ret
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

maxDepth1(root)
maxDepth1(root)
