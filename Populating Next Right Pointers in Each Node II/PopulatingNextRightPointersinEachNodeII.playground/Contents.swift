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
    var q: [Node] = []
    if let root = root { q.append(root) }

    while !q.isEmpty {
        let size = q.count
        var prev: Node? = nil

        for _ in 0..<size {
            let element = q.removeFirst()

            prev?.next = element

            if let left = element.left { q.append(left) }
            if let right = element.right { q.append(right) }

            prev = element
        }
    }

    return root
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.right = Node(7)

connect(root)

root.left?.right?.next
