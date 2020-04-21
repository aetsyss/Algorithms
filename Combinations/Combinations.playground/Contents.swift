import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < 1 || k < 1 || n < k {
            return []
        }

        return combine(n, k, 1)
    }

    private func combine(_ n: Int, _ k: Int, _ s: Int) -> [[Int]] {
        if k == 0 {
            return []
        }

        if k == 1 {
            return (s...n).map({ [$0] })
        }

        var ret: [[Int]] = []

        for j in s...n - k + 1 {
            let arr: [[Int]] = combine(n, k - 1, j + 1).map({
                var r = [j]
                r.append(contentsOf: $0)
                return r
            })

            ret.append(contentsOf: arr)
        }

        return ret
    }

}

let s = Solution()
s.combine(4, 3)
