import Foundation

class Solution {

    func numSquares(_ n: Int) -> Int {
        if n < 1 { return 0 }

        var psn: Set<Int> = Set([])
        var j = 1
        while j * j <= n {
            psn.insert(j * j)
            j += 1
        }

        var ret = 1
        var q = Set([n])
        var qq: Set<Int> = Set([])

        while !q.isEmpty {
            let count = q.count

            qq.removeAll()
            for _ in 0..<count {
                let x = q.removeFirst()

                if psn.contains(x) {
                    return ret
                }

                for p in psn {
                    if x - p >= 0 {
                        qq.insert(x - p)
                    }
                }
            }

            q = qq

            ret += 1
        }
        return -1
    }
}

let s = Solution()
s.numSquares(1)
