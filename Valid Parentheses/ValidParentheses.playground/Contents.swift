import Foundation

class Stack<T> {
    private var arr: [T]
    init() {
        arr = []
    }

    func push(_ x: T) {
        arr.append(x)
    }

    func pop() {
        arr.popLast()
    }

    func top() -> T {
        return arr.last!
    }

    var isEmpty: Bool {
        return arr.isEmpty
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        let dict: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        let stack = Stack<Character>()

        for ch in s {
            if let open = dict[ch] {
                if stack.isEmpty {
                    return false
                } else if stack.top() != open {
                    return false
                } else {
                    stack.pop()
                }
            } else {
                stack.push(ch)
            }
        }

        return stack.isEmpty
    }
}

let s = Solution()
s.isValid("([)]")
