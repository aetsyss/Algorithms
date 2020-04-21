import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        swap(&s, 0)
    }

    private func swap(_ s: inout [Character], _ index: Int) {
        if index >= s.count - 1 - index {
            return
        }

        let tmp = s[index]
        s[index] = s[s.count - 1 - index]
        s[s.count - 1 - index] = tmp

        swap(&s, index + 1)
    }
}

let s = Solution()
var arr: [Character] = ["h","e","l","l","o"]
s.reverseString(&arr)
arr
