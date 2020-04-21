import Foundation

class Stack: CustomStringConvertible {
    private var arr: [Int]
    init() {
        arr = []
    }

    func push(_ x: Int) {
        arr.append(x)
    }

    func pop() {
        arr.popLast()
    }

    func top() -> Int {
        return arr.last!
    }

    var isEmpty: Bool {
        return arr.isEmpty
    }

    var description: String {
        return arr.map(String.init).joined(separator: ", ")
    }
}

class MinStack {

    private let stack: Stack
    private let min_stack: Stack

    /** initialize your data structure here. */
    init() {
        stack = Stack()
        min_stack = Stack()
    }

    func push(_ x: Int) {
        stack.push(x)

        if min_stack.isEmpty {
            min_stack.push(x)
        } else {
            if x <= min_stack.top() {
                min_stack.push(x)
            }
        }
    }

    func pop() {
        let x = stack.top()
        stack.pop()

        if x == min_stack.top() {
            min_stack.pop()
        }
    }

    func top() -> Int {
        return stack.top()
    }

    func getMin() -> Int {
        return min_stack.top()
    }
}

let ms = MinStack()
ms.push(0)
ms.push(1)
ms.push(0)
ms.getMin()
ms.pop()
ms.getMin()

