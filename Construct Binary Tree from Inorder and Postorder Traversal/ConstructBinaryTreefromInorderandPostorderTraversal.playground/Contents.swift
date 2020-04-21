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


func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    return buildTree(inorder, postorder, index: postorder.count - 1)
}

func buildTree(_ inorder: [Int], _ postorder: [Int], index: Int) -> TreeNode? {
    if index < 0 || inorder.isEmpty { return nil }

    print("--------------------------")

    var ind = index
    while inorder.firstIndex(of: postorder[ind]) == nil {
        ind -= 1
        if ind < 0 { return nil }
    }

    let element = postorder[ind]
    let node = TreeNode(element)
    let i = inorder.firstIndex(of: element)!
    print("element: \(element) in \(inorder), i: \(i)")


    let left = Array(inorder.prefix(i))
    print("left: \(left)")
    node.left = buildTree(left, postorder, index: ind - 1)

    if inorder.count - i - 1 >= 0 {
        let right = Array(inorder.suffix(inorder.count - i - 1))
        print("right: \(right)")
        node.right = buildTree(right, postorder, index: ind - 1)
    }

    return node
}

let inorder = [9,3,15,20,7]
let postorder = [9,15,7,20,3]

let ret = buildTree(inorder, postorder)
ret?.print()
