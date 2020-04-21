import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        "\(val)"
    }
}

func connect(_ root: Node?) -> Node? {
    connect(root?.left, root?.right)
    return root
}

func connect(_ a: Node?, _ b: Node?) {
    if a == nil || b == nil { return }

    var i = a, j = b
    while i != nil && j != nil {
        i?.next = j
        i = i?.right
        j = j?.left
    }

    connect(a?.left, a?.right)
    connect(b?.left, b?.right)
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.left = Node(6)
root.right?.right = Node(7)

root.left?.left?.left = Node(8)
root.left?.left?.right = Node(9)
root.left?.right?.left = Node(10)
root.left?.right?.right = Node(11)
root.right?.left?.left = Node(12)
root.right?.left?.right = Node(13)
root.right?.right?.left = Node(14)
root.right?.right?.right = Node(15)

connect(root)
print(root.left?.right?.right?.next)
