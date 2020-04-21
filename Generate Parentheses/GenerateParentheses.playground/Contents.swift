import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        }

        var q = ["()"]

        for _ in 0..<n-1 {

            let count = q.count
            var s: Set<String> = Set()

            for _ in 0..<count {
                let x = q.removeFirst()

                for j in 0..<x.count + 1 {
                    var str = x
                    str.insert(contentsOf: "()", at: str.index(x.startIndex, offsetBy: j))
                    s.insert(str)
                }
            }

            q.append(contentsOf: s)
        }

        return q
    }
}

let s = Solution()
s.generateParenthesis(3)
