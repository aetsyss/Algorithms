import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    var visited: [Int: Node] = [:]
    var vis: Set<Int> = Set()

    func cloneGraph(_ node: Node?) -> Node? {
        if let node = node {
            let new = Node(node.val)
            visited[node.val] = new

            clone(node, new)
            return new
        } else {
            return nil
        }
    }

    private func clone(_ node: Node, _ new: Node) {
        for n in node.neighbors.compactMap({ $0 }) {

            if let nn = visited[n.val] {
                new.neighbors.append(nn)
            } else {
                let nn = Node(n.val)
                new.neighbors.append(nn)
                visited[n.val] = nn
                clone(n, nn)
            }
        }
    }

    func df_travers(_ node: Node?) {
        if let node = node {
            vis.removeAll()
            vis.insert(node.val)

            dfs(node)
        }
    }

    private func dfs(_ node: Node) {
        print("\(node.val): \(node.neighbors.compactMap({ $0?.val }))")
        for n in node.neighbors.compactMap({ $0 }) where !vis.contains(n.val) {
            vis.insert(n.val)
            dfs(n)
        }
    }

}

let n1 = Node(1)
let n2 = Node(2)
let n3 = Node(3)
let n4 = Node(4)
//let n5 = Node(5)
//let n6 = Node(6)
//let n7 = Node(7)
//let n8 = Node(8)

//n1.neighbors = [n2, n3, n4]
//n2.neighbors = [n1, n3]
//n3.neighbors = [n1, n2, n6]
//n4.neighbors = [n1, n5]
//n5.neighbors = [n4, n7]
//n6.neighbors = [n3, n7]
//n7.neighbors = [n5, n6]

n1.neighbors = [n2, n4]
n2.neighbors = [n1, n3]
n3.neighbors = [n2, n4]
n4.neighbors = [n1, n3]

let s = Solution()
s.df_travers(n1)

print("-----")
let new = s.cloneGraph(n1)
s.df_travers(new)
