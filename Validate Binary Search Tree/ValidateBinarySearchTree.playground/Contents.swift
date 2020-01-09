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

func isValidBST(_ root: TreeNode?) -> Bool {
    let array = toArray(root)
    if array.count < 2 { return true }

    for j in 0..<array.count - 1 {
        if array[j] >= array[j+1] {
            return false
        }
    }

    return true
}

func toArray(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var ret: [Int] = []

    if let l = root.left { ret.append(contentsOf: toArray(l)) }
    ret.append(root.val)
    if let r = root.right { ret.append(contentsOf: toArray(r)) }

    return ret
}

let t1 = TreeNode(5)
t1.left = TreeNode(1)
t1.right = TreeNode(4)
t1.right?.left = TreeNode(3)
t1.right?.right = TreeNode(6)

let t2 = TreeNode(2)
t2.left = TreeNode(1)
t2.right = TreeNode(3)

let t3 = TreeNode(5)
t3.left = TreeNode(4)
t3.left?.left = TreeNode(3)
t3.left?.left?.left = TreeNode(2)

let t4 = TreeNode(1)
t4.left = TreeNode(1)

isValidBST(t1)
isValidBST(t2)
isValidBST(t4)
