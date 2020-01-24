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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var ret: [Int] = []
    var stack: [TreeNode] = []

    if let root = root {
        stack.insert(root, at: 0)
    }

    while !stack.isEmpty {
        let el = stack.removeFirst()
        ret.append(el.val)

        if let r = el.right { stack.insert(r, at: 0) }
        if let l = el.left { stack.insert(l, at: 0) }
    }

    return ret
}

let node = TreeNode(1)
node.left = TreeNode(2)
node.right = TreeNode(5)
node.left?.left = TreeNode(3)
node.left?.right = TreeNode(4)
node.right?.left = TreeNode(6)
node.right?.right = TreeNode(7)

preorderTraversal(node)
