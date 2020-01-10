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

func dfsRecursive(_ node: TreeNode) -> [Int] {
    var ret: [Int] = []

    if let l = node.left { ret.append(contentsOf: dfsRecursive(l)) }
    ret.append(node.val)
    if let r = node.right { ret.append(contentsOf: dfsRecursive(r)) }

    return ret
}

func dfsIterative(_ node: TreeNode) -> [Int] {
    var ret: [Int] = []
    var stack: [TreeNode] = []
    var cur: TreeNode? = node

    while cur != nil || !stack.isEmpty {
        while cur != nil {
            stack.append(cur!)
            cur = cur?.left
        }

        cur = stack.removeLast()
        ret.append(cur!.val)
        cur = cur?.right
    }

    return ret
}

let s = TreeNode(5)
s.left = TreeNode(3)
s.right = TreeNode(8)
s.left?.left = TreeNode(2)
s.right?.left = TreeNode(7)
s.right?.right = TreeNode(15)
s.left?.left?.left = TreeNode(1)
s.left?.left?.right = TreeNode(4)

s.print()
print("")
print(dfsRecursive(s))
print("")
print(dfsIterative(s))
