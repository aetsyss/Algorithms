import UIKit

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

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var ret: [Int] = []
    var stack: [TreeNode] = []

    if let root = root {
        stack.insert(root, at: 0)
    }

    while !stack.isEmpty {
        let a = stack.removeFirst()
        ret.insert(a.val, at: 0)

        if let l = a.left {
            stack.insert(l, at: 0)
        }

        if let r = a.right {
            stack.insert(r, at: 0)
        }
    }

    return ret
}

func postorderTraversalRecursive(_ root: TreeNode?) -> [Int] {
    var ret: [Int] = []
    postorderTraversalRecursive(root, arr: &ret)
    return ret
}

func postorderTraversalRecursive(_ node: TreeNode?, arr: inout [Int]) {
    if node == nil { return }
    postorderTraversalRecursive(node?.left, arr: &arr)
    postorderTraversalRecursive(node?.right, arr: &arr)
    arr.append(node!.val)
}

let s = TreeNode(9)
s.left = TreeNode(5)
s.right = TreeNode(8)
s.left?.left = TreeNode(1)
s.left?.right = TreeNode(4)
s.left?.right?.left = TreeNode(2)
s.left?.right?.right = TreeNode(3)
s.right?.right = TreeNode(7)
s.right?.right?.left = TreeNode(6)

s.print()

print("")
print(postorderTraversal(s))

print("")
print(postorderTraversalRecursive(s))
