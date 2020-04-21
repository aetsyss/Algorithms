import Foundation

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var open: [Int] = []
        var del: Set<Int> = Set()

        for ch in s.enumerated() {
            if ch.element == "(" {
                open.append(ch.offset)
            }

            if ch.element == ")" {
                if !open.isEmpty {
                    open.removeLast()
                } else {
                    del.insert(ch.offset)
                }
            }
        }

        open.forEach({ del.insert($0) })

        var ret = ""
        for ch in s.enumerated() {
            if !del.contains(ch.offset) {
                ret = ret + "\(ch.element)"
            }
        }

        return ret
    }
}

let s = Solution()
s.minRemoveToMakeValid("lee(t(c)o)de)")
s.minRemoveToMakeValid("a)b(c)d")
s.minRemoveToMakeValid("))((")
s.minRemoveToMakeValid("(a(b(c)d)")
s.minRemoveToMakeValid("())()(((")
