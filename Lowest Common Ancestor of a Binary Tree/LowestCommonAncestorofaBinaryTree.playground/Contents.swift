import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        "\(val)"
    }
}

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val
    }

    var hashValue: Int {
        val.hashValue
    }
}

var back: [TreeNode: TreeNode] = [:]
var count = 0

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || p == nil || q == nil { return root }

    count = 0
    makeBackConnections(root, p, q)
    var s: Set<TreeNode> = Set([p!])

    var pp = p!
    while back[pp] != nil {
        s.insert(back[pp]!)
        pp = back[pp]!
    }

    print(s)

    if s.contains(q!) {
        return q
    }
    
    pp = q!
    
    while back[pp] != nil {
        if s.contains(back[pp]!) {
            return back[pp]
        }
        pp = back[pp]!
    }

    return s.first
}

func makeBackConnections(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) {
    if count >= 2 { return }
    if root == nil || p == nil || q == nil { return }
    if root === p || root == q { count += 1 }

    if let left = root?.left {
        back[left] = root
        makeBackConnections(left, p, q)
    }

    if let right = root?.right {
        back[right] = root
        makeBackConnections(right, p, q)
    }
}

let root = TreeNode(3)
root.left = TreeNode(5)
root.right = TreeNode(1)
root.left?.left = TreeNode(6)
root.left?.right = TreeNode(2)
root.right?.left = TreeNode(0)
root.right?.right = TreeNode(8)
root.left?.right?.left = TreeNode(7)
root.left?.right?.right = TreeNode(4)

lowestCommonAncestor(root, root.left?.left, root.left)

print("back: \(back)")
