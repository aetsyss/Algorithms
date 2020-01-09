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

extension TreeNode {
    func print() {
        var q = [self]
        while !q.isEmpty {
            let size = q.count

            for _ in 0..<size {
                let cur = q.removeFirst()
                Swift.print("\(cur.val)", separator: " ", terminator: " ")
                if let l = cur.left { q.append(l) }
                if let r = cur.right { q.append(r) }
            }

            Swift.print("")
        }
    }
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }

    let r = invertTree(root?.right)
    let l = invertTree(root?.left)

    root?.left = r
    root?.right = l

    return root
}

let root = TreeNode(4)
root.left = TreeNode(2)
root.right = TreeNode(7)
root.left?.left = TreeNode(1)
root.left?.right = TreeNode(3)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(9)

root.print()
print("\n\n")

let inverted_tree = invertTree(root)
inverted_tree?.print()


