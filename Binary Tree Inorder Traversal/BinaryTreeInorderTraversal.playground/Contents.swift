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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var next = root
    var ret: [Int] = []
    var stack: [TreeNode] = []

    while next != nil || !stack.isEmpty {
        while next != nil {
            stack.insert(next!, at: 0)
            next = next?.left
        }

        let a = stack.removeFirst()
        ret.append(a.val)

        next = a.right
    }

    return ret
}

let node = TreeNode(7)
node.left = TreeNode(6)
node.right = TreeNode(8)
node.left?.left = TreeNode(2)
node.left?.left?.left = TreeNode(1)
node.left?.left?.right = TreeNode(5)
node.left?.left?.right?.left = TreeNode(4)
node.left?.left?.right?.left?.left = TreeNode(3)

inorderTraversal(node)
