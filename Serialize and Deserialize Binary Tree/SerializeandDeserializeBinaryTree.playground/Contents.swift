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

extension TreeNode {
    convenience init?(string: String) {
        if let num = Int(string) {
            self.init(num)
        } else {
            return nil
        }
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        "\(val)"
    }
}

func nodeToString(node: TreeNode?) -> String {
    guard let node = node else { return "*" }
    return String(node.val)
}

func serialize(_ root: TreeNode?) -> String {
    var arr: [String] = []
    preorder(root, arr: &arr)
    return arr.joined(separator: ",")
}

func preorder(_ root: TreeNode?, arr: inout [String]) {
    arr.append(nodeToString(node: root))
    if root != nil {
        preorder(root?.left, arr: &arr)
        preorder(root?.right, arr: &arr)
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.right?.left = TreeNode(4)
root.right?.right = TreeNode(5)

//let root = TreeNode(5)
//root.left = TreeNode(2)
//root.right = TreeNode(3)
//root.right?.left = TreeNode(2)
//root.right?.right = TreeNode(4)
//root.right?.left?.left = TreeNode(3)
//root.right?.left?.right = TreeNode(1)

let str = serialize(root)

func deserialize(_ data: String) -> TreeNode? {
    let arr = Array(data.split(separator: ",").map(String.init))

    var index = 0
    return deserialize_helper(arr, index: &index)
}

func deserialize_helper(_ arr: [String], index: inout Int) -> TreeNode? {
    if arr.isEmpty {
        return nil
    }

    if arr[index] == "*" {
        return nil
    } else {
        let node = TreeNode(string: arr[index])
        index += 1
        node?.left = deserialize_helper(arr, index: &index)
        index += 1
        node?.right = deserialize_helper(arr, index: &index)

        return node
    }
}

let node = deserialize(str)
serialize(node)
