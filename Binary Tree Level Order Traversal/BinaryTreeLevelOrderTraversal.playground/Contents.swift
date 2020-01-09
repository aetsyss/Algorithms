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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }

    var ret: [[Int]] = []
    var row: [Int] = []
    var q = [root!]

    while !q.isEmpty {
        let size = q.count
        for _ in 0..<size {
            let node = q.removeFirst()
            row.append(node.val)

            if let l = node.left { q.append(l) }
            if let r = node.right { q.append(r) }
        }

        ret.append(row)
        row.removeAll()
    }
    
    return ret
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

levelOrder(root)
