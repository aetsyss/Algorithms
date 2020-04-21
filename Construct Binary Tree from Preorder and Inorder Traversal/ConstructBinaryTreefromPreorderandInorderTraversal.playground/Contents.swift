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

let preorder = [3,9,20,15,7]
let inorder = [9,3,15,20,7]

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty { return nil }

    let element = preorder[0]
    let node = TreeNode(element)

    let index = inorder.firstIndex(of: element)!
    let preorder_left = Array(preorder.dropFirst().prefix(index))
    let preorder_right = Array(preorder.dropFirst().suffix(preorder.count - 1 - index))

    let inorder_left = Array(inorder.prefix(index))
    let inorder_right = Array(inorder.suffix(inorder.count - 1 - index))

    node.left = buildTree(preorder_left, inorder_left)
    node.right = buildTree(preorder_right, inorder_right)

    return node
}

let ret = buildTree(preorder, inorder)
ret?.print()
