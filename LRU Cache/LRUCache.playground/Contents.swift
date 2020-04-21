import Foundation

class LRUCache {

    class Node {
        var key: Int
        var value: Int
        var next: Node?
        var prev: Node?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
            self.next = nil
            self.prev = nil
        }
    }

    private var size: Int
    private let capacity: Int
    private var cache: [Int: Node] = [:]
    private let head: Node
    private let tail: Node

    init(_ capacity: Int) {
        self.size = 0
        self.capacity = capacity
        head = Node(key: 0, value: 0)
        tail = Node(key: 0, value: 0)
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if let val = cache[key] {
            moveNodeToHead(val)
            return val.value
        } else {
            return -1
        }
    }

    private func moveNodeToHead(_ node: Node) {
        deleteNode(node)
        addNodeToHead(node)
    }

    private func deleteNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func addNodeToHead(_ node: Node) {
        let second = head.next
        head.next = node
        node.prev = head

        second?.prev = node
        node.next = second
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveNodeToHead(node)
        } else {
            let node = Node(key: key, value: value)
            cache[key] = node

            addNodeToHead(node)

            size += 1

            if size > capacity {
                let node = popNodeFromTail()
                cache[node.key] = nil
                size -= 1
            }
        }
    }

    private func popNodeFromTail() -> Node {
        let node = tail.prev!
        deleteNode(node)
        return node
    }
}

let cache = LRUCache(2)
cache.put(1, 1)
cache.put(2, 2)
cache.get(1)
cache.put(3, 3)
cache.get(2)

